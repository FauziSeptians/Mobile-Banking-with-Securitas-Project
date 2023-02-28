import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/pages/reksadana/reksadanadetailpage.dart';

import 'package:uangin/pages/reksadanapage.dart';

class CampuranContent extends StatefulWidget {
  const CampuranContent({super.key, required this.user});
  final AsyncSnapshot<User?> user;

  @override
  State<CampuranContent> createState() => _CampuranContentState();
}

int filterpress = 0;
int click = 0;
int urutkanpress = 0;

class _CampuranContentState extends State<CampuranContent> {
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
                  "Reksa Dana Campuran",
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
                  "Berikut adalah reksa dana pilihan kami dengan risiko moderat tinggi, potensi imbal hasil tinggi, dan performa yang baik, cocok untuk jangka menengah hingga panjang 3-5 tahun. Silahkan pilih salah satu yang paling sesuai untuk kamu. ", style: TextStyle(fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w400),
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
                    
                  });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/SSF_pt.png",
                    name: "Sucorinvest Flexi Fund", yearReturn: 3.93, expense: 0.68, aum: 369, user: widget.user,))
                    );
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/SSF_pt.png",
                    "Sucorinvest Flexi Fund", 3.93, 0.68, 369, 1),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    reksapress = 2;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/SSF_pt.png",
                  name: "Sucorinvest Premium Fund", yearReturn: 15.35, expense: 0.61, aum: 1.52, user: widget.user))
                  );
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/SSF_pt.png",
                    "Sucorinvest Premium Fund", 15.35, 0.61, 1.52, 2),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    reksapress = 3;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/SDC_c.png",
                  name: "Setiabudi Dana Campuran", yearReturn: 11.34, expense: 4.7, aum: 2.30, user: widget.user))
                  );
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/SDC_c.png",
                    "Setiabudi Dana Campuran", 11.34, 4.7, 2.30, 3),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    reksapress = 4;
                  });
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/SBF_c.png",
                  name: "Shinhan Balance Fund", yearReturn: -2.94, expense: 0.38, aum: 321,user: widget.user)));
                },
                child: jenisreksadana(
                    "assets/Icon/Emiten/ReksaDana/SBF_c.png",
                    "Shinhan Balance Fund",
                    -2.94,
                    0.38,
                    321,
                    4),
              ),
            ],
          ),
        )
      ],
    );
  }
}
