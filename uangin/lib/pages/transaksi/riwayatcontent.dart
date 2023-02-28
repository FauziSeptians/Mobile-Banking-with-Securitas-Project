import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/contents/home.dart';
import 'package:uangin/pages/transaksi/mutasi.dart';
import 'package:uangin/pages/transaksi/pembelian.dart';
import 'package:uangin/pages/transaksi/semua.dart';


import 'penjualan.dart';

class RiwayatKonten extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const RiwayatKonten({super.key, required this.user});

  @override
  State<RiwayatKonten> createState() => _RiwayatKontenState();
}

List<Map> data = [
  {'title': 'Semua', 'selected': true},
  {'title': 'Pembelian', 'selected': false},
  {'title': 'Penjualan', 'selected': false},
  {'title': 'Mutasi', 'selected': false}
];

int tap = 0;

class _RiwayatKontenState extends State<RiwayatKonten> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 360,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: 1000,
            height: 30,
            child: ListView.separated(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    tap = index;
                    setState(() {
                      for (var element in data) {
                        element['selected'] = false;
                      }
                      data[index]['selected'] = true;
                    });
                  },
                  child: Container(
                    
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: data[index]['selected'] == false
                                ? Colors.grey
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(50),
                        color: data[index]['selected'] == true
                            ? UsedColor.primaryGreen
                            : Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 6, bottom: 5, left: 13, right: 13),
                      child: Text(data[index]['title'],
                          style: TextStyle(
                              color: data[index]['selected'] == true
                                  ? Colors.white
                                  : Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: 'OpenSans')),
                    ),
                  ),
                );
              },
            ),
          ),
          pindahkonten(tap, widget.user)
        ],
      ),
    );
  }
}

Widget pindahkonten(key, user) {
  print(key);
  switch (key) {
    case 0:
      return Semua(user: user);
    case 3:
      return Mutasi(user: user);

    case 2:
      return const Penjualan();
    case 1:
      return Pembelian();
    default:
      return Text("");
  }
}
