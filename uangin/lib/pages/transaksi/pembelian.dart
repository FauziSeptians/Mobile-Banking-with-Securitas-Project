import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

class Pembelian extends StatefulWidget {
  const Pembelian({super.key});

  @override
  State<Pembelian> createState() => _PembelianState();
}


class _PembelianState extends State<Pembelian> {
  List<Map<dynamic, dynamic>> datapembelian = [
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SMMF_pu.png',
      'pembelian': 'Sucorinvest Flexi Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '700000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ANTM_icon.png',
      'pembelian': 'ANTM',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Saham',
      'biaya': '1000000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/WIRG_icon.png',
      'pembelian': 'WIRG',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Saham',
      'biaya': '40000000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/MSA_s.png',
      'pembelian': 'Manulife Dana Kas II Kelas A',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '500000'
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    datapembelian.sort((a, b) => b['tanggal'].compareTo(a['tanggal']));
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 300,
      child: ListView.builder(
        
        // shrinkWrap: true,
        itemCount: datapembelian.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          MoneyFormatter biaya = MoneyFormatter(
          amount: double.parse(datapembelian[index]['biaya'].toString()),
          settings: MoneyFormatterSettings(
              symbol: 'Rp',
              thousandSeparator: '.',
              decimalSeparator: ',',
              symbolAndNumberSeparator: ' ',
              fractionDigits: 0,
              compactFormatType: CompactFormatType.short));
          return Column(
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
                                width: 50,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              // color: Colors.red,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    datapembelian[index]['pembelian']
                                        .toString(),
                                    style: TextStyle(
                                      color: Color(0XFF5ADFB2),
                                      fontSize: 15,
                                      fontFamily: "OpenSans"
                                    ),
                                  ),
                                  Text(
                                    datapembelian[index]['status'].toString(),
                                    style: TextStyle(
                                      color: Color(0XFF5D5D5D),
                                      fontSize: 11,
                                      fontFamily: "OpenSans"
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${DateFormat('dd MMM yyy').format(
                                                DateTime.parse(
                                                    datapembelian[index]
                                                        ['tanggal']))} - ${datapembelian[index]['jenis']}',
                                        style: TextStyle(
                                          color: Color(0XFF8D8D8D),
                                          fontSize: 10,
                                          fontFamily: "OpenSans"
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                    Text(
                      biaya.output.symbolOnLeft.toString(),
                      style: TextStyle(
                        color: Color(0XFF5ADFB2),
                        fontSize: 15,
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
        );}
      ),
    );
  }
}
