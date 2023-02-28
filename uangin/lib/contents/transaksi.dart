import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/transaksi/pemesanancontent.dart';
import 'package:uangin/pages/transaksi/riwayatcontent.dart';

class Transaksi extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const Transaksi({super.key, required this.user});

  @override
  State<Transaksi> createState() => _TransaksiState();
}





class _TransaksiState extends State<Transaksi> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String databulan = DateFormat("MMMM yyyy", "id_ID").format(DateTime.now());
  MoneyFormatter? pemasukkan;
  MoneyFormatter? pengeluaran;
  int press = 0;
  Map<String, int> datauang = {
    'pemasukkan': 0,
    'pengeluaran': 0,
  };

  @override
  void initState() {
    firestore.collection('pengeluaran').doc(widget.user.data!.email).get().then((value) {
      setState(() {
        datauang['pengeluaran'] = value.get('Februari')['pengeluaran'];
        datauang['pemasukkan'] = value.get('Februari')['pemasukan'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pemasukkan = MoneyFormatter(
      amount: datauang['pemasukkan']!.toDouble(),
      settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short,
      )
    );
    pengeluaran = MoneyFormatter(
      amount: datauang['pengeluaran']!.toDouble(),
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
        child: SizedBox(
          height: 1400,
          child: Column(
            children: [
              const Center(
                  child: Text(
                "Transaksi",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
              )),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bulan",
                          style: TextStyle(
                              color: Color(0XFF8D8D8D), fontSize: 12, fontFamily: "OpenSans "),
                        ),
                        Text(
                          databulan,
                          style: const TextStyle(
                              color: UsedColor.primaryGreen, fontSize: 15, fontFamily: "OpenSans", fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Image.asset("assets/Icon/calendarIcon.png", width: 20, height: 20,)
                  ]),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/graphTransaksi.png"),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0XFFD7FFF1),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Color(0xff20E2A1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Pemasukan",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                            Text(
                              pemasukkan!.output.symbolOnLeft,
                              style: const TextStyle(
                                  color: Color(0XFF20E2A1), fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0XFFFFDADA),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Icon(
                                Icons.arrow_upward,
                                color: Color(0XFFB21E1E),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pengeluaran",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                Text(
                                  pengeluaran!.output.symbolOnLeft,
                                  style: TextStyle(
                                      color: Color(0XFFB21E1E), fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (() {
                        setState(() {
                          press = 0;
                        });
                      }),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: press == 0
                                        ? Color(0XFF5ADFB2)
                                        : Colors.grey))),
                        // color: Colors.red,
                        alignment: Alignment.center,
                        child: Text(
                          "Pemesanan",
                          style: TextStyle(
                              color:
                                  press == 0 ? UsedColor.primaryGreen : Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (() {
                        setState(() {
                          press = 1;
                        });
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: press == 1
                                        ? Color(0XFF5ADFB2)
                                        : Colors.grey))),
                        height: 40,
                        // color: Colors.blue,
                        alignment: Alignment.center,
                        child: Text(
                          "Riwayat Transaksi",
                          style: TextStyle(
                              color:
                                  press == 1 ? UsedColor.primaryGreen : Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans"),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              // press == 0 ? const PemesananKonten() : const RiwayatKonten(),
              Container(
                height: 500 - 179,
                child : press == 0 ? const PemesananKonten() : RiwayatKonten(user: widget.user,),
              )
            ],
          ),
        ),
      )),
    );
  }
}