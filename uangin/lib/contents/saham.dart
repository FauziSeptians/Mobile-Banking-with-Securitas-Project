import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/pages/reksadana/reksadanadetailpage.dart';

import 'package:uangin/pages/reksadanapage.dart';

class SahamContent extends StatefulWidget {
  const SahamContent({super.key, required this.user});
  final AsyncSnapshot<User?> user;

  @override
  State<SahamContent> createState() => _SahamContentState();
}

int filterpress = 0;
int click = 0;
int urutkanpress = 0;

class _SahamContentState extends State<SahamContent> {
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
                  "Reksa Dana Saham",
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
                  "Berikut adalah reksa dana pilihan kami dengan risiko tinggi, potensi imbal hasil tinggi, dan performa yang baik, cocok untuk jangka waktu investasi >= 5 tahun. Silahkan pilih salah satu yang paling sesuai untuk kamu. ", style: TextStyle(fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w400),
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
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/BDKM_pu.png",
                    name: "BNI PAribas SRI KEHATI", yearReturn: 9.91, expense: 2.13, aum: 1.24, user: widget.user,))
                    );
                  });
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/BDKM_pu.png",
                    "BNI Paribas SRI KEHATI", 9.91, 2.13, 1.24, 1),
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
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/MSA_s.png",
                    name: "Manulife Saham Andalan", yearReturn: -17.99, expense: 4.75, aum: 3.02, user: widget.user))
                    );
                  });
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/MSA_s.png",
                    "Manulife Saham Andalan", -17.99, 4.75, 3.02, 2),
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
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/BDL_pu.png",
                    name: "BNI-AM Indeks IDX30", yearReturn: -4.55, expense: 1.57, aum: 1.72, user: widget.user))
                    );
                  });
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/BDL_pu.png",
                    "BNI-AM Indeks IDX30", -4.55, 1.57, 1.72, 3),
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
                    name: "Sucorinvest Equity Fund", yearReturn: 4.36, expense: 4.37, aum: 3.17, user: widget.user))
                    );
                  });
                },
                child: jenisreksadana(
                    "assets/Icon/Emiten/ReksaDana/SSF_pt.png",
                    "Sucorinvest Equity Fund",
                    4.36, 4.73, 3.17, 4),
              ),
            ],
          ),
        )
      ],
    );
  }
}
