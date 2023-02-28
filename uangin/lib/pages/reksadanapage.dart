import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';


import 'package:uangin/contents/pasaruang.dart';
import 'package:uangin/contents/pendapatantetap.dart';
import 'package:uangin/contents/campuran.dart';
import 'package:uangin/contents/saham.dart';


int click = 0;
int reksapress = 0;
int urutkanpress = 0;

class ReksadanaPage extends StatefulWidget {
  final int? index;
  final AsyncSnapshot<User?> user;
  const ReksadanaPage({Key? key, this.index, required this.user}) : super(key: key);

  @override
  State<ReksadanaPage> createState() => _ReksadanaState(index);
}

class _ReksadanaState extends State<ReksadanaPage> {
  final int? index;
  _ReksadanaState(this.index);

  int? newIndex;
  @override
  void initState() {
    newIndex = index!;
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 5,
            pinned: true,
            shadowColor: Colors.transparent,
          ),

          SliverToBoxAdapter(
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    shape: const CircleBorder(),
                    foregroundColor: const Color(0xff5ADFB2),
                    disabledForegroundColor:const Color(0xff5ADFB2),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 22,
                    color: Color(0xff5ADFB2),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Reksa Dana',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: UsedColor.primaryGrey,
                        fontFamily: "OpenSans"
                      ),
                    ),
                  ],
                ),
                )
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 40,
              
              decoration: const BoxDecoration(border:Border(bottom: BorderSide(color: UsedColor.primaryGrey, width: 0.2))),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 25, right: 25),
                children: [
                      InkWell(
                        onTap: (() {
                          setState(() {
                            newIndex = 0;
                          });
                        }),
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: (newIndex == 0)
                                          ? UsedColor.primaryGreen
                                          : Colors.grey.shade100))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, top: 10),
                            child: Text(
                              "Pasar Uang",
                              style: TextStyle(
                                  color: (newIndex == 0)
                                      ? UsedColor.primaryGreen
                                      : UsedColor.primaryGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "OpenSans"),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            newIndex = 1;
                          });
                        }),
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: newIndex == 1
                                          ? const Color(0XFF5ADFB2)
                                          : Colors.grey.shade100))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, top: 10),
                            child: Text(
                              "Pendapatan Tetap",
                              style: TextStyle(
                                  color: newIndex == 1
                                      ? UsedColor.primaryGreen
                                      : UsedColor.primaryGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "OpenSans"),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            newIndex = 2;
                          });
                        }),
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: newIndex == 2
                                          ? const Color(0XFF5ADFB2)
                                          : Colors.grey.shade100))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, top: 10),
                            child: Text(
                              "Campuran",
                              style: TextStyle(
                                  color: newIndex == 2
                                      ? UsedColor.primaryGreen
                                      : UsedColor.primaryGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "OpenSans"),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            newIndex = 3;
                          });
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: newIndex == 3
                                          ? const Color(0XFF5ADFB2)
                                          : Colors.grey.shade100))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, top: 10),
                            child: Text(
                              "Saham",
                              style: TextStyle(
                                  color: newIndex == 3
                                      ? UsedColor.primaryGreen
                                      : UsedColor.primaryGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "OpenSans"),
                            ),
                          ),
                        ),
                      ),
                    ]
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(margin: const EdgeInsets.only(left: 20, right: 20),child: Konten(newIndex!, widget.user)),
          ),
          
        ]
      )
    );
  }

  // ignore: non_constant_identifier_names
  Widget Konten(int index, AsyncSnapshot<User?> user){
    if (index == 0) {
      return PasarUangContent(user: user,);
    } else if (index == 1) {
      return PendapatanTetapContent(user: user,);
    } else if (index == 2) {
      return CampuranContent(user: user,);
    } else if (index == 3) {
      return SahamContent(user: user,);
    }
    // else if (index == 2) return const CampuranContent();
    // else if (index == 3) return const SahamContent();
    // else

    return Container();
  }
}

class BottomDialog extends StatefulWidget {
  const BottomDialog({super.key});

