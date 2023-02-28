import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

class Penjualan extends StatefulWidget {
  const Penjualan({super.key});

  @override
  State<Penjualan> createState() => _PenjualanState();
}



class _PenjualanState extends State<Penjualan> {
  List<Map<dynamic, dynamic>> datapenjualan = [
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/SMMF_pu.png',
      'penjualan': 'Sucorinvest Flexi Fund',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '700000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ANTM_icon.png',
      'penjualan': 'ANTM',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Saham',
      'biaya': '1000000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/ReksaDana/MSA_s.png',
      'penjualan': 'Manulife Dana Kas II Kelas A',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Reksadana Saham',
      'biaya': '500000'
    },
    {
      'validasi': 'Penjualan',
      'image': 'assets/Icon/Emiten/WIRG_icon.png',
      'penjualan': 'WIRG',
      'status': 'Penjualan Berhasil',
      'tanggal': '2022-12-19 08:45:00',
      'jenis': 'Saham',
      'biaya': '40000000'
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    datapenjualan.sort(
      (a, b) => b['tanggal'].compareTo(a['tanggal']),
    );

    
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 300,
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: datapenjualan.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          MoneyFormatter biaya = MoneyFormatter(
          amount: double.parse(datapenjualan[index]['biaya'].toString()),
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
                decoration: const BoxDecoration(
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
                                  datapenjualan[index]['image'].toString(),
                                  width: 50,
                                ),
                              ),
                              const SizedBox(
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
                                      datapenjualan[index]['penjualan']
                                          .toString(),
                                      style: const TextStyle(
                                        color: Color(0XFF5ADFB2),
                                        fontSize: 15,
                                        fontFamily: "OpenSans"
                                      ),
                                    ),
                                    Text(
                                      datapenjualan[index]['status'].toString(),
                                      style: const TextStyle(
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
                                                      datapenjualan[index]
                                                          ['tanggal']))} - ${datapenjualan[index]['jenis']}',
                                          style: const TextStyle(
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
                      Container(
                        child: Text(
                          biaya.output.symbolOnLeft.toString(),
                          style: const TextStyle(
                            color: Color(0XFFE74E4E),
                            fontSize: 15,
                            fontFamily: "OpenSans"
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          );
        }
      ),
    );
  }
}
