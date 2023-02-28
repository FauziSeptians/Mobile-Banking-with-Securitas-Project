
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/pages/QRIS/qrispage.dart';
import 'package:uangin/pages/newspage.dart';
import 'package:uangin/pages/saham/sahammorepage.dart';
import 'package:uangin/pages/tarikTunai/tariktunaipage.dart';
import 'package:uangin/pages/transfer/transferpage.dart';
import 'package:vibration/vibration.dart';
import '/classes/io_thing.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:uangin/pages/setortunaipage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;



class Home extends StatefulWidget {
  const Home({Key? key, required this.user}) : super(key: key);

  final AsyncSnapshot<User?> user;

  @override
  State<Home> createState() => _HomeState();
}

AsyncSnapshot<User?>? Fireuser;

class _HomeState extends State<Home> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  LocalAuthentication auth = LocalAuthentication();
  String nowUser = '';

  String? _shortName = 'MK';
  String? firstName;
  String? lastName;
  bool isLoading = true;

  final String _notificationPath = 'assets/Icon/notification.png';

  final StrStorage _primaryStorage = StrStorage('primary');
  final StrStorage _secondaryStorage = StrStorage('secondary');

  int _balancePrimary = -999;
  String _balanceSecondary = ',00';

  PageController promoController = PageController(viewportFraction: 0.65);
  var _currPromo = 0.0;

  PageController tutorialController = PageController(viewportFraction: 0.65);
  var _currTutorial = 0.0;
  

  void primaryTestWrite(int amount) async {
    await _primaryStorage.writeCounter(amount);
  }
  // Future<void> readTest() async {
  //   _balancePrimary = await _primaryStorage.readCounter;
  // }

  MoneyFormatter? _strBalPrimary;

  bool _isSaham = true;

  List<String> promo = [
    "assets/promo1.png",
    "assets/promo2.png",
  ];

  List<String> tutorial = [
    "assets/tutorial1.png",
    "assets/promo1.png",
  ];

  FToast? fToast;

  //create list of map
  List<Map<String, dynamic>> _saham = [];
  List<Map<String, dynamic>> _saham2 = [];

  void fetchSaham () async{

    var response = await http.get(Uri.parse('https://api.goapi.id/v1/stock/idx/trending?api_key=cIeUpWfAHUjiVqQzovgXetbm5ZfoDq'));
    var response2 = await http.get(Uri.parse('https://api.goapi.id/v1/stock/idx/companies?api_key=cIeUpWfAHUjiVqQzovgXetbm5ZfoDq'));

    

    if (jsonDecode(response.body)['data']['count'] < 4) {
      response = await http.get(Uri.parse('https://api.goapi.id/v1/stock/idx/top_gainer?api_key=cIeUpWfAHUjiVqQzovgXetbm5ZfoDq'));
    }


    var data = jsonDecode(response.body);
    var ticker = data['data']['results'].map((e) => e['ticker']).toList();
    for (var i = 0; i < 4; i++) {
      _saham2.add(data['data']['results'][i]);
    }

    var data2 = jsonDecode(response2.body);

    for (var i = 0; i < 4; i++) {
      var filteredData = data2['data']['results'].where((element) => element['ticker'] == ticker[i]).toList();
      _saham.add(filteredData[0]);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    debugPrint('init');
    fetchSaham();
    fetchKategori();
    fToast = FToast();
    fToast!.init(context);
    
    CollectionReference users = firestore.collection("users");
    users.doc(widget.user.data!.email).get().then((value) {
      firstName = value['firstName'];
      lastName = value['lastName'];
      _shortName = firstName![0] + lastName![0];
      _hiddenBalance = value['showBalance1'];
      _balancePrimary = value['balance'];
      dev.log( _balancePrimary.toString());
    });
    setState(() {
      isLoading = true;
    });
    Fireuser = widget.user;
    nowUser = Fireuser!.data!.email.toString();


    super.initState();
    Future.delayed(const Duration(milliseconds: 350), () {
      if (_strBalPrimary?.output.symbolOnLeft == 'Rp -999') {
        setState(() {});
      }
    });
    promoController.addListener(() {
      setState(() {
        _currPromo = promoController.page!;
      });
    });
    tutorialController.addListener(() {
      setState(() {
        _currTutorial = tutorialController.page!;
      });
    });
    
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    
    CollectionReference users = firestore.collection("users");
    await users.doc(widget.user.data!.email).get().then((value) {
      firstName = value['firstName'];
      lastName = value['lastName'];
      _shortName = firstName![0] + lastName![0];
      _hiddenBalance = value['showBalance1'];
      _balancePrimary = value['balance'];
      dev.log( _balancePrimary.toString());
    });


    fetchKategori();

    setState(() {
      
    });
    
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void fetchKategori () async {
    kategori.clear();
    _kategoriFormatter.clear();
    await firestore.collection('portofolio').doc(widget.user.data!.email).get().then((value) {

      setState(() {
        kategori = value.get('kategori');
        
      });
    
      dev.log(kategori.toString());

    });

    for (var i = 0; i < kategori.length; i++) {
      _kategoriFormatter.add(
        [
          MoneyFormatter(
            amount: kategori[i]['terpakai'].toDouble(),
            settings: MoneyFormatterSettings(
              symbol: 'Rp',
              thousandSeparator: '.',
              decimalSeparator: ',',
              symbolAndNumberSeparator: ' ',
              fractionDigits: 0,
              compactFormatType: CompactFormatType.short,
            )
          ),
          MoneyFormatter(
            amount: kategori[i]['batas'].toDouble(),
            settings: MoneyFormatterSettings(
              symbol: 'Rp',
              thousandSeparator: '.',
              decimalSeparator: ',',
              symbolAndNumberSeparator: ' ',
              fractionDigits: 0,
              compactFormatType: CompactFormatType.short,
            )
          ),
        ]
      );
    }
    dev.log(_kategoriFormatter.toString());
    setState(() {
      
    });
  }

  List<dynamic> kategori = [

  ];
  List<List<MoneyFormatter>> _kategoriFormatter = [];

  bool _hiddenBalance = false;

 

  @override
  Widget build(BuildContext context) {
    BottomDialog bd = BottomDialog();
    _strBalPrimary = MoneyFormatter(
      amount: _balancePrimary.toDouble(),
      settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short,
      )
    );

    

    Widget menuSaham(List<Map<String, dynamic>> saham, List<Map<String, dynamic>> saham2) {
      return Column(
        children: [
          // emiten 1
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            height: 70,
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100), bottom: BorderSide(color: Colors.grey.shade100))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                      Image.network(saham[0]['logo'], width: 50, height: 50),
                      const SizedBox(width: 15),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(saham[0]['ticker'], style: const TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                            const SizedBox(height: 3),
                            Container(
                              width: 195,
                              child: Text(saham[0]['name'], style: const TextStyle( color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 12), )),
                          ]
                      ),
                    ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(saham2[0]['close'], style: const TextStyle(color: Color(0xff3D3D3D),fontWeight: FontWeight.bold,fontSize: 15, fontFamily: "OpenSans"),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          double.parse((saham2[0]['percent']).toString().substring(0, 4)) < 0  ?
                          Image.asset("assets/Icon/downTrendIcon.png", width: 10,)
                          :
                          Image.asset("assets/Icon/upTrendIcon.png", width: 10,),
                          const SizedBox(width: 5),
                          Text("${double.parse(saham2[0]['change']).round()} (${(saham2[0]['percent']).toString().substring(0, 4)}%)",style: TextStyle(color: double.parse((saham2[0]['percent']).toString().substring(0, 4)) < 0 ? Colors.red: UsedColor.primaryGreen, fontSize: 11),),
                        ],
                      ),
                    ],
                  )
                ]
              )
          ),

          //emiten 2
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            height: 70,
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100), bottom: BorderSide(color: Colors.grey.shade100))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                      Image.network(saham[1]['logo'], width: 50, height: 50),
                      const SizedBox(width: 15),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(saham[1]['ticker'], style: const TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                            const SizedBox(height: 3),
                            Container(
                              width: 195,
                              child: Text(saham[1]['name'], style: const TextStyle( color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 12), )),
                          ]
                      ),
                    ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(saham2[1]['close'], style: const TextStyle(color: Color(0xff3D3D3D),fontWeight: FontWeight.bold,fontSize: 15, fontFamily: "OpenSans"),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          double.parse((saham2[1]['percent']).toString().substring(0, 4)) < 0  ?
                          Image.asset("assets/Icon/downTrendIcon.png", width: 10,)
                          :
                          Image.asset("assets/Icon/upTrendIcon.png", width: 10,),
                          const SizedBox(width: 5),
                          Text("${double.parse(saham2[1]['change']).round()} (${(saham2[1]['percent']).toString().substring(0, 4)}%)",style: TextStyle(color: double.parse((saham2[1]['percent']).toString().substring(0, 4)) < 0 ? Colors.red: UsedColor.primaryGreen, fontSize: 11),),
                        ],
                      ),
                    ],
                  )
                ]
              )
          ),

          //emiten 3
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            height: 70,
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100), bottom: BorderSide(color: Colors.grey.shade100))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                      Image.network(saham[2]['logo'], width: 50, height: 50),
                      const SizedBox(width: 15),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(saham[2]['ticker'], style: const TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                            const SizedBox(height: 3),
                            Container(
                              width: 195,
                              child: Text(saham[2]['name'], style: const TextStyle( color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 12), )),
                          ]
                      ),
                    ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(saham2[2]['close'], style: const TextStyle(color: Color(0xff3D3D3D),fontWeight: FontWeight.bold,fontSize: 15, fontFamily: "OpenSans"),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          double.parse((saham2[2]['percent']).toString().substring(0, 4)) < 0  ?
                          Image.asset("assets/Icon/downTrendIcon.png", width: 10,)
                          :
                          Image.asset("assets/Icon/upTrendIcon.png", width: 10,),
                          const SizedBox(width: 5),
                          Text("${double.parse(saham2[2]['change']).round()} (${(saham2[2]['percent']).toString().substring(0, 4)}%)",style: TextStyle(color: double.parse((saham2[2]['percent']).toString().substring(0, 4)) < 0 ? Colors.red: UsedColor.primaryGreen, fontSize: 11),),
                        ],
                      ),
                    ],
                  )
                ]
              )
          ),

          //emiten 4
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            height: 70,
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100), bottom: BorderSide(color: Colors.grey.shade100))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                      Image.network(saham[3]['logo'], width: 50, height: 50),
                      const SizedBox(width: 15),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(saham[3]['ticker'], style: const TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                            const SizedBox(height: 3),
                            Container(
                              width: 195,
                              child: Text(saham[3]['name'], style: const TextStyle( color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 12), )),
                          ]
                      ),
                    ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(saham2[3]['close'], style: const TextStyle(color: Color(0xff3D3D3D),fontWeight: FontWeight.bold,fontSize: 15, fontFamily: "OpenSans"),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          double.parse((saham2[3]['percent']).toString().substring(0, 4)) < 0  ?
                          Image.asset("assets/Icon/downTrendIcon.png", width: 10,)
                          :
                          Image.asset("assets/Icon/upTrendIcon.png", width: 10,),
                          const SizedBox(width: 5),
                          Text("${double.parse(saham2[3]['change']).round()} (${(saham2[3]['percent']).toString().substring(0, 4)}%)",style: TextStyle(color: double.parse((saham2[3]['percent']).toString().substring(0, 4)) < 0 ? Colors.red: UsedColor.primaryGreen, fontSize: 11),),
                        ],
                      ),
                    ],
                  )
                ]
              )
          ),
        ]
      );
    }
    
    Widget menuSahamHeader() {
      return Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Kode Emiten",
                          style: TextStyle(
                              color: UsedColor.primaryGrey,
                              fontWeight: FontWeight.w500,
                              fontFamily: "OpenSans",
                              fontSize: 12),
                        ),
                        Text(
                          "Harga",
                          style: TextStyle(
                              color: UsedColor.primaryGrey,
                              fontWeight: FontWeight.w500,
                              fontFamily: "OpenSans",
                              fontSize: 12),
                        ),
                      ]),
                );
    }

    Widget menuReksadana() {
      return Container(
        padding: const EdgeInsets.only(left: 27, right: 27),
        child: Column(
          children: [
            Row(
              children: const [
                Text('Saham', style: TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                Spacer(),
                Text('Lainnya', style: TextStyle(color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 13),),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Kode Emiten",
                    style: TextStyle(
                        color: UsedColor.primaryGrey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "OpenSans",
                        fontSize: 12),
                  ),
                  Text(
                    "Harga",
                    style: TextStyle(
                        color: UsedColor.primaryGrey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "OpenSans",
                        fontSize: 12),
                  ),
                ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 70,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                        Image.asset("assets/Icon/Emiten/MANULIFEsa.png", width: 40,),
                        const SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Text("MANULIFE Saham Andalan", style: TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                              SizedBox(height: 3),
                              Text("Manulife Aset Manajemen Indonesia, PT", style: TextStyle( color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 9), ),
                            ]
                        ),
                      ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("10.486", style: TextStyle(color: Color(0xff3D3D3D),fontWeight: FontWeight.bold,fontSize: 15, fontFamily: "OpenSans"),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/Icon/upTrendIcon.png", width: 10,),
                            const SizedBox(width: 5),
                            const Text("2 (0.83%)",style: TextStyle(color: UsedColor.primaryGreen, fontSize: 11),),
                          ],
                        ),
                      ],
                    )
                  ]
                )
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                        Image.asset("assets/Icon/Emiten/BNPpsk.png", width: 40,),
                        const SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Text("BNP Parbias Sri Kehati", style: TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                              SizedBox(height: 3),
                              Text("BNP PARIBAS ASSET MANAGEMENT", style: TextStyle( color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 11), ),
                            ]
                        ),
                      ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("1.076", style: TextStyle(color: Color(0xff3D3D3D),fontWeight: FontWeight.bold,fontSize: 15, fontFamily: "OpenSans"),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/Icon/upTrendIcon.png", width: 10,),
                            const SizedBox(width: 5),
                            const Text("3 (0.36%)",style: TextStyle(color: UsedColor.primaryGreen, fontSize: 11),),
                          ],
                        ),
                      ],
                    )
                  ]
                )
            ),
            const SizedBox(height: 25,),
            Row(
              children: const [
                Text('Pendapatan Tetap', style: TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                Spacer(),
                Text('Lainnya', style: TextStyle(color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 13),),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Kode Emiten",
                    style: TextStyle(
                        color: UsedColor.primaryGrey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "OpenSans",
                        fontSize: 12),
                  ),
                  Text(
                    "Harga",
                    style: TextStyle(
                        color: UsedColor.primaryGrey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "OpenSans",
                        fontSize: 12),
                  ),
                ]),
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                        Image.asset("assets/Icon/Emiten/MNCdl.png", width: 40,),
                        const SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Text("MNC Dana Likuid", style: TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                              SizedBox(height: 3),
                              Text("MNC Asset Management, PT", style: TextStyle( color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 11), ),
                            ]
                        ),
                      ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("2.902", style: TextStyle(color: Color(0xff3D3D3D),fontWeight: FontWeight.bold,fontSize: 15, fontFamily: "OpenSans"),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/Icon/upTrendIcon.png", width: 10,),
                            const SizedBox(width: 5),
                            const Text("15 (0.64%)",style: TextStyle(color: UsedColor.primaryGreen, fontSize: 11),),
                          ],
                        ),
                      ],
                    )
                  ]
                )
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 70,
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100), bottom: BorderSide(color: Colors.grey.shade100))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                        Image.asset("assets/Icon/Emiten/BNPpsk.png", width: 40,),
                        const SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Text("BNP Paribas Omega", style: TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                              SizedBox(height: 3),
                              Text("BNP Paribas Asset Management, PT", style: TextStyle( color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 11), ),
                            ]
                        ),
                      ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("1.714", style: TextStyle(color: Color(0xff3D3D3D),fontWeight: FontWeight.bold,fontSize: 15, fontFamily: "OpenSans"),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/Icon/upTrendIcon.png", width: 10,),
                            const SizedBox(width: 5),
                            const Text("2 (0.20%)",style: TextStyle(color: UsedColor.primaryGreen, fontSize: 11),),
                          ],
                        ),
                      ],
                    )
                  ]
                )
            ),
          ],
        ),
      );
    }
    
    return SmartRefresher(
      enablePullDown: true,
      controller: _refreshController,
      onRefresh: _onRefresh,
      

      child: CustomScrollView(
          
          clipBehavior: Clip.hardEdge,
          slivers:  firstName != null && kategori.isNotEmpty && _kategoriFormatter.isNotEmpty ? [
            const SliverAppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 5,
              pinned: true,
              shadowColor: Colors.transparent,
            ),
            
            //Bagian greetings user
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        width: 360,
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25), 
                        // color: Colors.blueAccent,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff5ADFB2),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(_shortName!, style: const TextStyle(fontFamily: 'OpenSans', fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),),
                              )
                            ),
                            Container(
                              width: 252,
                              height: 50,
                              padding: const EdgeInsets.only(top: 5, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      '$firstName $lastName',
                                      style: const TextStyle(fontFamily: 'OpenSans', fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xff5ADFB2)),
                                    ),
                                    const Text(
                                      'Pagi yang cerah...',
                                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xff8D8D8D)),
                                    ),
                                    
                                  ],
                                ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: InkWell(
                                child: Center(
                                  child: Image.asset(_notificationPath, width: 18,),
                                ),
                                onTap: () {
                                  HapticFeedback.mediumImpact();
                                },
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Bagian Kartu
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(bottom: 20),
                  color: Colors.white,
                  // color: Colors.amber,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 154,
                          width: 291,
                          margin: const EdgeInsets.only(top: 60),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Image.asset('assets/cardBg2.png')
                        ),
                        Container(
                          height: 173,
                          width: 326,
                          margin: const EdgeInsets.only(top: 25),
                          
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Image.asset('assets/cardBg1.png')
                        ),
                        Container(
                          height: 210,
                          width: 349,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Image.asset('assets/cardBgPrimary.png')
                        ),
                        SizedBox(
                          width: 300,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Saldo', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 15),),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 220,
                                    
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                  
                                      children: [
                                      Text(!_hiddenBalance?_strBalPrimary!.output.symbolOnLeft:"Rp *********", style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, color: Colors.white, fontSize: 23),),
                                      Text(!_hiddenBalance?_balanceSecondary:"", style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, color: Colors.white, fontSize: 15),),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _hiddenBalance = !_hiddenBalance;
                                            
                                            firestore.collection('users').doc(nowUser).update({
                                              'showBalance1': _hiddenBalance,
                                            });
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 10, bottom: 10),
                                          child: Image.asset(!_hiddenBalance?'assets/Icon/eyeHide.png':'assets/Icon/eyeShow.png', width: 18,),
                                        ),
                                      ),
                                    ],),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                    const Text('**** **** **** 2018', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset('assets/Icon/copyIcon.png', width: 18,),
                                  ],),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text('Pemegang Kartu', style: TextStyle(fontFamily: 'OpenSans', fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),),
                                  Text('$firstName $lastName', style: const TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),)
                                ]
                              ),
                              Column(
                                
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset('assets/Icon/chipIcon.png', width: 44,),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Image.asset('assets/Icon/mastercard.png', width: 44,),
                                ]
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    
            //Bagian tombol Setor Tunai + Transaksi
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  color: Colors.white,
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: const Color(0xff5ADFB2),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          splashColor: const Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(10),
                          onTap: () async{
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => SetorTunaiPage(parameterBerita: _strBalPrimary, namaKartu: '$firstName $lastName',)));
                            Future.delayed(const Duration(seconds: 3), () {
                              int nextBalance = 0;
                              
                              setState(() {
                                // _balancePrimary = _balancePrimary + 100000;
                                List<int> balanceRandom = [50000, 100000, 200000, 500000, 1000000];
                                
                                Random rnd = Random();
                                nextBalance = balanceRandom[rnd.nextInt(5)];
                                _balancePrimary = _balancePrimary + nextBalance;
                                });
                                MoneyFormatter nextBalances = MoneyFormatter(
                                amount: nextBalance.toDouble(),
                                settings: MoneyFormatterSettings(
                                    symbol: 'Rp',
                                    thousandSeparator: '.',
                                    decimalSeparator: ',',
                                    symbolAndNumberSeparator: ' ',
                                    fractionDigits: 0,
                                    compactFormatType: CompactFormatType.short,
                                ));
                                fToast?.showToast(
                                  toastDuration: const Duration(milliseconds: 4500),
                                  fadeDuration: const Duration(milliseconds: 100),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20),
                                    child: GestureDetector(
                                      onVerticalDragUpdate: (details) {
                                        if(details.delta.direction <= 0){
                                          fToast?.removeCustomToast();
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 75,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: UsedColor.primaryGreen,
                                          boxShadow: [
                                              BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3), // changes position of shadow
                                            ),
                                          ]
                                        ),
                                        child: Row(
                                          // mainAxisSize: MainAxisSize.min,
                                          children:  [
                                            Image.asset('assets/setorTunaiImage.png', width: 60,),
                                            const SizedBox(width: 10,),
                                            Text(
                                              "Dana masuk dari Setoran Tunai melalui \nmesin ATM Sebesar Rp ${nextBalances.output.nonSymbol}",
                                              style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // gravity: ToastGravity.BOTTOM,
                                  positionedToastBuilder: (context, child) {
                                    return Center(
                                      child: Container(
                                        margin: const EdgeInsets.only(bottom:700, left: 10, right: 10),
                                        child: child,
                                      ),
                                    );
                                  },
                                );
    
                                Vibration.vibrate(
                                  pattern: [100,300,100,300,100,600,],
                                );
    
                                Future.delayed(const Duration(milliseconds: 150), () {
                                  // primaryTestWrite(_balancePrimary);
    
                                  //write to firestore
                                  FirebaseFirestore.instance.collection('users').doc(nowUser).update({
                                    'balance': _balancePrimary,});
                                });
                            });
                            
                            
                          },
                          child: SizedBox(
                            width: 165,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Image.asset('assets/Icon/setorIcon.png', width: 22,),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Setor Tunai', style: TextStyle(color: Colors.white, fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600),)
                            ],)
                          ),
                        ),
                      ),
                      
                      Material(
                        color: const Color(0xff5ADFB2),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          splashColor: const Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {                            
                            var result = bd.showBottomDialog(context, _strBalPrimary, '$firstName $lastName');
                          },
                          child: SizedBox(
                            width: 165,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Image.asset('assets/Icon/transaksiIcon.png', width: 16,),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Transaksi', style: TextStyle(color: Colors.white, fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600),)
                            ],)
                          ),
                        ),
                      ),
                  ],)
                ),
              ),
            ),
            
            SliverToBoxAdapter(
              child: Container(height: 10, color: Colors.white)
            ),
    
            //bagian saldo kategori
            SliverToBoxAdapter(
              child : Container(
                width: MediaQuery.of(context).size.width,
                height: 330,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
                          Text('Saldo Kategori', style: TextStyle(color: Color(0xff5ADFB2), fontFamily: 'OpenSans', fontSize: 17, fontWeight: FontWeight.w700),),
                          Text('Lainnya', style: TextStyle(color: Color(0xff5ADFB2), fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w500),),
                        ],
                      )
                    ),
    
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      color: const Color(0xffE86868),
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        splashColor: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(10),
                        onTap:() {
                          
                        },
                        child: Container(
                          height: 87,
                          width: 349,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 87,
                                height: 87,
                                child: Center(
                                  child: Image.asset('assets/Icon/foodIcon.png', width: 70,),
                                ),
                              ),
                              SizedBox(
                                width: 245,
                                height: 65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text (kategori[0]['kategori'], style: const TextStyle(fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                                    const SizedBox(
                                      height: 7.5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Terpakai ${_kategoriFormatter[0][0].output.symbolOnLeft}', style: const TextStyle(fontFamily: 'OpenSans', fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),),
                                        Text(_kategoriFormatter[0][1].output.symbolOnLeft, style: const TextStyle(fontFamily: 'OpenSans', fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 245,
                                      height: 10,
                                      
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 245 * kategori[0]['terpakai'] / kategori[0]['batas'],
                                              height: 10,
                                              color: UsedColor.primaryGreen,
                                            )
                                          ],
                                        ),
                                      )
                                    ),
    
                                  ]
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      color: const Color(0xff6D5ADF),
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        splashColor: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(10),
                        onTap:() {
                          
                        },
                        child: Container(
                          height: 87,
                          width: 349,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 87,
                                height: 87,
                                child: Center(
                                  child: Image.asset('assets/Icon/vacationIcon.png', width: 70,),
                                ),
                              ),
                              SizedBox(
                                width: 245,
                                height: 65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text (kategori[1]['kategori'], style: const TextStyle(fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                                    const SizedBox(
                                      height: 7.5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Terpakai ${_kategoriFormatter[1][0].output.symbolOnLeft}', style: const TextStyle(fontFamily: 'OpenSans', fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),),
                                        Text(_kategoriFormatter[1][1].output.symbolOnLeft, style: const TextStyle(fontFamily: 'OpenSans', fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 245,
                                      height: 10,
                                      
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 245 * kategori[1]['terpakai'] / kategori[1]['batas'],
                                              height: 10,
                                              color: UsedColor.primaryGreen,
                                            )
                                          ],
                                        ),
                                      )
                                    ),
    
                                  ]
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      color: const Color(0xff5AAFDF),
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        splashColor: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(10),
                        onTap:() {
                          
                        },
                        child: Container(
                          height: 87,
                          width: 349,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 87,
                                height: 87,
                                child: Center(
                                  child: Image.asset('assets/Icon/educationIcon.png', width: 70,),
                                ),
                              ),
                              SizedBox(
                                width: 245,
                                height: 65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text (kategori[2]['kategori'], style: const TextStyle(fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                                    const SizedBox(
                                      height: 7.5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Terpakai ${_kategoriFormatter[2][0].output.symbolOnLeft}', style: const TextStyle(fontFamily: 'OpenSans', fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),),
                                        Text(_kategoriFormatter[2][1].output.symbolOnLeft, style: const TextStyle(fontFamily: 'OpenSans', fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 245,
                                      height: 10,
                                      
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 245 * kategori[2]['terpakai'] / kategori[2]['batas'],
                                              height: 10,
                                              color: UsedColor.primaryGreen,
                                            )
                                          ],
                                        ),
                                      )
                                    ),
    
                                  ]
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  ],
                )
                
              ),
            ),
            
            SliverToBoxAdapter(
              child: Container(height: 10, color: Colors.white,),
            ),
    
            // Bagian Investasi
            SliverToBoxAdapter(
              child: Column(
                children: [
                  //judul
                  Container(
                    padding: const EdgeInsets.only(left: 25),
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: const Text(
                              "Investasi",
                              style: TextStyle(
                                  color: Color(0xFF8D8D8D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                  ),
                  // selector investasi
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            TextButton(
                              onPressed: (){
                                setState(() {
                                  _isSaham = true;
                                });
                              },
                              child: Text('Saham', style: TextStyle(color: _isSaham?UsedColor.primaryGreen : UsedColor.primaryGrey, fontSize: 15, fontFamily: "OpenSans", fontWeight: FontWeight.w600),),
                            ),
                            Container(
                              width: 50,
                              height: 2,
                              color: _isSaham?UsedColor.primaryGreen : Colors.transparent,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: (){
                                setState(() {
                                  _isSaham = false;
                                });
                              },
                              child: Text('Reksa Dana', style: TextStyle(color: !_isSaham?UsedColor.primaryGreen : UsedColor.primaryGrey, fontSize: 15, fontFamily: "OpenSans", fontWeight: FontWeight.w600),),
                            ),
                            Container(
                              width: 80,
                              height: 2,
                              color: !_isSaham?UsedColor.primaryGreen : Colors.transparent,
                            )
                          ],
                        ),
                        const Spacer(flex: 1,),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SahamMorePage(user: widget.user,)));
                          },
                          child: const Text('Lainnya', style: TextStyle(color: UsedColor.primaryGrey, fontSize: 12, fontFamily: "OpenSans", fontWeight: FontWeight.w600),),
                        ),
    
                      ],
                    )
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  
                  _isSaham?menuSahamHeader():Container(),
    
                  // emiten list
    
                  _isSaham? (_saham.length != 0 && _saham2.length != 0 && !isLoading) ?menuSaham(_saham, _saham2) : Container(
                    height: 200,
                    width: double.infinity,
                    child: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: UsedColor.primaryGreen,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ):menuReksadana(),
                  
    
                ],
              )
            ),
    
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
    
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text( "Promo", style: TextStyle(color: UsedColor.primaryGrey, fontSize: 17, fontWeight: FontWeight.w700, fontFamily: "OpenSans"),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 170,
                      width: double.infinity,
                      child: ListView.builder(
                        controller: promoController,
                        scrollDirection: Axis.horizontal,
                        itemCount: promo.length,
                        
                        itemBuilder: ((context, index) => Container(
                              width: 270,
                              margin: const EdgeInsets.only(right: 16),
                              child: Image.asset(
                                promo[index],
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                        
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: promo.length,
                      position: _currPromo,
                      decorator: DotsDecorator(
                        activeColor: UsedColor.primaryGreen,
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            
            //bagian artikel
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: const[
                        Text('Artikel', style: TextStyle(color: UsedColor.primaryGrey, fontSize: 17, fontWeight: FontWeight.w700, fontFamily: "OpenSans"),),
                        Spacer(),
                        Text('Lainnya', style: TextStyle(color: UsedColor.primaryGrey, fontSize: 13, fontWeight: FontWeight.w500, fontFamily: "OpenSans"),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      List<String> beritas = [
                        "Investasi Saham Juga Harus Punya Strategi Dong! Yuk, Bagi Investor Pemula Simak Artikel Berikut Ini!",
                        "assets/artikel1.png"
                      ];
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage(parameterBerita: beritas)));
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                  
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color:Colors.grey.shade100))),
                            height: 115,
                            width: double.infinity,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // JUDUL ARTIKEL dan tanggal
                                  SizedBox(
                                    width: 220,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                        children: const [
                                          // JUDUL
                                          Expanded(
                                            child: Text(
                                              "Investasi Saham Juga Harus Punya Strategi Dong! Yuk, Bagi Investor Pemula Simak Artikel Berikut Ini!", overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                  color: UsedColor.primaryGreen,
                                                  fontWeight:FontWeight.w500,
                                                  fontFamily: "OpenSans"
                                                  ),
                                            ),
                                          ),
                                          Text(
                                              "4 Januari 2023 | 18.30",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: UsedColor.primaryGrey,
                                                fontFamily: "OpenSans"
                                              )),
                                          SizedBox(height: 10,)
                                        ]),
                                  ),
                                  // FOTO
                                  SizedBox(
                                    width: 100,
                                    child: Image.asset("assets/artikel1.png")
                                  ),
                                ]
                                ),
                          ),
                        ],
                      )
                    ),
                  ),
                  //artikel 2
                  InkWell(
                    onTap: () {
                      List<String> beritas = [
                        "Kenali Sejarahnya dan Yakin Berinvestasi di Pasar Modal Indonesia",
                        "assets/artikel2.png"
                      ];
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage(parameterBerita: beritas,)));
                    },
                    child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color:Colors.grey.shade100))),
                          height: 115,
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // JUDUL ARTIKEL dan tanggal
                                SizedBox(
                                  width: 220,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                      children: const [
                                        // JUDUL
                                        Expanded(
                                          child: Text(
                                            "Kenali Sejarahnya dan Yakin Berinvestasi di Pasar Modal Indonesia", overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                color: UsedColor.primaryGreen,
                                                fontWeight:FontWeight.w500,
                                                fontFamily: "OpenSans"
                                                ),
                                          ),
                                        ),
                                        Text(
                                            "4 Januari 2023 | 18.30",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: UsedColor.primaryGrey,
                                              fontFamily: "OpenSans"
                                            )),
                                        SizedBox(height: 10,)
                                      ]),
                                ),
                                // FOTO
                                SizedBox(
                                  width: 100,
                                  child: Image.asset("assets/artikel2.png")
                                ),
                              ]
                              ),
                        ),
                      ],
                    )
                                ),
                  ),
                
                //artikel 3
                InkWell(
                  onTap: () {
                    List<String> beritas = [
                        "Unilever Indonesia (UNVR) Bagikan Dividen Interim, Catat Jadwal dan Besarannya",
                        "assets/artikel3.png"
                      ];
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage(parameterBerita: beritas,)));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color:Colors.grey.shade100))),
                          height: 115,
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // JUDUL ARTIKEL dan tanggal
                                SizedBox(
                                  width: 220,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                      children: const [
                                        // JUDUL
                                        Expanded(
                                          child: Text(
                                            "Unilever Indonesia (UNVR) Bagikan Dividen Interim, Catat Jadwal dan Besarannya", overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                color: UsedColor.primaryGreen,
                                                fontWeight:FontWeight.w500,
                                                fontFamily: "OpenSans"
                                                ),
                                          ),
                                        ),
                                        Text(
                                            "4 Januari 2023 | 18.30",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: UsedColor.primaryGrey,
                                              fontFamily: "OpenSans"
                                            )),
                                        SizedBox(height: 10,)
                                      ]),
                                ),
                                // FOTO
                                SizedBox(
                                  width: 100,
                                  child: Image.asset("assets/artikel3.png")
                                ),
                              ]
                              ),
                        ),
                      ],
                    )
                  ),
                ),
                ],
              )
            ),
    
            const SliverToBoxAdapter(
              child: SizedBox(height: 20,),
            ),
    
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    const Text('Tutorial', style: TextStyle(color: UsedColor.primaryGrey, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: "OpenSans"),),
                    const SizedBox(height: 15,),
                    SizedBox(
                      height: 170,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: promo.length,
                        controller: tutorialController,
                        itemBuilder: ((context, index) => Container(
                              width: 270,
                              margin: const EdgeInsets.only(right: 16),
                              child: Image.asset(
                                tutorial[index],
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                        
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: tutorial.length,
                      position: _currTutorial,
                      decorator: DotsDecorator(
                        activeColor: UsedColor.primaryGreen,
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                )
              ),
            ),
    
            const SliverToBoxAdapter(
              child: SizedBox(height: 70,),          
            )
            
          ]
          : 
          [
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/UanginLogo1.png', height: 100,),
                    
                    const SizedBox(height: 20,),
                    Container(
                      height: 15,
                      width: 15,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(UsedColor.primaryGreen),
                        strokeWidth: 2,
                      ),
                    )
                  ],
                )
              ),
              
            )
          ]
          ),
    );
        
  }
  
}

