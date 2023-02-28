import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/pages/portfolio/Jualalert.dart';
import 'package:uangin/pages/portfolio/Topup.dart';


double lotoverlay = 0;

class Kontenportofolio extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const Kontenportofolio(
      {super.key,
      this.modalinvest,
      this.hargabeliskrg,
      this.lot,
      this.press,
      this.image,
      this.namareksa, required this.user});

  final double? lot;
  final double? hargabeliskrg;
  final double? modalinvest;
  final int? press;
  final String? image;
  final String? namareksa;

  @override
  State<Kontenportofolio> createState() => _KontenportofolioState(
      modalinvest, hargabeliskrg, lot, press, image, namareksa);
}

int press = 0;
int reksapress = 0;
int filterpress = 0;
int click = 0;
int urutkanpress = 0;
int overlaybtt = 0;

class _KontenportofolioState extends State<Kontenportofolio> {
  final double? modalinvest;
  final double? hargabeli;
  final double? lot;
  int? press;
  final String namareksa;
  final String image;

  _KontenportofolioState(double? modalinvest, double? hargabeli, double? lot,
      int? press, String? image, String? namareksa)
      : modalinvest = modalinvest ?? 0,
        hargabeli = hargabeli ?? 0,
        lot = lot ?? 0,
        press = press ?? 0,
        image = image ?? "",
        namareksa = namareksa ?? "";

  double nilaisekarang() {
    return lot! * hargabeli!;
  }

  double keuntungan() {
    return nilaisekarang() - (modalinvest! * lot!);
  }

  int getstate() {
    return press = 1;
  }

  @override
  Widget build(BuildContext context) {
    BottomDialog bd = BottomDialog();

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(image),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namareksa,
                          style: TextStyle(
                            color: Color(0XFF5ADFB2),
                            fontSize: 16,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Lihat detail",
                          style: TextStyle(
                            color: Color(0XFF8D8D8D),
                            fontSize: 12,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    // color: Colors.yellow,
                    width: double.infinity,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nilai Sekarang",
                              style: TextStyle(
                                color: Color(0XFF8D8D8D),
                                fontSize: 14,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            Text(
                              "Rp " + nilaisekarang().toString(),
                              style: TextStyle(
                                  color: Color(0xFF3D3D3D),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "OpenSans",),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Modal Investasi",
                              style: TextStyle(
                                color: Color(0XFF8D8D8D),
                                fontSize: 14,
                                fontFamily: "OpenSans",
                                
                              ),
                            ),
                            Text("Rp " + modalinvest.toString())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Keuntungan",
                              style: TextStyle(
                                color: Color(0XFF8D8D8D),
                                fontSize: 14,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            Text(
                              "Rp " + keuntungan().toString(),
                              style: TextStyle(
                                color: keuntungan() > 0
                                    ? Color(0XFF5ADFB2)
                                    : Colors.red,
                                fontSize: 14,
                                fontFamily: "OpenSans",
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Harga Beli",
                              style: TextStyle(
                                color: Color(0XFF8D8D8D),
                                fontSize: 14,
                              ),
                            ),
                            Text("Rp " + hargabeli.toString())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Jumlah Unit",
                              style: TextStyle(
                                color: Color(0XFF8D8D8D),
                                fontSize: 14,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            Text(lot.toString())
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: (() {
                      bd.showBottomDialog(context, image, namareksa, widget.user);
                      setState(() {
                        overlaybtt = 1;
                        lotoverlay = lot!;
                      });
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red.shade300),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          )),
                      width: double.infinity,
                      child: Text(
                        "Jual",
                        style: TextStyle(color: Colors.red,
                        fontFamily: "OpenSans",),
                        textAlign: TextAlign.center,
                        
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: (() {
                      bd.showBottomDialog(context, image, namareksa, widget.user);
                      setState(() {
                        overlaybtt = 0;
                        lotoverlay = lot!;
                      });
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFF5ADFB2),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          )),
                      width: double.infinity,
                      child: Text(
                        "Top Up",
                        style: TextStyle(color: Colors.white, fontFamily: "OpenSans",),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomDialog extends StatefulWidget {
  void showBottomDialog(BuildContext context, String image, String nama, AsyncSnapshot<User?> user) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Dialogcontent(
            passingimage: image,
            passingnama: nama,
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

class Dialogcontent extends StatefulWidget {
  const Dialogcontent({super.key, this.passingimage, this.passingnama, required this.user});

  final String? passingimage;
  final String? passingnama;
  final AsyncSnapshot<User?> user;

  @override
  State<Dialogcontent> createState() =>
      _DialogcontentState(passingimage, passingnama, user);
}

class _DialogcontentState extends State<Dialogcontent> {
  final String? passingimage;
  final String? passingnama;
  final AsyncSnapshot<User?> user;

  _DialogcontentState(this.passingimage, this.passingnama, this.user);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Container(
            height: overlaybtt == 1 ? 550 : 320,
            width: double.maxFinite,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: switchkonten(overlaybtt)));
  }

  Widget switchkonten(press) {
    if (press == 1) {
      return Jualalert(
        nama: passingnama,
        image: passingimage,
        user: widget.user,
      );
    } else if (press == 0) {
      return Topupalert();
    } else {
      return Text("eror");
    }
  }
}