  void showBottomDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return const Align(
          alignment: Alignment.bottomCenter,
          child: Dialogcontent(),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class Dialogcontent extends StatefulWidget {
  const Dialogcontent({super.key});

  @override
  State<Dialogcontent> createState() => _DialogcontentState();
}

class _DialogcontentState extends State<Dialogcontent> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        height: 280,
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text(
                    "Filter Berdasarkan",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: "OpenSans",
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      )
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          click = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: click == 1
                                ? const Color(0XFF5ADFB2)
                                : Colors.transparent,
                            border: Border.all(
                                color: click == 1
                                    ? Colors.transparent
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 17, right: 17),
                          child: Text("Total AUM",
                              style: TextStyle(
                                color: click == 1
                                    ? Colors.white
                                    : const Color(0XFF8D8D8D),
                                fontSize: 11,
                                // decoration: TextDecoration.none,
                                fontFamily: "OpenSans",
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          click = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: click == 2
                                ? const Color(0XFF5ADFB2)
                                : Colors.transparent,
                            border: Border.all(
                                color: click == 2
                                    ? Colors.transparent
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 17, right: 17),
                          child: Text("Return",
                              style: TextStyle(
                                color: click == 2
                                    ? Colors.white
                                    : const Color(0XFF8D8D8D),
                                fontSize: 11,
                                // decoration: TextDecoration.none,
                                fontFamily: "OpenSans",
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          click = 3;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: click == 3
                                ? const Color(0XFF5ADFB2)
                                : Colors.transparent,
                            border: Border.all(
                                color: click == 3
                                    ? Colors.transparent
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 17, right: 17),
                          child: Text("Expense Ratio",
                              style: TextStyle(
                                color: click == 3
                                    ? Colors.white
                                    : const Color(0XFF8D8D8D),
                                fontSize: 11,
                                // decoration: TextDecoration.none,
                                fontFamily: "OpenSans",
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Urutkan Dari",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontFamily: "OpenSans",
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          urutkanpress = 1;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: urutkanpress == 1
                                        ? Colors.transparent
                                        : const Color(0XFF8D8D8D)),
                                color: urutkanpress == 1
                                    ? const Color(0XFF5ADFB2)
                                    : Colors.white),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("Tertinggi",
                              style: TextStyle(
                                color: urutkanpress == 1
                                    ? const Color(0XFF5ADFB2)
                                    : const Color(0XFF8D8D8D),
                                fontSize: 11,
                                decoration: TextDecoration.none,
                                fontFamily: "OpenSans",
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          urutkanpress = 2;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: urutkanpress == 2
                                        ? Colors.transparent
                                        : const Color(0XFF8D8D8D)),
                                borderRadius: BorderRadius.circular(20),
                                color: urutkanpress == 2
                                    ? const Color(0XFF5ADFB2)
                                    : Colors.white),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("Terendah",
                              style: TextStyle(
                                color: urutkanpress == 2
                                    ? const Color(0XFF5ADFB2)
                                    : const Color(0XFF8D8D8D),
                                fontSize: 11,
                                decoration: TextDecoration.none,
                                fontFamily: "OpenSans",
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0XFF5ADFB2))),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Reset",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFF5ADFB2),
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                            )),
                      )),
                  Container(
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0XFF5ADFB2),
                          border: Border.all(color: const Color(0XFF5ADFB2))),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Filter",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w600,
                              fontFamily: "OpenSans",
                            )),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget jenisreksadana(String image, String judul, double year, double expense,
    double aum, int press) {
  return Column(
    children: [
      Container(
        height: 143,
        decoration: BoxDecoration(
            border: Border.all(
                color: (reksapress == press)
                    ? const Color(0XFF5ADFB2)
                    : const Color(0XFFB1B1B1)),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(children: [
                SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset(image),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      judul,
                      style: const TextStyle(
                          color: Color(
                            0XFF5ADFB2,
                          ),
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "Lihat Detail",
                      style: TextStyle(
                          color: Color(
                            0XFF5D5D5D,
                          ),
                          fontSize: 12,
                          fontFamily: "OpenSans"),
                    ),
                  ],
                )
              ]),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "1 year Return",
                        style: TextStyle(
                            color: Color(
                              0XFF8D8D8D,
                            ),
                            fontSize: 14, fontFamily: "OpenSans"),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "$year%",
                        style: TextStyle(
                            color:
                                year > 0 ? const Color(0XFF5ADFB2) : Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 130,
                    decoration: const BoxDecoration(
                        border: Border.symmetric(
                            vertical: BorderSide(color: Colors.grey))),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Expense Return",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(
                                    0XFF8D8D8D,
                                  ),
                                  fontSize: 14, fontFamily: "OpenSans"),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "$expense%",
                              style: const TextStyle(
                                  color: Color(
                                    0XFF3D3D3D,
                                  ),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14, fontFamily: "OpenSans"),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Total AUM",
                            style: TextStyle(
                                color: Color(
                                  0XFF8D8D8D,
                                ),
                                fontSize: 14),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "${aum}T",
                            style: const TextStyle(
                                color: Color(
                                  0XFF3D3D3D,
                                ),
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}
