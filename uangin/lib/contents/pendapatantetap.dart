import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/pages/reksadana/reksadanadetailpage.dart';

import 'package:uangin/pages/reksadanapage.dart';

class PendapatanTetapContent extends StatefulWidget {
  const PendapatanTetapContent({super.key, required this.user});
  final AsyncSnapshot<User?> user;

  @override
  State<PendapatanTetapContent> createState() => _PendapatanTetapContentState();
}

int filterpress = 0;
int click = 0;
int urutkanpress = 0;

class _PendapatanTetapContentState extends State<PendapatanTetapContent> {
  BottomDialog bd = const BottomDialog();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.filter_alt_outlined),
            TextButton(
                onPressed: (() {
                  setState(() {
                    filterpress = 1;
                    bd.showBottomDialog(context);
                  });
                }),
                child: const Text("Filter", style: TextStyle(color: Colors.black, fontFamily: "OpenSans", fontSize: 16, fontWeight: FontWeight.w600))),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color(0XFFFFEFC3),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Reksa Dana Pendapatan Tetap",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Berikut adalah reksa dana pilihan kami dengan risiko moderat, potensi imbal hasil menengah, dan performa yang baik, cocok untuk jangka waktu investasi 1-3 tahun. Silahkan pilih salah satu yang paling sesuai untuk kamu. ", style: TextStyle(fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // KONTEN
        SizedBox(
          // color: Colors.yellow,
          height: 800,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              const Text(
                "Periode Imbal Hasil",
                style: TextStyle(
                    color: Color(0XFF5ADFB2),
                    fontSize: 16,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: const [
                Text("1 Tahun", style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500)),
                SizedBox(
                  width: 3,
                ),
                Icon(Icons.arrow_drop_down)
              ])
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // KONTEN
              InkWell(
                onTap: () {
                  setState(() {
                    reksapress = 1;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/MDL_pt.png",
                    name: "MNC Dana Likuid", yearReturn: 8.03, expense: 0.68, aum: 3.41, user: widget.user))
                    );
                    });
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/MDL_pt.png",
                    "MNC Dana Likuid", 8.03, 0.68, 3.41, 1),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    reksapress = 2;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/SPT_pt.png",
                    name: "Syailendra Pendapatan Tetap...", yearReturn: 7.68, expense: 0.61, aum: 1.38, user: widget.user))
                    );
                  });
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/SPT_pt.png",
                    "Syailendra Pendapatan Tetap...", 7.68, 0.61, 1.38, 2),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    reksapress = 3;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/BADPT_pt.png",
                    name: "BNI-AM Dana Pendapatan Tetap", yearReturn: -0.85, expense: 4.7, aum: 1.30, user: widget.user))
                    );
                  });
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/BADPT_pt.png",
                    "BNI-AM Dana Pendapatan Tetap", -0.85, 4.7, 1.30, 3),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    reksapress = 4;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/SSF_pt.png",
                    name: "Sucorinvest Stable Fund", yearReturn: 6.17, expense: 0.38, aum: 14.56, user: widget.user))
                    );
                  });
                },
                child: jenisreksadana(
                    "assets/Icon/Emiten/ReksaDana/SSF_pt.png",
                    "Sucorinvest Stable Fund",
                    6.17, 0.38, 14.56, 4),
              ),
            ],
          ),
        )
      ],
    );
  }
}
