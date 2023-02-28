import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/pages/portfolio/Jualalert.dart';
import 'package:uangin/pages/portfolio/kontenportofolio.dart';
import 'package:uangin/pages/portfolio/portopage.dart';
import 'package:uangin/pages/portfolio/Topup.dart';
import 'package:intl/intl.dart';

class Penjualanberhasil extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const Penjualanberhasil(
      {super.key,
      this.image,
      this.nama,
      this.unit,
      this.nilaijual,
      this.rekeningpenerima,
      this.bankpenerima, required this.user});
  final double? unit;
  final double? nilaijual;
  final String? image;
  final String? nama;
  final String? rekeningpenerima;
  final String? bankpenerima;

  @override
  State<Penjualanberhasil> createState() => _PenjualanberhasilState(
      image, nama, unit, nilaijual, rekeningpenerima, bankpenerima);
}

class _PenjualanberhasilState extends State<Penjualanberhasil> {
  final double? unit;
  final double? nilaijual;
  final String? image;
  final String? nama;
  final String? rekeningperima;
  final String? bankpenerima;

  _PenjualanberhasilState(this.image, this.nama, this.unit, this.nilaijual,
      this.rekeningperima, this.bankpenerima);
  String waktpenjualan = DateFormat("dd MMMM y H:m").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Material(
                              child: InkWell(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PortoPage(user: widget.user)));
                                }),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0XFFF5F5F5)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.arrow_back_ios_outlined,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            const Text(
                              "Detail Penjualan",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        child: const Text(
                          "Dana akan masuk ke rekening kamu maksimum 7 hari kerja",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "OpenSans"
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Color(0XFFF0F0F0)))),
                          // color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(image!),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(nama!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            decoration: TextDecoration.none,
                                            color: Color(0XFF5ADFB2))),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Text("Reksa Dana Saham",
                                        style: TextStyle(
                                            fontSize: 12,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Unit",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontFamily: "OpenSans"),
                                ),
                                const SizedBox(
                                  width: 156,
                                ),
                                const Text(
                                  "S2676018MV4DJ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontFamily: "OpenSans"),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Perkiraan Nilai Jual",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontFamily: "OpenSans"),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                Text(
                                  "Rp " + nilaijual!.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontFamily: "OpenSans"),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Jumlah Unit",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontFamily: "OpenSans"),
                                ),
                                const SizedBox(
                                  width: 106,
                                ),
                                Text(
                                  unit.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontFamily: "OpenSans"),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Manajer Investasi",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontFamily: "OpenSans"),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Container(
                                  // color: Colors.blue,
                                  width: 167,
                                  child: const Text(
                                    "PT. Manulife Aset Manajemen Indonesia",
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontFamily: "OpenSans"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              width: double.infinity,
                              child: const Text("Nomor Rekening Penerim Dana", style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "OpenSans"
                              ),),
                            ),
                            Material(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    buttonover1 = 0;
                                  });
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(children: [
                                          Image.asset(
                                            bankpenerima.toString(),
                                            width: 60,
                                            height: 60,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Julius Salim",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: buttonover1 == 0
                                                        ? const Color(0XFF5ADFB2)
                                                        : Colors.black,
                                                        fontFamily: "OpenSans"),
                                              ),
                                              Text(
                                                rekeningperima.toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          )
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: const Text("Status Order", style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "OpenSans"
                              ),),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0XFF5ADFB2),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Penjualan Diterima",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.none,
                                                color: Color(0XFF5ADFB2))),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(waktpenjualan.toString()),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Material(
                      child: InkWell(
                        onTap: (() {
                          if (confirmation == 1) {
                            setState(() {
                              passingnewunit = 0;
                              confirmation = 0;
                              validation = 0;
                            });
                            Navigator.popUntil(context, (route) => route.isFirst);
                          }
                        }),
                        child: AnimatedContainer(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0XFF5ADFB2),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: const Duration(milliseconds: 150),
                          child: const Center(
                            child: Text(
                              "Kembali ke Home",
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
