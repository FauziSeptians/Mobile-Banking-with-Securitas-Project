import 'package:flutter/cupertino.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:uangin/pages/portfolio/kategori.dart';

class Lainnyapage extends StatefulWidget {
  const Lainnyapage({super.key});

  @override
  State<Lainnyapage> createState() => _LainnyapageState();
}

class Datakategori {
  final String nama;
  final int nabung;
  final int goals;
  final Color color;

  double persen() {
    return (nabung / goals) * 100;
  }

  Datakategori(this.nama, this.nabung, this.goals, this.color);
}

final List<Datakategori> datachart = [
  Datakategori(
    'Liburan',
    500000,
    2000000,
    Color(0XFF6D5ADF),
  ),
  Datakategori(
    'Edukasi',
    300000,
    1500000,
    Color(0XFF5AAFDF),
  ),
  Datakategori(
    'Makanan',
    300000,
    1000000,
    Color(0XFFE86868),
  ),
];

class _LainnyapageState extends State<Lainnyapage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            // color: Colors.red,
            child: SfCircularChart(
              // legend: Legend(isVisible: true),
              series: <CircularSeries>[
                // Renders doughnut chart
                DoughnutSeries<Datakategori, String>(
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true, overflowMode: OverflowMode.shift),
                    radius: '70%',
                    innerRadius: '70%',
                    dataSource: datachart,
                    pointColorMapper: (Datakategori data, _) => data.color,
                    xValueMapper: (Datakategori data, _) =>
                        data.persen().toString(),
                    yValueMapper: (Datakategori data, _) => data.persen()),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Kategoriwidget(
            nama: datachart[0].nama,
            persentase: datachart[0].persen(),
            invest: datachart[0].nabung,
            goals: datachart[0].goals,
            color: datachart[0].color,
          ),
          SizedBox(
            height: 10,
          ),
          Kategoriwidget(
            nama: datachart[1].nama,
            persentase: datachart[1].persen(),
            invest: datachart[1].nabung,
            goals: datachart[1].goals,
            color: datachart[1].color,
          ),
          SizedBox(
            height: 10,
          ),
          Kategoriwidget(
            nama: datachart[2].nama,
            persentase: datachart[2].persen(),
            invest: datachart[2].nabung,
            goals: datachart[2].goals,
            color: datachart[2].color,
          )
        ],
      ),
    );
  }
}