class BottomDialog extends StatefulWidget {
  BottomDialog({super.key});

  dynamic showBottomDialog(BuildContext context, MoneyFormatter? moneyFormatter, String? namaKartu) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Dialogcontent(parameterBerita: moneyFormatter, namaKartu: namaKartu),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class Dialogcontent extends StatefulWidget {
  Dialogcontent({super.key, this.parameterBerita, this.namaKartu});

  final MoneyFormatter? parameterBerita;
  final String? namaKartu;

  @override
  State<Dialogcontent> createState() => _DialogcontentState();
}

class _DialogcontentState extends State<Dialogcontent> {
  

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        height: 215,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 40,
            // color: Colors.red,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 1,),
              const Text('Transaksi', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16, fontFamily: "OpenSans", decoration: TextDecoration.none,),),
              const Spacer(),
              Material(color: Colors.transparent, child: IconButton(padding: EdgeInsets.zero ,onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.close, size:18)))
            ],),
          ),
          const SizedBox(height: 20,),
          Container(
            width: double.infinity,
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [Material(
                  color: UsedColor.primaryGreen,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.white,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TransferPage(user: Fireuser!)));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: Image.asset('assets/Icon/transferIcon.png', height: 10, width: 10,)
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                const Text('Transfer', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16, fontFamily: "OpenSans", decoration: TextDecoration.none,),),
                ],),
                Column(children: [Material(
                  color: UsedColor.primaryGreen,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.white,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TarikTunaiPage(parameterBerita: widget.parameterBerita, namaKartu: widget.namaKartu, user: Fireuser!)));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: Image.asset('assets/Icon/tarikTunaiIcon.png', height: 10, width: 10,)
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                const Text('Tarik Tunai', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16, fontFamily: "OpenSans", decoration: TextDecoration.none,),),],),
                Column( children: [Material(
                  color: UsedColor.primaryGreen,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.white,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QrisPage(user: Fireuser!)));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: Image.asset('assets/Icon/qrisIcon.png', height: 10, width: 10,)
                      ),
                    ),
                  ),
                ), const SizedBox(height: 5,),
                const Text('QRIS', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16, fontFamily: "OpenSans", decoration: TextDecoration.none,),),],),
              ],
            )
          ),
        ]),
      ),
    );
  }
}