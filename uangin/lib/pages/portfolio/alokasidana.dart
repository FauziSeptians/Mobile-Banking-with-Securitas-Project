import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/portfolio/invest.dart';
import 'package:uangin/pages/portfolio/portopage.dart';

// import 'package:projecttugas/Mainmenu/Portofoliosaham.dart';

class Alokasidanawidget extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  final String? nama;
  final int? uanginvest;
  final int? keuntungan;
  final Color? color;
  final int? produk;
  final int? totalinvest;
  const Alokasidanawidget(
      {super.key,
      this.nama,
      this.uanginvest,
      this.totalinvest,
      this.keuntungan,
      this.color,
      this.produk, required this.user});

  @override
  State<Alokasidanawidget> createState() => _AlokasidanawidgetState(
      nama, uanginvest, totalinvest, keuntungan, color, produk);
}

double PerhitunganPersen(int invest, int totalinvest) {
  return ((invest / totalinvest) * 100);
}

class _AlokasidanawidgetState extends State<Alokasidanawidget> {
  String? nama;
  int? uanginvest;
  int? keuntungan;
  Color? color;
  int? totalinvest;
  int? produk;

  MoneyFormatter? jlhInvestasi;
  MoneyFormatter? jlhKeuntungan;

  _AlokasidanawidgetState(this.nama, this.uanginvest, this.totalinvest,
      this.keuntungan, this.color, this.produk);

  @override
  Widget build(BuildContext context) {
    jlhInvestasi = MoneyFormatter(
        amount: uanginvest!.toDouble(),
        settings: MoneyFormatterSettings(
            symbol: 'Rp',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 0,
            compactFormatType: CompactFormatType.short));
    jlhKeuntungan = MoneyFormatter(
        amount: keuntungan!.abs().toDouble(),
        settings: MoneyFormatterSettings(
            symbol: 'Rp',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 0,
            compactFormatType: CompactFormatType.short));
    return Material(
      // color: Colors.white,
      child: InkWell(
        onTap: (() {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => Portofoliosaham(
          //               produk: produk,
          //               invest: uanginvest,
          //               keuntungan: keuntungan,
          //             )));
          Navigator.push(context, MaterialPageRoute(builder: (context) => PortoPage(user: widget.user,)));
        }),
        child: Container(
          // margin: const EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(top: 10,bottom: 10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                        backgroundColor: color,
                        child: Text(
                          "${PerhitunganPersen(uanginvest!, totalinvest!).round()
                                  .toInt()}%",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15, fontFamily: 'OpenSans'),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 190,
                        
                        // color: Colors.red,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          
                          nama.toString(),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'OpenSans',
                            overflow: TextOverflow.fade),
                        ),
                      ),
                      
                      Text(
                        "$produk Produk",
                        style: const TextStyle(
                            color: Color(0XFF8D8D8D), fontSize: 13, fontFamily: 'OpenSans'),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  jlhInvestasi!.output.symbolOnLeft.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'OpenSans'),
                ),
                keuntungan! < 0
                    ? Text(
                        "- " + jlhKeuntungan!.output.symbolOnLeft.toString(),
                        style: const TextStyle(color: Colors.red, fontFamily: 'OpenSans', fontSize: 12),
                      )
                    : Text(
                        "+ " + jlhKeuntungan!.output.symbolOnLeft.toString(),
                        style: TextStyle(color: UsedColor.primaryGreen, fontFamily: 'OpenSans', fontSize: 12),
                      )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
