import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/saham/sahampinpage.dart';

// ignore: must_be_immutable
class Sahamdetail extends StatefulWidget {
  var dataSaham;
  final AsyncSnapshot<User?> user;
  Sahamdetail({super.key, required this.dataSaham, required this.user});

  @override
  State<Sahamdetail> createState() => _SahamdetailState();
}



class _SahamdetailState extends State<Sahamdetail> {
  BottomDialog bt = BottomDialog();

  Map<dynamic, dynamic> datasaham = {
    "saham": "BBRI",
    "namadetail": "Bank Rakyat Indonesia (Persero) Tbk",
    "symbol": "BBRI",
    "open": 7775,
    "high": 7800,
    "low": 7675,
    "mktcap": 951.93,
    "close": 7625,
    "wkhigh": 8250,
    "wklow": 5905,
    "vol": 65.31,
    "harga": 4610,
    "buyingpower": 25000000.0,
    "orderbook": [
      [193.185, 4600, 4610, 31186],
      [39922, 4590, 4620, 12187],
      [79559, 4580, 4630, 12475],
      [24488, 4570, 4640, 12382],
      [25421, 4560, 4650, 15798],
      [36114, 4550, 4660, 11480],
      [17870, 4540, 4670, 13841],
      [11801, 4530, 4680, 20899],
      [10950, 4520, 4690, 10100],
      [12926, 4510, 4700, 15791],
    ],
    "runningtrade": [
      ['11:29:59', 4610, 'Beli', 1],
      ['11:29:58', 4600, 'Jual', 9],
      ['11:29:58', 4600, 'Jual', 1],
      ['11:29:58', 4600, 'Jual', 1],
      ['11:29:58', 4600, 'Jual', 3],
      ['11:29:58', 4600, 'Jual', 1],
      ['11:29:58', 4600, 'Jual', 1],
      ['11:29:57', 4600, 'Jual', 67],
      ['11:29:57', 4600, 'Jual', 4],
      ['11:29:57', 4600, 'Jual', 7],
    ]
  };
  int temp = 0;
  int lot = 1;
  int press = 1;
  int persen = 25;
  double fixbuyingpower = 1000000;
  int total = 1;
  int hargapasar = 4620;

  @override
  void initState() {
    setState(() {
      datasaham['saham'] = widget.dataSaham['saham'];
      datasaham['namadetail'] = widget.dataSaham['namadetail'];
      datasaham['open'] = int.parse(widget.dataSaham['open']);
      datasaham['harga'] = int.parse(widget.dataSaham['harga']);
      datasaham['symbol'] = widget.dataSaham['saham'];

      temp = datasaham["harga"];
      // fixbuyingpower = datasaham['buyingpower'] * persen / 100;
      total = lot * 100 * temp;
      

    });

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(widget.user.data!.email).get().then((value) {
      setState(() {
        fixbuyingpower = value['balance'].toDouble();
      });
    });

    log(datasaham.toString());
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    MoneyFormatter totalBeli = MoneyFormatter(
      amount: total.toDouble(),
      settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short,
    ));

