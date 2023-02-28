import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';

import 'package:uangin/pages/portfolio/invest.dart';
import 'package:uangin/pages/portfolio/lainnya.dart';

class AlokasiKonten extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const AlokasiKonten({super.key, required this.user});

  @override
  State<AlokasiKonten> createState() => _AlokasiKontenState();
}

int presbutton = 0;

class _AlokasiKontenState extends State<AlokasiKonten> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  setState(() {
                    presbutton = 0;
                  });
                },
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: presbutton == 0
                          ? UsedColor.primaryGreen
                          : Colors.white,
                      border: Border.all(
                          color: presbutton == 0
                              ? Colors.transparent
                              : Colors.grey)),
                  child: Center(
                    child: Text(
                      "Investasi",
                      style: TextStyle(
                          color: presbutton == 0
                              ? Colors.white
                              : const Color(0XFF8D8D8D),
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              fontFamily: 'OpenSans'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  setState(() {
                    presbutton = 1;
                  });
                },
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: presbutton == 1
                          ? UsedColor.primaryGreen
                          : Colors.white,
                      border: Border.all(
                          color: presbutton == 1
                              ? Colors.transparent
                              : Colors.grey)),
                  child: Center(
                    child: Text(
                      "Lainnya",
                      style: TextStyle(
                          color: presbutton == 1
                              ? Colors.white
                              : Color(0XFF8D8D8D),
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              fontFamily: 'OpenSans'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        presbutton == 0 ? InvestasiPortofolio(user: widget.user) : const Lainnyapage()
      ],
    );
  }
}
