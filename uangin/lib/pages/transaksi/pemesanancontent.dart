import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/transaksi/pemesananwidget.dart';

class PemesananKonten extends StatefulWidget {
  const PemesananKonten({super.key});

  @override
  State<PemesananKonten> createState() => _PemesananKontenState();
}

int change = 1;

class _PemesananKontenState extends State<PemesananKonten> {
  List<Map<String, String>> pemesananreksadana = [
    {
      'image': "assets/Icon/Emiten/ReksaDana/MSA_s.png",
      'nama': 'MANULIFE Saham Andalan',
      'jenis': 'saham',
      'pembelian': '2.500.000',
      'validasi': '0'
    },
    {
      'image': 'assets/Icon/Emiten/ReksaDana/BDKM_pu.png',
      'nama': 'BNP Paribas Sri Kehati',
      'jenis': 'saham',
      'pembelian': '1.200.000',
      'validasi': '1'
    },
    {
      'image': 'assets/Icon/Emiten/ReksaDana/MDL_pt.png',
      'nama': 'MNC Dana Likuid',
      'jenis': 'saham',
      'pembelian': '990.000',
      'validasi': '1'
    },
     {
      'image': "assets/Icon/Emiten/ReksaDana/MSA_s.png",
      'nama': 'MANULIFE Saham Andalan',
      'jenis': 'saham',
      'pembelian': '2.500.000',
      'validasi': '0'
    },
    {
      'image': 'assets/Icon/Emiten/ReksaDana/BDKM_pu.png',
      'nama': 'BNP Paribas Sri Kehati',
      'jenis': 'saham',
      'pembelian': '1.200.000',
      'validasi': '1'
    },
    {
      'image': 'assets/Icon/Emiten/ReksaDana/MDL_pt.png',
      'nama': 'MNC Dana Likuid',
      'jenis': 'saham',
      'pembelian': '990.000',
      'validasi': '1'
    },

    
  ];

  // SAHAM
  List<Map<String, String>> pemesanansaham = [
     {
      'image': "assets/Icon/Emiten/ReksaDana/MSA_s.png",
      'nama': 'MANULIFE Saham Andalan',
      'jenis': 'saham',
      'pembelian': '2.500.000',
      'validasi': '0'
    },
    {
      'image': 'assets/Icon/Emiten/ReksaDana/BDKM_pu.png',
      'nama': 'BNP Paribas Sri Kehati',
      'jenis': 'saham',
      'pembelian': '1.200.000',
      'validasi': '1'
    },
    {
      'image': 'assets/Icon/Emiten/ReksaDana/MDL_pt.png',
      'nama': 'MNC Dana Likuid',
      'jenis': 'saham',
      'pembelian': '990.000',
      'validasi': '0'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  change = 1;
                });
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                            color: change != 1
                                ? Colors.grey
                                : Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(15),
                    color: change == 1 ? UsedColor.primaryGreen : Colors.white),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("SBN",
                        style: TextStyle(
                            color: change == 1 ? Colors.white : Colors.black,
                            fontFamily: "OpenSans")),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  change = 2;
                });
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                            color: change != 2
                                ? Colors.grey
                                : Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(15),
                    color: change == 2 ? Color(0XFF5ADFB2) : Colors.white),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20),
                    child: Text("Saham",
                        style: TextStyle(
                            color: change == 2 ? Colors.white : Colors.black, fontFamily: "OpenSans")),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  change = 3;
                });
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                            color: change != 3
                                ? Colors.grey
                                : Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(15),
                    color: change == 3 ? Color(0XFF5ADFB2) : Colors.white),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 13, right: 13),
                    child: Text("Reksadana",
                        style: TextStyle(
                            color: change == 3 ? Colors.white : Colors.black, fontFamily: "OpenSans")),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 450 - 188,
          child: switchkonten(change, pemesananreksadana, pemesanansaham)
        )
      ],
    );
  }
}

Widget switchkonten(int input, List<Map<String, String>> pemesananreksadana, List<Map<String, String>> pemesanansaham) {
  if (input == 3) {
    return WPemesanan(temp: pemesananreksadana);
  } else if (input == 1) {
    return WPemesanan(temp: pemesanansaham);
  } else if (input == 2) {
    return WPemesanan(temp: pemesanansaham);
  }
  return Text(("Eror"));
}
