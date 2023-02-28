import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Kategoriwidget extends StatefulWidget {
  const Kategoriwidget(
      {super.key,
      this.nama,
      this.invest,
      this.goals,
      this.persentase,
      this.color});
  final double? persentase;
  final String? nama;
  final int? invest;
  final int? goals;
  final Color? color;

  @override
  State<Kategoriwidget> createState() =>
      _KategoriwidgetState(nama, invest, goals, persentase, color);
}

class _KategoriwidgetState extends State<Kategoriwidget> {
  final double? persentase;
  final String? nama;
  final int? invest;
  final int? goals;
  final Color? color;
  _KategoriwidgetState(
      this.nama, this.invest, this.goals, this.persentase, this.color);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        height: 90,
        child: Container(
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                // color: Colors.red,
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundColor: Color(0XFF492FE8),
                  child: Text(
                    persentase!.toInt().toString() + "%",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nama!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Terpakai Rp " + invest.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text("Rp " + goals.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LinearPercentIndicator(
                          animation: true,
                          barRadius: Radius.circular(10),
                          lineHeight: 15.0,
                          percent: (persentase! / 100.0),
                          backgroundColor: Colors.white,
                          progressColor: Color(0XFF5ADFB2),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
