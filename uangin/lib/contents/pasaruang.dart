import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/pages/reksadana/reksadanadetailpage.dart';

import 'package:uangin/pages/reksadanapage.dart';

class PasarUangContent extends StatefulWidget {
  const PasarUangContent({super.key, required this.user});
  final AsyncSnapshot<User?> user;

  @override
  State<PasarUangContent> createState() => _PasarUangContentState();
}

int filterpress = 0;
int click = 0;
int urutkanpress = 0;

class _PasarUangContentState extends State<PasarUangContent> {
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
                  "Reksa Dana Pasar Uang",
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
                  "Berikut adalah reksa dana pilihan kami dengan risiko rendah, potensi imbal hasil rendah, dan performa yang baik, cocok untuk jangka waktu investasi <= 1 tahun. Silahkan pilih salah satu yang paling sesuai untuk kamu. ", style: TextStyle(fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w400),
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
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/SMMF_pu.png",
                    name: "Sucorinvest Money Market Fund", yearReturn: 4.19, expense: 1.49, aum: 9.49, user: widget.user,))
                    );});
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/SMMF_pu.png",
                    "Sucorinvest Money Market Fund", 4.19, 1.49, 9.49, 1),
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
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/BDKM_pu.png",
                    name: "Batavia Dana Kas Maxima", yearReturn: 2.34, expense: 1.99, aum: 11.38, user: widget.user))
                    );});
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/BDKM_pu.png",
                    "Batavia Dana Kas Maxima", 2.34, 1.99, 11.38, 2),
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
                    name: "Bahana Dana Likuid", yearReturn: 2.39, expense: 1.27, aum: 4.90, user: widget.user))
                    );});
                },
                child: jenisreksadana("assets/Icon/Emiten/ReksaDana/BDL_pu.png",
                    "Bahana Dana Likuid", 2.39, 1.27, 4.90, 3),
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
                            builder: (context) => ReksadanaDetail(img: "assets/Icon/Emiten/ReksaDana/SSMM_pu.png",
                    name: "Sucorinvest Sharia Money Market", yearReturn: 3.82, expense: 0.95, aum: 2.62, user: widget.user))
                    );});
                },
                child: jenisreksadana(
                    "assets/Icon/Emiten/ReksaDana/SSMM_pu.png",
                    "Sucorinvest Sharia Money Market...",
                    3.82, 0.95, 2.62, 4),
              ),
            ],
          ),
        )
      ],
    );
  }
}
