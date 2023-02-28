import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/classes/color_scheme.dart';


class Mutasi extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const Mutasi({super.key, required this.user});

  @override
  State<Mutasi> createState() => _MutasiState();
}



MoneyFormatter? parameterBerita;

class _MutasiState extends State<Mutasi> {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  List<Map<dynamic, dynamic>> datamutasi = [];

  @override
  void initState() {
    fetchData();
    
    newdata = [...datamutasi];
    
    super.initState();
  }

  void fetchData() async {
    await firebase.collection('mutasiRekening').doc(widget.user.data!.email).get().then((value) {
      for (var i = 0; i < value.get('dataMutasi').length; i++) {
        datamutasi.add({
          'bank': value.get('dataMutasi')[i]['bank'],
          'biaya': value.get('dataMutasi')[i]['biaya'],
          'mode': value.get('dataMutasi')[i]['mode'],
          'tanggal': value.get('dataMutasi')[i]['tanggal'],
          'tujuan': value.get('dataMutasi')[i]['tujuan'],
          'validasi': value.get('dataMutasi')[i]['validasi'],
        });
      }
      // log(widget.user.data!.email.toString());
    });

    log(datamutasi.toString());
    newdata = [...datamutasi];
    setState(() {
      
    });
  }
  List<Map>? newdata;

  @override
  Widget build(BuildContext context) {
    
    newdata!.sort((a, b) => b['tanggal'].compareTo(a['tanggal']));

    return (newdata!.isNotEmpty) ? Container(
      margin: const EdgeInsets.only(top: 10),
      height: 300,
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: newdata!.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: 80,
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(child: imageconverter(newdata!, index)),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textconverter(newdata!, index),
                              Text(
                                newdata![index]['bank'].toString(),
                                style: const TextStyle(
                                  color: Color(0XFF5D5D5D),
                                  fontSize: 11,
                                  fontFamily: "OpenSans"
                                ),
                              ),
                              Row(
                                children: [
                                  // Text(
                                  //   newdata[index]['tanggal'].toString() +
                                  //       ' - ' +
                                  //       newdata[index]['waktu'].toString(),
                                  //   style: TextStyle(
                                  //     color: Color(0XFF8D8D8D),
                                  //     fontSize: 10,
                                  //   ),
                                  // ),
                                  Text(
                                    "${DateFormat('dd MMM yyy').format(
                                            DateTime.parse(newdata![index]
                                                ['tanggal']))} - ${DateFormat('H.m').format(
                                            DateTime.parse(newdata![index]
                                                ['tanggal']))} WIB",
                                    style: const TextStyle(
                                        color: Color(0XFF8D8D8D),
                                        fontSize: 10, fontFamily: "OpenSans"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ]),
                    biayaconverter(newdata!, index)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ):
    Container(
      height: MediaQuery.of(context).size.height * 0.3,
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
    );
  }
}

Widget imageconverter(List<Map<dynamic, dynamic>> value, index) {
  if (value[index]['mode'].toString() == 'pemasukan') {
    return Image.asset("assets/Icon/danaMasukIcon.png", width: 50);
  } else if (value[index]['mode'].toString() == 'pengeluaran') {
    return Image.asset("assets/Icon/danaKeluarIcon.png", width: 50);
  } else {
    value[index].clear();
    return const Text("Error");
  }
}

Widget textconverter(List<Map<dynamic, dynamic>> value, index) {
  if (value[index]['mode'].toString() == 'pemasukan') {
    return SizedBox(
      width: 211,
      child: Text("Dana Masuk dari ${value[index]['tujuan']}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: "OpenSans"
          ),
          
          ),
    );
  } else if (value[index]['mode'].toString() == 'pengeluaran') {
    return Container(
      width: 211,
      child: Text("Transfer ke ${value[index]['tujuan']}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: "OpenSans"
          )),
    );
  } else {
    return const Text("Error");
  }
}

Widget biayaconverter(List<Map<dynamic, dynamic>> value, index) {
  if (value[index]['mode'].toString() == 'pengeluaran') {
    MoneyFormatter biaya = MoneyFormatter(
      amount: double.parse(value[index]['biaya'].toString()),
      settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short));
    return Text(
      biaya.output.symbolOnLeft,
      style: const TextStyle(
        color: Color(0XFFE74E4E),
        fontSize: 14,
        fontFamily: "OpenSans"
      ),
    );
  } else if (value[index]['mode'].toString() == 'pemasukan') {
    MoneyFormatter biaya = MoneyFormatter(
      amount: double.parse(value[index]['biaya'].toString()),
      settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short));
    return Text(
      biaya.output.symbolOnLeft,
      style: const TextStyle(
        color: Color(0XFF20E2A1),
        fontSize: 15,
        fontFamily: "OpenSans"
      ),
    );
  } else {
    return const Text("Error");
  }
}
