import 'package:flutter/material.dart';


class Topupalert extends StatefulWidget {
  const Topupalert({super.key});

  @override
  State<Topupalert> createState() => _TopupalertState();
}

int buttonover1 = 0;
int buttonover2 = 0;

class _TopupalertState extends State<Topupalert> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(
              children: [
                Container(
                  // color: Colors.red,
                  child: Row(children: [
                    Container(
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            child: InkWell(
                              onTap: (() {
                                Navigator.pop(context);
                              }),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0XFFF5F5F5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    size: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 39,
                          ),
                          Text(
                            "Ganti Bank Kamu",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Material(
                            child: InkWell(
                              onTap: (() {
                                Navigator.pop(context);
                              }),
                              child: Container(
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Material(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            buttonover1 = 1;
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(children: [
                                  Image.asset(
                                    "./images/BBCA.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Michael Kristianto",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none,
                                            color: buttonover1 == 1
                                                ? Color(0XFF5ADFB2)
                                                : Colors.black),
                                      ),
                                      Text(
                                        "0107 6969 2018",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none,
                                            color: Colors.black),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                              buttonover1 == 1
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Color(0XFF5ADFB2),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      color: Colors.white,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(children: [
                                  Image.asset(
                                    "./images/BBCA.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                  SizedBox(
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
                                            decoration: TextDecoration.none,
                                            color: buttonover1 == 0
                                                ? Color(0XFF5ADFB2)
                                                : Colors.black),
                                      ),
                                      Text(
                                        "0107 6969 2018",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none,
                                            color: Colors.black),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                              buttonover1 == 0
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Color(0XFF5ADFB2),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      color: Colors.white,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0XFF5ADFB2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "Ganti Sekarang",
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget buttonyes(click) {
  switch (click) {
    case 0:
      return Container(
        color: Colors.white,
      );
    case 1:
      return Container(
        decoration: BoxDecoration(
            color: Color(0XFF5ADFB2), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Icon(
            Icons.check,
            size: 14,
            color: Colors.white,
          ),
        ),
      );
    default:
      return Text("EROR");
  }
}
