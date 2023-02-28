import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/portfolio/alokasicontent.dart';
import 'package:uangin/pages/portfolio/performacontent.dart';


class Portofolio extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const Portofolio({super.key, required this.user});

  @override
  State<Portofolio> createState() => _PortofolioState();
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

// BOOLEAN
int pressing = 0;

class _PortofolioState extends State<Portofolio> {
  // int uanginvestasi = 109375033;
  // double persentase = 0.76;
  PerhitunganLaba? laba;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  int _balancePrimary = 0;
  bool _hiddenBalance = true;
  MoneyFormatter? _strBalPrimary;
  MoneyFormatter? keuntungan;
  double? persenKeuntungan;
  int? totalKeuntungan = 0;

  String? nowUser;

  @override
  void initState() {
    // laba = PerhitunganLaba(modal: uanginvestasi, persentase: persentase);

    CollectionReference users = firestore.collection("users");
    users.doc(widget.user.data!.email).get().then((value) {
      _balancePrimary = value['investBalance'];
      persenKeuntungan = value['oldInvest']/value['investBalance']*100;
      totalKeuntungan = value['investBalance'] - value['oldInvest'];
      _hiddenBalance = value['showBalance2'];

      
      if (totalKeuntungan! < 0) {
        persenKeuntungan = persenKeuntungan! * -1;
      }
      setState(() {
        
      });

    });
    nowUser = widget.user.data!.email;
    super.initState();
  }

  
      
  @override
  Widget build(BuildContext context) {
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
    keuntungan = MoneyFormatter(
      amount: totalKeuntungan!.toDouble(),
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
    totalKeuntungan == null ?
    Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/UanginLogo1.png', height: 100,),
          
          const SizedBox(height: 20,),
          const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(UsedColor.primaryGreen),
              strokeWidth: 2,
            ),
          )
        ],
      )
    ) :
    Scaffold(
      body: SafeArea(
          child: Material(
            child: ListView(children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                         Text(
                          "Portofolio",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'OpenSans', color: Color(0xff3D3D3D)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 190,
                      
                      width: MediaQuery.of(context).size.width,
                      // padding: const EdgeInsets.only(bottom: 20),
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
                                        (totalKeuntungan! < 0) ? Image.asset('assets/Icon/downTrendIconWhite.png', width: 10,) :
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    pressing = 0;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: pressing == 0
                                                  ? UsedColor.primaryGreen
                                                  : UsedColor.primaryGrey))),
                                  child: Center(
                                      child: Text(
                                    "Performa Portofolio",
                                    style: TextStyle(
                                        color: pressing == 0
                                            ? UsedColor.primaryGreen
                                            : UsedColor.primaryGrey,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    pressing = 1;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: pressing == 1
                                                  ? UsedColor.primaryGreen
                                                  : UsedColor.primaryGrey,))),
                                  child: Center(
                                      child: Text(
                                    "Alokasi Dana",
                                    style: TextStyle(
                                        color: pressing == 1
                                            ? UsedColor.primaryGreen
                                            : UsedColor.primaryGrey,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    pressing == 1 ? AlokasiKonten(user: widget.user,) : PerformaContent(user: widget.user)
                  ],
                ),
              ),
        ]),
      )),
    );
  }
}