    MoneyFormatter buyingPower = MoneyFormatter(
      amount: fixbuyingpower,
      settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short,
    ));
    // print(fixbuyingpower);
    return Scaffold(
      extendBody: true,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left:15, top:15, right: 15),
        // color: Colors.red,
        height: 10000,
        child: ListView(
          children: [Column(
            children: [
              Row(
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
                          width: 112,
                        ),
                        Text(
                          datasaham['saham'],
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView(
                  
                  scrollDirection: Axis.vertical,
                  children: [
                    
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset("assets/grafikSahamDummy.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      const SizedBox(
                        width: double.infinity,
                        child: Text("Overview",
                            style: TextStyle(
                                color: Color(0XFF3D3D3D),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: "OpenSans")),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(Radius.circular(15))),
                        // color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 115,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(color: Colors.grey))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Open",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "OpenSans")),
                                          Text(
                                            datasaham['open'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("High",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "OpenSans")),
                                          Text(
                                            datasaham['high'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Low",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "OpenSans")),
                                          Text(
                                            datasaham['low'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Mkt Cap",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "OpenSans")),
                                          Text(
                                            datasaham['mktcap'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 115,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Close",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "OpenSans")),
                                          Text(
                                            datasaham['open'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("S2 WK High",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "OpenSans")),
                                          Text(
                                            datasaham['high'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("S2 WK Low",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "OpenSans")),
                                          Text(
                                            datasaham['low'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Vol(shares)",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "OpenSans")),
                                          Text(
                                            datasaham['mktcap'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 265,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                child: Text("Order Type", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: "OpenSans")),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: Text("Market Order", style: TextStyle(fontSize: 14, fontFamily: "OpenSans", color: Color(0XFF5D5D5D))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Harga",
                                      style: TextStyle(
                                          color: Color(0XFF5D5D5D),
                                          fontFamily: "OpenSans",
                                          fontSize: 15),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  
                                                  temp = temp - 1;
                                                  total = lot * temp * 100;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: const Color(0XFF5ADFB2)),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  child: Text(
                                                    "-",
                                                    style: TextStyle(
                                                        color: Color(0XFF5ADFB2)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(temp.toString()),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  
                                                  temp = temp + 1;
                                                  total = lot * temp * 100;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: const Color(0XFF5ADFB2)),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Color(0XFF5ADFB2)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Lot",
                                      style: TextStyle(
                                          color: Color(0XFF5D5D5D),
                                          fontFamily: "OpenSans",
                                          fontSize: 15),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  lot = lot - 1;
                                                  total = lot * temp * 100;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: const Color(0XFF5ADFB2)),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  child: Text(
                                                    "-",
                                                    style: TextStyle(
                                                        color: Color(0XFF5ADFB2)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(lot.toString()),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  lot = lot + 1;
                                                  total = lot * temp * 100;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: const Color(0XFF5ADFB2)),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Color(0XFF5ADFB2)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            persen = 25;
                                            press = 1;
                                            total = fixbuyingpower ~/ temp * temp * persen ~/ 100;
                                            lot = fixbuyingpower ~/ temp * persen ~/100;
                                           
                                            
                                          });
                                        },
                                        child: Text(
                                          "25%",
                                          style: TextStyle(
                                              color: press == 1
                                                  ? const Color(0XFF5ADFB2)
                                                  : Colors.black,
                                              fontFamily: "OpenSans"),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              persen = 50;
                                              press = 2;
                                              total = fixbuyingpower ~/ temp * temp * persen ~/ 100;
                                              lot = fixbuyingpower ~/ temp * persen ~/100;
                                            });
                                          },
                                          child: Text(
                                            "50%",
                                            style: TextStyle(
                                                color: press == 2
                                                    ? const Color(0XFF5ADFB2)
                                                    : Colors.black,
                                                fontFamily: "OpenSans"),
                                          )),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              persen = 75;
                                              press = 3;
                                              total = fixbuyingpower ~/ temp * temp * persen ~/ 100;
                                              lot = fixbuyingpower ~/ temp * persen ~/100;
                                            });
                                          },
                                          child: Text(
                                            "75%",
                                            style: TextStyle(
                                                color: press == 3
                                                    ? const Color(0XFF5ADFB2)
                                                    : Colors.black,
                                                fontFamily: "OpenSans"),
                                          )),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              persen = 100;
                                              press = 4;
                                              total = fixbuyingpower ~/ temp * temp * persen ~/ 100;
                                              lot = fixbuyingpower ~/ temp * persen ~/100;
                                            });
                                          },
                                          child: Text(
                                            "100%",
                                            style: TextStyle(
                                                color: press == 4
                                                    ? const Color(0XFF5ADFB2)
                                                    : Colors.black,
                                                fontFamily: "OpenSans"),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Buying Power",
                                      style: TextStyle(
                                          color: Color(0XFF5D5D5D),
                                          fontFamily: "OpenSans",
                                          fontSize: 15),
                                    ),
                                    Text(buyingPower.output.symbolOnLeft,
                                        style: const TextStyle(
                                            fontSize: 15, fontFamily: "OpenSans")),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Total",
                                      style: TextStyle(
                                          color: Color(0XFF5D5D5D),
                                          fontFamily: "OpenSans",
                                          fontSize: 15),
                                    ),
                                    Text(
                                      totalBeli.output.symbolOnLeft,
                                      style: const TextStyle(
                                          color: Color(0XFF5ADFB2),
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              )
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
                            const SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Order Book",
                                style: TextStyle(
                                    color: Color(0XFF3D3D3D),
                                    fontSize: 16,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Pilih angka di dalam tabel untuk menentukan harga yang diinginkan",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    color: Color(0XFF5D5D5D),
                                    fontSize: 12,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    color: const Color(0XFF5ADFB2).withOpacity(0.5),
                                    child: const Center(
                                      child: Text(
                                        "B.Lot",
                                        textAlign: TextAlign.center,
                                        
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    color: const Color(0XFF5ADFB2).withOpacity(0.5),
                                    child: const Center(
                                      child: Text(
                                        "Bid",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    color: const Color(0XFF5ADFB2).withOpacity(0.5),
                                    child: const Center(
                                      child: Text(
                                        "Ask",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    color: const Color(0XFF5ADFB2).withOpacity(0.5),
                                    child: const Center(
                                      child: Text(
                                        "A.Lot",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: datasaham['orderbook'].length,
                          itemBuilder: (context, index) => Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            datasaham['orderbook'][index][0]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            datasaham['orderbook'][index][1]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            datasaham['orderbook'][index][2]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: changecolor(
                                                    datasaham['orderbook'][index]
                                                        [2], hargapasar)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            datasaham['orderbook'][index][3]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: "OpenSans",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Running Trade",
                              style: TextStyle(
                                  color: Color(0XFF3D3D3D),
                                  fontSize: 16,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Pilih angka di dalam tabel untuk menentukan harga yang diinginkan",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Color(0XFF5D5D5D),
                                fontSize: 12,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  color: const Color(0XFF5ADFB2).withOpacity(0.5),
                                  child: const Center(
                                    child: Text(
                                      "Waktu",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  color: const Color(0XFF5ADFB2).withOpacity(0.5),
                                  child: const Center(
                                    child: Text(
                                      "Harga",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  color: const Color(0XFF5ADFB2).withOpacity(0.5),
                                  child: const Center(
                                    child: Text(
                                      "Aksi",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  color: const Color(0XFF5ADFB2).withOpacity(0.5),
                                  child: const Center(
                                    child: Text(
                                      "Vol",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: datasaham['runningtrade'].length,
                        itemBuilder: (context, index) => Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          datasaham['runningtrade'][index][0]
                                              .toString()
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: "OpenSans",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          datasaham['runningtrade'][index][1]
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: colorttrade(datasaham, index),
                                            fontFamily: "OpenSans",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          datasaham['runningtrade'][index][2]
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: colorttrade(datasaham, index),
                                            fontFamily: "OpenSans",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          datasaham['runningtrade'][index][3]
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: "OpenSans",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )],
        ),
      )),
      bottomNavigationBar: Container(

        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),),
        height: 75,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                      color: Color(0XFF5D5D5D),
                      fontFamily: "OpenSans",
                      fontSize: 14),
                ),
                Text(
                  totalBeli.output.symbolOnLeft,
                  style: const TextStyle(
                      color: Color(0XFF5ADFB2),
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  bt.showBottomDialog(context, datasaham, temp, total, lot, widget.user);
                });
              },
              child: Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color(0XFF5ADFB2),
                    borderRadius: BorderRadius.circular(6)),
                child: const Center(
                  child: Text(
                    "Beli",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.white, fontFamily: "OpenSans"),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

Color changecolor(var value, var hargapasar) {
  if (value < hargapasar) {
    return Colors.red;
  } else if (value > hargapasar) {
    return const Color(0XFF5ADFB2);
  } else if (hargapasar == value) {
    return Colors.black;
  } else {
    return Colors.transparent;
  }
}

Color colorttrade(value, index) {
  if (value['runningtrade'][index][2].toString() == "beli") {
    return const Color(0XFF21D152);
  } else {
    return Colors.red;
  }
}

class BottomDialog extends StatefulWidget {
  void showBottomDialog(BuildContext context, var datasaham, var temp, var total, var lot, var user) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Dialogcontent(datasaham: datasaham, temp: temp, total: total, lot: lot, user: user),
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
  // ignore: prefer_typing_uninitialized_variables
  var datasaham;
  var temp;
  var total;
  var lot;
  final AsyncSnapshot<User?> user;
  Dialogcontent({
    super.key,
    required this.datasaham,
    required this.temp,
    required this.total,
    required this.lot, required this.user,
  });

  @override
  State<Dialogcontent> createState() => _DialogcontentState();
}

class _DialogcontentState extends State<Dialogcontent> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: IntrinsicHeight(
        child: SizedBox(
          // decoration: BoxDecoration(
          //   color: Colors.white,
          // ),
          height: 305,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Konfirmasi Order",
                      style: TextStyle(
                        color: Color(0XFF3D3D3D),
                        fontSize: 17,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        child: const Text("X"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Symbol",
                      style: TextStyle(
                        color: Color(0XFF3D3D3D),
                        fontSize: 15,
                        fontFamily: "OpenSans",
                      ),
                    ),
                    Text(
                      widget.datasaham["symbol"].toString(),
                      style: const TextStyle(
                          color: Color(0XFF3D3D3D),
                          fontSize: 15,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Nama",
                      style: TextStyle(
                        color: Color(0XFF3D3D3D),
                        fontSize: 15,
                        fontFamily: "OpenSans",
                      ),
                    ),
                    Text(
                      widget.datasaham["namadetail"].toString(),
                      style: const TextStyle(
                          color: Color(0XFF3D3D3D),
                          fontSize: 15,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Type",
                      style: TextStyle(
                        color: Color(0XFF3D3D3D),
                        fontSize: 15,
                        fontFamily: "OpenSans",
                      ),
                    ),
                    Text(
                      "Beli",
                      style: TextStyle(
                          color: Color(0XFF3D3D3D),
                          fontSize: 15,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Valid Period",
                      style: TextStyle(
                        color: Color(0XFF3D3D3D),
                        fontSize: 15,
                        fontFamily: "OpenSans",
                      ),
                    ),
                    Text(
                      "Hari",
                      style: TextStyle(
                          color: Color(0XFF3D3D3D),
                          fontSize: 15,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(
                        color: Color(0XFF3D3D3D),
                        fontSize: 15,
                        fontFamily: "OpenSans",
                      ),
                    ),
                    Text(
                      "Rp ${widget.temp}",
                      style: const TextStyle(
                          color: Color(0XFF3D3D3D),
                          fontSize: 15,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Lot",
                      style: TextStyle(
                        color: Color(0XFF3D3D3D),
                        fontSize: 15,
                        fontFamily: "OpenSans",
                      ),
                    ),
                    Text(
                      widget.lot.toString(),
                      style: const TextStyle(
                          color: Color(0XFF3D3D3D),
                          fontSize: 15,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        color: Color(0XFF3D3D3D),
                        fontSize: 15,
                        fontFamily: "OpenSans",
                      ),
                    ),
                    Text(
                      "Rp ${widget.total}",
                      style: const TextStyle(
                          color: Color(0XFF3D3D3D),
                          fontSize: 15,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SahamPinPage(user: widget.user)));
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 360,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(0XFF5ADFB2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Beli Sekarang",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OpenSans"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
