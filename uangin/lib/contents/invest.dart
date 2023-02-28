import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/pages/reksadanapage.dart';
import 'package:uangin/pages/saham/sahammorepage.dart';
import 'package:uangin/pages/sbnpage.dart';

import 'package:http/http.dart' as http;


class Invest extends StatefulWidget {
  const Invest({Key? key, required this.user}) : super(key: key);
  final AsyncSnapshot<User?> user;

  @override
  State<Invest> createState() => _InvestState();
}

class PerhitunganLaba {
    final persentase;
    final modal;
    const PerhitunganLaba({this.persentase, this.modal});

    double labadidapat() {
      double hasil;
      hasil = (persentase * modal) / 100;
      return hasil;
    }
}
int uanginvestasi = 109375033;
double persentase = 0.48;

class _InvestState extends State<Invest> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final AsyncSnapshot<User?> Fireuser;
  String _shortName = 'n';
  String? firstName;
  String? lastName;
  String? nowUser;
  bool isLoading = true;

  final String _notificationPath = 'assets/Icon/notification.png';
  
  PerhitunganLaba laba = PerhitunganLaba(modal: uanginvestasi, persentase: persentase);

  bool _hiddenBalance = true;
  MoneyFormatter? _strBalPrimary;
  MoneyFormatter? keuntungan;
  int _balancePrimary = 109375033;

  List<String> trendingChart = [
    "assets/Icon/Emiten/KISIqf_chart.png",
    "assets/Icon/Emiten/BNPpe_chart.png",
    "assets/Icon/Emiten/MNCde_chart.png",
    "assets/Icon/Emiten/MANULIFEsa_chart.png",
  ];
  List<List<String>> trendingName = [
    ['-','(-4.05%)','1.023,85',"KISI Equity Fund"],
    ['+','(0.48%)','18.460,26',"BNP Paribas Ekuitas"],
    ['+','(1.09%)','2.706,27',"MNC Dana Ekuitas"],
    ['-','(-7.79%)','2.150,41',"Manulife Saham Andalan"],
  ];

  List<Color> sbnColor1 = [
    const Color(0XFF4F24AB),
    const Color(0XFF1E89C6),
    const Color(0XFF21D1C7),
    
  ];
  List<Color> sbnColor2 = [
    const Color(0XFF8962DB),
    const Color(0XFF6DC0EE),
    const Color(0XFF77E2DC),
    
  ];
  List<List<String>> sbnInfo = [
    ["assets/Icon/Emiten/SUN_sbn.png", "Surat Utang Negara", "Savings Bond Ritel", "Savings Bond Ritel (SBR) seri SBR011 hadir sebagai alternatif investasi untuk mencapai tujuan keuanganmu dengan cara yang aman, menguntungkan, sekaligus membuka kesempatan bagi masyarakat untuk bersama-sama berpartisipasi dalam pembiayaan APBN."],
    ["assets/Icon/Emiten/ST_sbn.png", "Sukuk Tabungan", "Surat Berharga Syariah Negara", "Sukuk Tabungan Seri ST009 adalah produk investasi syariah yang diterbitkan oleh Pemerintah kepada individu Warga Negara Indonesia yang aman, mudah, terjangkau, menguntungkan, dan sesuai syariah."],
    ["assets/Icon/Emiten/ORI_sbn.png", "ORI", "Obligasi Negara Ritel", "Obligasi Negara Ritel atau ORI merupakan salah satu instrumen Surat Berharga Negara (SBN) yang ditawarkan kepada individu atau perseorangan Warga Negara Indonesia melalui Mitra Distribusi di Pasar Perdana."],
    
  ];

  List<Map<String, dynamic>> _saham = [];
  List<Map<String, dynamic>> _saham2 = [];


  double? persenKeuntungan;
  int totalKeuntungan = 0;

  @override
  void initState() {
    fetchData();
    
    
    super.initState();
  }

  void fetchSaham () async{

    var response = await http.get(Uri.parse('https://api.goapi.id/v1/stock/idx/trending?api_key=cIeUpWfAHUjiVqQzovgXetbm5ZfoDq'));
    var response2 = await http.get(Uri.parse('https://api.goapi.id/v1/stock/idx/companies?api_key=cIeUpWfAHUjiVqQzovgXetbm5ZfoDq'));

    log(response.body.toString());

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
      // isLoading = false;
    });
  }

  void fetchData() async {
    CollectionReference users = firestore.collection("users");
    users.doc(widget.user.data!.email).get().then((value) {

      firstName = value['firstName'];
      lastName = value['lastName'];
      _shortName = firstName!.substring(0, 1) + lastName!.substring(0, 1);
      _balancePrimary = value['investBalance'];
      _hiddenBalance = value['showBalance2'];
      persenKeuntungan = value['oldInvest']/value['investBalance']*100;
      totalKeuntungan = value['investBalance'] - value['oldInvest'];
      if (totalKeuntungan< 0) {
        persenKeuntungan = persenKeuntungan! * -1;
      }
      setState(() {
        
      });
    });
    nowUser = widget.user.data!.email;
    fetchSaham(); 
    setState(() {
      isLoading = false;
    });
  }

  Widget menuSaham(List<Map<String, dynamic>> saham, List<Map<String, dynamic>> saham2) {
      return Column(
        children: [
          // emiten 1
          Container(
            // margin: const EdgeInsets.only(left: 25, right: 25),
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
            // margin: const EdgeInsets.only(left: 25, right: 25),
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
            // margin: const EdgeInsets.only(left: 25, right: 25),
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
            // margin: const EdgeInsets.only(left: 25, right: 25),
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

  Widget saham(String merk, String namaperusahaan, int uang, int rugi, double percentase, String images) {
    MoneyFormatter hargaSaham = MoneyFormatter(
      amount: uang.toDouble(),
      settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short,
      )
    );
    
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.grey.shade100),)
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Image.asset(images, width: 50),
          const SizedBox(
            width: 15,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  merk,
                  style: const TextStyle(
                      color: Color(0xFF5ADFB2),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      fontFamily: "OpenSans"
                      ),
                ),
                const SizedBox(height: 3),
                Text(
                  namaperusahaan,
                  style: const TextStyle(
                      color: Color(0xff8d8d8d),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: "OpenSans"),
                ),
              ])
        ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              hargaSaham.output.nonSymbol,
              style: const TextStyle(
                  color: Color(0xff3D3D3D),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: "OpenSans"
                  ),
            ),
            Row(
              children: [
                
                (rugi > 0) ? 
                Image.asset("assets/Icon/upTrendIcon.png", width: 10,)
                :
                Image.asset("assets/Icon/downTrendIcon.png", width: 10),
                const SizedBox(width: 5),
                Text(
                  "$rugi($percentase%)",
                  style: TextStyle(color: (rugi > 0) ? UsedColor.primaryGreen : Colors.red, fontSize: 11, fontFamily: "OpenSans"),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
  Widget reksadana(int warnas, String image, String judul, String deskripsi) {
    return Column(
      children: [
        Container(
          height: 95,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(warnas),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                width: 12,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(image, width: 75,),
                  
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            judul,
                            style: const TextStyle(
                                color: Color(0XFF8D8D8D),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              deskripsi,
                              style: const TextStyle(
                                  color: Color(0XFF9E9E9E), fontSize: 13),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    keuntungan = MoneyFormatter(
      amount: totalKeuntungan.toDouble(),
      settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short,
      )
    );
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
    return
    isLoading || keuntungan == null? 
    SizedBox(
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
    ):
    CustomScrollView(
      clipBehavior: Clip.hardEdge,
        slivers: lastName != null ? [
          const SliverAppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 5,
            pinned: true,
            shadowColor: Colors.transparent,
          ),

          // Greetings User
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
                              child: Text(_shortName, style: const TextStyle(fontFamily: 'OpenSans', fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),),
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

          SliverToBoxAdapter(
            child: Center(
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(bottom: 20),
                // color: Colors.red,
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
                        child: Image.asset('assets/investCardBg2.png')
                      ),
                      Container(
                        height: 173,
                        width: 326,
                        margin: const EdgeInsets.only(top: 25),
                        
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Image.asset('assets/investCardBg1.png')
                      ),
                      Container(
                        height: 210,
                        width: 349,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Image.asset('assets/investCardBgPrimary.png')
                      ),
                      SizedBox(
                        width: 300,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Total Investasi', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 15),),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 230,
                                  
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                
                                    children: [
                                    Text(!_hiddenBalance?_strBalPrimary!.output.symbolOnLeft:"Rp *********", style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, color: Colors.white, fontSize: 23),),
                                    Text(!_hiddenBalance?',00':"", style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, color: Colors.white, fontSize: 15),),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _hiddenBalance = !_hiddenBalance;

                                           firestore.collection('users').doc(nowUser).update({
                                            'showBalance2': _hiddenBalance,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  const Text('Keuntungan', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  (totalKeuntungan< 0) ? Image.asset('assets/Icon/downTrendIconWhite.png', width: 10,) :
                                  Image.asset('assets/Icon/upTrendIconWhite.png', width: 10,),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("${persenKeuntungan.toString().substring(0,4)}%", style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(keuntungan!.output.symbolOnLeft, style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),)
                                ],),
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

          //Bagian Trending
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trending",
                          style: TextStyle(
                              color: UsedColor.primaryGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      InkWell(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReksadanaPage(index: 0, user: widget.user)));
                        },
                        child: Text("Lainnya",
                            style: TextStyle(
                              color: UsedColor.primaryGrey,
                              fontSize: 14,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 148,
                    width: double.infinity,
                    child: ListView.builder(
                      
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingChart.length,
                      
                      itemBuilder: ((context, index) => Container(
                            width: 148,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xff9D9D9D)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                              children: [
                                Text(trendingName[index][3], style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Color(0xff3D3D3D), fontSize: 11),),
                                Text(trendingName[index][2], style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, color: Color(0xff3D3D3D), fontSize: 14),),
                                Row(
                                  children: [
                                    trendingName[index][0] == '+'?Image.asset('assets/Icon/upTrendIcon.png', width: 10,):Image.asset('assets/Icon/downTrendIcon.png', width: 10,),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(trendingName[index][1], style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: trendingName[index][0] == '+'?UsedColor.primaryGreen:Colors.red, fontSize: 11),),
                                  ],
                                ),
                                const Spacer(),
                                Image.asset(
                                  trendingChart[index],
                                  fit: BoxFit.fitWidth,
                                ),
                              ],
                            )
                          )),
                      
                    ),
                  ),                  
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),

          //bagian sbn
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("SBN",
                          style: TextStyle(
                              color: UsedColor.primaryGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SBNPelajari()));
                        },
                        child: const Text("Pelajari",
                          style: TextStyle(
                            color: UsedColor.primaryGrey,
                            fontSize: 14,
                          )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sbnColor1.length,
                      itemBuilder: ((context, index) => Container(
                        width: 228,
                        height: 150,
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Container(
                              width: 228,
                              height: 52,
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: sbnColor1[index], borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                border: Border.all(color: sbnColor1[index], width: 1),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(sbnInfo[index][0], width: 50,),
                                  const SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(sbnInfo[index][1], style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14),),
                                      Text(sbnInfo[index][2], style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w500, color: Colors.white, fontSize: 10, fontStyle: FontStyle.italic),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 228,
                              height: 108,
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: sbnColor2[index], borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                border: Border.all(color: sbnColor2[index], width: 1),
                              ),
                              child: Text(sbnInfo[index][3], style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w500, color: Colors.white, fontSize: 9.5), textAlign: TextAlign.justify,),
                            ),
                          ],
                        ),
                      )),
                      
                    ),
                  ),                  
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),

          SliverToBoxAdapter(
            child: Container(

              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Saham", style: TextStyle(color: Color(0xFF8D8D8D),fontSize: 18,fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SahamMorePage(user: widget.user,)));
                        },
                        child: const Text("Lainnya", style: TextStyle(color: Color(0xFF8D8D8D),fontSize: 14,)))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _saham.isEmpty || _saham2.isEmpty ?
                  const Center(child: CircularProgressIndicator(),) :
                  menuSaham(_saham, _saham2)
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Reksadana",
                      style: TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "Semua produk yang disediakan teruji dan berkualitas",
                      style: TextStyle(
                          color: Color(0xFF8B8B8B), fontSize: 12)),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReksadanaPage(index: 0, user: widget.user)));
                    },
                    child: reksadana(
                        0XFF8962DB,
                        "assets/Icon/pasarUangIcon.png",
                        "Pasar Uang",
                        "Risiko rendah dengan return yang lebih tinggi daripada deposito"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReksadanaPage(index: 1, user: widget.user)));
                    },
                    child: reksadana(
                        0XFF1E89C6,
                        "assets/Icon/pendapatanTetapIcon.png",
                        "Pendapatan Tetap",
                        "Risiko moderat dengan return yang cukup stabil, cocok untuk jangka waktu investasi 1-3 tahun"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReksadanaPage(index: 2, user: widget.user)));
                    },
                    child: reksadana(0XFF21D1C7, "assets/Icon/campuranIcon.png", "Campuran",
                        "Risiko tinggi dengan return yang tinggi, cocok untuk jangka menengah hingga panjang"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReksadanaPage(index: 3, user: widget.user)));
                    },
                    child: reksadana(0XFF1AE282, "assets/Icon/sahamIcon.png", "Saham",
                        "Return tertinggi untuk yang berani ambil risiko investasi jangka panjang"),
                  ),
                ],
              ),
            ),
          ),
          
         
          
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            )
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
        ],
    );
  }


}