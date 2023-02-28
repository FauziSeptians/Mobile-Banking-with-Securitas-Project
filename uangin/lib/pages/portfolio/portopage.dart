import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/pages/portfolio/kontenportofolio.dart';
import 'package:uangin/contents/invest.dart';

class PortoPage extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const PortoPage({super.key, required this.user});

  @override
  State<PortoPage> createState() => _PortoPageState();
}

class _PortoPageState extends State<PortoPage> {
  PerhitunganLaba laba = PerhitunganLaba(modal: uanginvestasi, persentase: persentase);
  MoneyFormatter? _strBalPrimary;
  MoneyFormatter? keuntungan;
  int _balancePrimary = 0;
  int totalKeuntungan = 0;
  double persenKeuntungan = 0;
  bool _hiddenBalance = false;
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  @override
  void initState() {
    CollectionReference users = firestore.collection("users");
    users.doc(widget.user.data!.email).get().then((value) {
      _balancePrimary = value['investBalance'];
      persenKeuntungan = value['oldInvest']/value['investBalance']*100;
      totalKeuntungan = value['investBalance'] - value['oldInvest'];
      _hiddenBalance = value['showBalance2'];

      
      if (totalKeuntungan < 0) {
        persenKeuntungan = persenKeuntungan * -1;
      }
      setState(() {
        
      });

    });
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
    
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 15,
                right: 15,
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0XFFF5F5F5)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Portofolio Reksa Dana Saham",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
      
                                                firestore.collection('users').doc(widget.user.data!.email).update({
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
                                        (totalKeuntungan < 0) ? Image.asset('assets/Icon/downTrendIconWhite.png', width: 10,) :
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
                      child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: const Text("4 Produk"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // KONTEN
                      Column(
                        children: [
                          Kontenportofolio(
                            modalinvest: 900,
                            hargabeliskrg: 700,
                            lot: 10,
                            image: "assets/Icon/Emiten/ReksaDana/SSF_pt.png",
                            namareksa: "Sucorinvest Equity Fund",
                            user: widget.user,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Kontenportofolio(
                            modalinvest: 900,
                            hargabeliskrg: 700,
                            lot: 10,
                            image: "assets/Icon/Emiten/ReksaDana/MSA_s.png",
                            namareksa: "Manulife Saham Andalan",
                            user: widget.user,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Kontenportofolio(
                            modalinvest: 900,
                            hargabeliskrg: 700,
                            lot: 100000,
                            image: "assets/Icon/Emiten/ReksaDana/BADPT_pt.png",
                            namareksa: "BNI-AM Indeks IDX30",
                            user: widget.user,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Kontenportofolio(
                            modalinvest: 900,
                            hargabeliskrg: 700,
                            lot: 10,
                            image: "assets/Icon/Emiten/ReksaDana/BDL_pu.png",
                            namareksa: "BNI Paribas SRI KEHATI",
                            user: widget.user,
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
