import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:uangin/pages/portfolio/penjualanberhasilpage.dart';
import 'package:uangin/pages/portfolio/kontenportofolio.dart';

class Jualalert extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const Jualalert({super.key, this.image, this.nama, required this.user});
  final String? image;
  final String? nama;

  @override
  State<Jualalert> createState() => _JualalertState(image, nama);
}

class Rekeningpenerima {
  final int key;
  Rekeningpenerima(this.key);

  String getRekening() {
    if (key == 0) {
      return "assets/Icon/Emiten/uangin.png";
    } else if (key == 1) {
      return "assets/Icon/Emiten/uangin.png";
    } else {
      return "";
    }
  }

  String getnorek() {
    if (key == 0) {
      return "0107 6969 2020";
    } else if (key == 1) {
      return "0107 6969 2018";
    } else {
      return "";
    }
  }
}

double passingnewunit = 0;
int confirmation = 0;
int validation = 0;
double _currentSliderValue = 0;
int swap = 0;

class _JualalertState extends State<Jualalert> {
  BottomDialog1 bd1 = new BottomDialog1();
  final String? image;
  final String? nama;

  _JualalertState(this.image, this.nama);
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
                          Spacer(),
                          Text(
                            "Produk Yang dijual",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontFamily: "OpenSans"),
                          ),
                          SizedBox(
                            width: 105,
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
                                      color: Colors.black,
                                      fontFamily: "OpenSans"),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0XFFF0F0F0)))),
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(image!),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(nama!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      color: Color(0XFF5ADFB2),
                                      fontFamily: "OpenSans")),
                              SizedBox(
                                height: 2,
                              ),
                              Text("Reksa Dana Saham",
                                  style: TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black,
                                      fontFamily: "OpenSans",
                                      )),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0XFFF0F0F0)))),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Unit",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: "OpenSans"),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          "Rp " + lotoverlay.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: "OpenSans"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Rupiah",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: "OpenSans"),
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        Text(
                          "Rp " +
                              ((lotoverlay * _currentSliderValue) / 100)
                                  .toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: "OpenSans"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      color: Colors.white,
                      child: Slider(
                        activeColor: Color(0XFF5ADFB2),
                        inactiveColor: Colors.white,
                        value: _currentSliderValue,
                        max: 100,
                        divisions: 100,
                        label: _currentSliderValue.round().toString() + "%",
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0XFFD9D9D9)))),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 32, right: 32, bottom: 20),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sumber Rekening",
                              style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black,
                                  fontFamily: "OpenSans")),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: 80,
                              height: 50,
                              // color: Colors.red,
                              child: swap == 0
                                  ? Image.asset(
                                      "assets/Icon/Emiten/BBCA_icon.png",
                                      fit: BoxFit.contain,
                                    )
                                  : Image.asset(
                                      "assets/Icon/Emiten/uangin.png",
                                      fit: BoxFit.cover,
                                    )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rekening Kamu",
                              style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black,
                                  fontFamily: "OpenSans")),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: 80,
                              height: 50,
                              // color: Colors.red,
                              child: swap == 1
                                  ? Image.asset(
                                      "assets/Icon/Emiten/BBCA_icon.png",
                                      fit: BoxFit.contain,
                                    )
                                  : Image.asset(
                                      "assets/Icon/Emiten/uangin.png",
                                      fit: BoxFit.cover,
                                    )),
                        ],
                      ),
                      Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (swap == 0) {
                                  swap = 1;
                                } else if (swap == 1) {
                                  swap = 0;
                                }

                                Rekeningpenerima(swap);
                              });
                            },
                            child: Icon(Icons.swap_horiz),
                          ))
                    ]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Biaya transfer sebesar Rp 3.000 hingga Rp 10.000 akan dikenakan jika rekening bank kamu berbeeda dengan rekening bank penampung dari reksa dana yang kamu jual.",
                  style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                      fontFamily: "OpenSans"),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            child: InkWell(
              onTap: () {
                if (_currentSliderValue != 0) {
                  passingnewunit = (lotoverlay * _currentSliderValue) / 100;
                  Navigator.pop(context);
                  bd1.showBottomDialog(context, image!, nama!, widget.user);
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: _currentSliderValue == 0
                      ? Colors.grey
                      : Color(0XFFE74E4E),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "Jual",
                    style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontFamily: "OpenSans"),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BottomDialog1 extends StatefulWidget {
  void showBottomDialog(
      BuildContext context, String new_image, String new_nama, AsyncSnapshot<User?> user) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Newdialogcontent(
            new_image: new_image,
            new_nama: new_nama,
            user: user
          ),
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

class Newdialogcontent extends StatefulWidget {
  const Newdialogcontent({super.key, this.new_image, this.new_nama, required this.user});

  final String? new_nama;
  final String? new_image;
  final AsyncSnapshot<User?> user;

  @override
  State<Newdialogcontent> createState() =>
      _NewdialogcontentState(new_nama, new_image,user);
}

class _NewdialogcontentState extends State<Newdialogcontent> {
  final String? new_nama;
  final String? new_image;
  final AsyncSnapshot<User?> user;
  Rekeningpenerima rp = Rekeningpenerima(swap);

  _NewdialogcontentState(this.new_nama, this.new_image, this.user);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Container(
            height: 420,
            width: double.maxFinite,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    // color: Colors.red,
                    child: Row(children: [
                      Container(
                        width: 360,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 75,
                            ),
                            Text(
                              "Dana Investasi yang kamu jual",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontFamily: "OpenSans"),
                            ),
                            SizedBox(
                              width: 52,
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
                                        color: Colors.black,
                                        fontFamily: "OpenSans"),
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
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0XFFF0F0F0)))),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
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
                                  child: Image.asset(new_image!),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(new_nama!,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              decoration: TextDecoration.none,
                                              color: Color(0XFF5ADFB2),
                                              fontFamily: "OpenSans")),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text("Reksa Dana Saham",
                                          style: TextStyle(
                                              fontSize: 12,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.black,
                                              fontFamily: "OpenSans"),),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Unit",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                          fontFamily: "OpenSans"),
                                    ),
                                    SizedBox(
                                      width: 200,
                                    ),
                                    Text(
                                      "Rp " + lotoverlay.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                          fontFamily: "OpenSans"),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Komisi Penjualan",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                          fontFamily: "OpenSans"),
                                    ),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Text(
                                      "Gratis",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                          fontFamily: "OpenSans"),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Perkiraan Dana yang di Jual",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                          fontFamily: "OpenSans"),
                                    ),
                                    SizedBox(
                                      width: 55,
                                    ),
                                    Text(
                                      "Rp " + passingnewunit.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: Colors.red,
                                          fontFamily: "OpenSans"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (confirmation == 0) {
                            confirmation = 1;
                          } else if (confirmation == 1) {
                            confirmation = 0;
                          }
                        });
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          
                          children: [
                            SizedBox(width: 15,),
                            Container(
                              decoration: BoxDecoration(
                                  color: confirmation == 1
                                      ? Color(0XFF5ADFB2)
                                      : Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Icon(
                                  Icons.check,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Container(
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Saya menyetujui penjualan reksa dana saham di halaman ini. Saya mengerti bahwa total dana yang di jual merupakan perkiraan. Dana yang didapat bisa berubah sesuai dengan harga penutupan reksa dana di hari penjualan.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      overflow: TextOverflow.clip,
                                      fontFamily: "OpenSans"),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Material(
                      child: InkWell(
                        onTap: (() {
                          passingnewunit =
                              ((lotoverlay * _currentSliderValue) / 100);
                          if (confirmation == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Penjualanberhasil(
                                          image: new_image,
                                          nama: new_nama,
                                          unit: lotoverlay,
                                          nilaijual: passingnewunit,
                                          bankpenerima: rp.getRekening(),
                                          rekeningpenerima: rp.getnorek(),
                                          user: widget.user,
                                        )));
                          }
                        }),
                        child: AnimatedContainer(
                          height: 50,
                          decoration: BoxDecoration(
                            color: confirmation == 1
                                ? Color(0XFFE74E4E)
                                : Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: Duration(milliseconds: 150),
                          child: Center(
                            child: Text(
                              "Jual",
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontFamily: "OpenSans"),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
