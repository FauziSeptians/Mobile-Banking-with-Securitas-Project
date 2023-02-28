import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

//import transaksi
import 'package:uangin/pages/transaksi/penjualan.dart';
import 'package:uangin/pages/transaksi/pembelian.dart';
import 'package:uangin/pages/transaksi/mutasi.dart';
import 'package:uangin/pages/transaksi/riwayatcontent.dart';

class Semua extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const Semua({super.key, required this.user});

  @override
  State<Semua> createState() => _SemuaState();
}

// DATA SEMUA
List<Map> semuadata = [];
List<Map> newdata = [];

List<Map<dynamic, dynamic>> datapembelian = [
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2021-10-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2022-11-12 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
    {
      'validasi': 'Pembelian',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'pembelian': 'Sucorinvest Equity Fund',
      'status': 'Pembelian Berhasil',
      'tanggal': '2023-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '3.500.000'
    },
  ];

List<Map<dynamic, dynamic>> datapenjualan = [
    {
      'validasi': 'Penjualan',
      'image': './images/BBCA.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': './images/BBCA.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': './images/BBCA.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': './images/BBCA.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SSF_pt.png',
      'penjualan': 'Sucorinvest Equity Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '75000'
    },
  ];

class _SemuaState extends State<Semua> {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  
  
  List<Map<dynamic, dynamic>> datamutasi = [];

  @override
  void initState() {
    
    // fetchData();
    
    // newdata = [...datamutasi];
    
    super.initState();
  }

  void fetchData() async {
    semuadata.clear();
    newdata.clear();
    
    // ASSIGNDATA
    // semuadata.addAll(datamutasi);
    
    await firebase.collection('mutasiRekening').doc(widget.user.data!.email).get().then((value) {
      for (var i = 0; i < value.get('dataMutasi').length; i++) {
        semuadata.add({
          'bank': value.get('dataMutasi')[i]['bank'],
          'biaya': value.get('dataMutasi')[i]['biaya'],
          'mode': value.get('dataMutasi')[i]['mode'],
          'tanggal': value.get('dataMutasi')[i]['tanggal'],
          'tujuan': value.get('dataMutasi')[i]['tujuan'],
          'validasi': value.get('dataMutasi')[i]['validasi'],
        });
        
      }
    });

    
    newdata = [...semuadata];
    log(newdata.toString());
    setState(() {
      
    });
  }
  

  @override
  Widget build(BuildContext context) {
    // semuadata.clear();
    // newdata.clear();

    semuadata.addAll(datapembelian);
    // semuadata.addAll(datapenjualan);

    log(newdata.length.toString());

    semuadata.sort(
      (a, b) => b['tanggal'].compareTo(a['tanggal']),
    );
    // fetchData();

    // print(semuadata);
    return (newdata.isNotEmpty) ? SizedBox(
      // margin: EdgeInsets.only(top: 10),
      height: 300,
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: semuadata.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => validasi(semuadata, index)),
    ):
    SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

Widget validasi(value, index) {
  log(value[index]['validasi']);
  if (value[index]['validasi'] == 'Penjualan') {
    return  Container(
      child: Column(
        children: [
          Container(
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
                        Container(
                          child: Image.asset(
                            datapenjualan[index]['image'].toString(),
                            width: 60,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                datapenjualan[index]['penjualan'].toString(),
                                style: TextStyle(
                                  color: Color(0XFF5ADFB2),
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                datapenjualan[index]['status'].toString(),
                                style: TextStyle(
                                  color: Color(0XFF5D5D5D),
                                  fontSize: 11,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    DateFormat('dd MMM yyy').format(
                                            DateTime.parse(
                                                datapenjualan[index]
                                                    ['tanggal'])) +
                                        ' - ' +
                                        datapenjualan[index]['jenis']
                                            .toString(),
                                    style: TextStyle(
                                      color: Color(0XFF8D8D8D),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                  Container(
                    child: Text(
                      "Rp " + datapenjualan[index]['biaya'].toString(),
                      style: TextStyle(
                        color: Color(0XFFE74E4E),
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  } else if (value[index]['validasi'] == 'Pembelian') {
    return Container(
      margin: EdgeInsets.only(top: 10),
      // height: 300,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              datapembelian[index]['image'].toString(),
                              width: 60,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  datapembelian[index]['pembelian'].toString(),
                                  style: TextStyle(
                                    color: Color(0XFF5ADFB2),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  datapembelian[index]['status'].toString(),
                                  style: TextStyle(
                                    color: Color(0XFF5D5D5D),
                                    fontSize: 11,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      DateFormat('dd MMM yyy').format(
                                              DateTime.parse(
                                                  datapembelian[index]
                                                      ['tanggal'])) +
                                          ' - ' +
                                          datapembelian[index]['jenis']
                                              .toString(),
                                      style: TextStyle(
                                        color: Color(0XFF8D8D8D),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    child: Text(
                      "Rp " + datapembelian[index]['biaya'].toString(),
                      style: TextStyle(
                        color: Color(0XFF5ADFB2),
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  } else if (value[index]['validasi'] == 'Mutasi') {
    return Container(
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(child: imageconverter(newdata, index)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textconverter(newdata, index),
                                Text(
                                  newdata[index]['bank'].toString(),
                                  style: TextStyle(
                                    color: Color(0XFF5D5D5D),
                                    fontSize: 11,
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
                                      DateFormat('dd MMM yyy').format(
                                              DateTime.parse(
                                                  newdata[index]['tanggal'])) +
                                          " - " +
                                          DateFormat('H.m').format(
                                              DateTime.parse(
                                                  newdata[index]['tanggal'])) +
                                          " WIB",
                                      style: TextStyle(
                                          color: Color(0XFF8D8D8D),
                                          fontSize: 10),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                  biayaconverter(newdata, index)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  } else {
    return Text("");
  }
}

Widget imageconverter1(List<Map<dynamic, dynamic>> value, index) {
  if (value[index]['mode'].toString() == 'pemasukan') {
    return Image.asset("./images/pemasukan.png");
  } else if (value[index]['mode'].toString() == 'pengeluaran') {
    return Image.asset("./images/pengeluaran.png");
  } else {
    value[index].clear();
    return Text("eror");
  }
}

Widget textconverter1(List<Map<dynamic, dynamic>> value, index) {
  if (value[index]['mode'].toString() == 'pemasukan') {
    return Text("Dana Masuk dari " + value[index]['tujuan'].toString(),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ));
  } else if (value[index]['mode'].toString() == 'pengeluaran') {
    return Text("Transfer ke " + value[index]['tujuan'].toString(),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ));
  } else {
    return Text("EROR");
  }
}

Widget biayaconverter1(List<Map<dynamic, dynamic>> value, index) {
  if (value[index]['mode'].toString() == 'pengeluaran') {
    return Text(
      "Rp " + value[index]['biaya'].toString(),
      style: TextStyle(
        color: Color(0XFFE74E4E),
        fontSize: 15,
      ),
    );
  } else if (value[index]['mode'].toString() == 'pemasukan') {
    return Text(
      "Rp " + value[index]['biaya'].toString(),
      style: TextStyle(
        color: Color(0XFF20E2A1),
        fontSize: 15,
      ),
    );
  } else {
    return Text("EROR");
  }
}
