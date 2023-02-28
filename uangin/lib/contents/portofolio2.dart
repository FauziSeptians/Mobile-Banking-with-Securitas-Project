import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PerformaPortfolio extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const PerformaPortfolio({super.key, required this.user});

  @override
  State<PerformaPortfolio> createState() => _PerformaPortfolioState();
}
class _PerformaPortfolioState extends State<PerformaPortfolio> {

  double modal = 100000000;
  double keuntungan = -9000000;
  double pembelian = 150000000;
  double penjualan = 120131041;
  int pressed = 0;
  int idx = 5;
  double temp = 20000;
  List<FlSpot> getAccData() {
    List<FlSpot> accList = [];
    for (int i = 5; i <= idx; i++) {
      temp = temp + (Random().nextInt(1000000)).toDouble()+500000;
      if(temp > 100000000){
        temp -= Random().nextInt(50000000).toDouble()+10000000;
      }      
      accList.add(FlSpot(i.toDouble(), temp)); 
    }
    return accList;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.70,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          color: Color.fromARGB(0, 255, 255, 255),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 18,
                            left: 12,
                            top: 24,
                            bottom: 12,
                          ),
                          child: LineChart(mainData(idx),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  // color: Colors.amberAccent,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 40,
                        // color: Colors.red,
                        child: TextButton(
                          style: TextButton.styleFrom(backgroundColor: pressed == 1 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              setState(() {
                                pressed = 1;
                                idx = 15;
                              });
                            },
                            child: Text(
                              '1M',
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 12,
                                color: pressed == 1 ? Colors.cyan : Colors.grey,
                              ),
                            ),
                          ),
                      ),
                      Container(
                        width: 40,
                        // color: Colors.red,
                        child: TextButton(
                          style: TextButton.styleFrom(backgroundColor: pressed == 2 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              setState(() {
                                pressed = 2;
                                idx = 35;
                              });
                            },
                            child: Text(
                              '3M',
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 12,
                                color: pressed == 2 ? Colors.cyan : Colors.grey,
                              ),
                            ),
                          ),
                      ),
                      Container(
                        width: 40,
                        // color: Colors.red,
                        child: TextButton(
                          style: TextButton.styleFrom(backgroundColor: pressed == 3 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              setState(() {
                                pressed = 3;
                                idx = 45;
                              });
                            },
                            child: Text(
                              'YTD',
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 12,
                                color: pressed == 3 ? Colors.cyan : Colors.grey,
                              ),
                            ),
                          ),
                      ),
                      Container(
                        width: 40,
                        // color: Colors.red,
                        child: TextButton(
                          style: TextButton.styleFrom(backgroundColor: pressed == 4 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              setState(() {
                                pressed = 4;
                                idx = 55;
                              });
                            },
                            child: Text(
                              'All',
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 12,
                                color: pressed == 4 ? Colors.cyan : Colors.grey,
                              ),
                            ),
                          ),
                      ),
                     
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                    width: 115,
                    height: 20,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 220),
                    child: const Text("Detail Portofolio", style: TextStyle(fontFamily: "OpenSans", fontSize: 14, color: Color(0xff5D5D5D), fontWeight: FontWeight.w600),)
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  height: 130.5,
                  child: Column(
                    children: [       
                      Container(
                        width: double.infinity,
                        height: 65,
                        // color: Colors.amberAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF5F5F5),
                                border: Border(
                                  right: BorderSide(width: 1, color: Colors.white),
                                  bottom: BorderSide(width: 1, color: Colors.white),
                                )
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              width: 150,
                              height: 65,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Center(
                                    child: Text("Modal Investor", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                                  ),
                                  Center(
                                    child: Text("Rp $modal", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14),),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF5F5F5),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              width: 150,
                              height: 65,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Center(
                                    child: Text("Keuntungan Terealisasi", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                                  ),
                                  Center(
                                    child: Text((keuntungan < 0 ? "-" : "+") + "Rp " + keuntungan.abs().toString(), style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14, color: keuntungan < 0 ? Color(0xffE74E4E) : Color(0xff5ADFB2)),),
                                  )
                                ],
                              ),
                            ),
                          ]
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 65,
                        // color: Colors.amberAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF5F5F5),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              width: 150,
                              height: 65,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Center(
                                    child: Text("Total Pembelian", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                                  ),
                                  Center(
                                    child: Text("Rp $pembelian", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14),),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF5F5F5),
                                border: Border(
                                  left: BorderSide(width: 1, color: Colors.white),
                                  top: BorderSide(width: 1, color: Colors.white),
                                )
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              width: 150,
                              height: 65,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Center(
                                    child: Text("Total Penjualan", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                                  ),
                                  Center(
                                    child: Text("Rp $penjualan", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14),),
                                  )
                                ],
                              ),
                            ),
                          ]
                        ),
                      ),
                    ]
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: Color(0xff9E9E9E),

    );
    Widget text;
    switch (value.toInt()) {
      case 10:
        text = const Text('Sep 22', style: style);
        break;
      case 20:
        idx = 10;
        text = const Text('Okt 22', style: style);
        break;
      case 30:
        text = const Text('Nov 22', style: style);
        break;
      case 40:
        text = const Text('Des 22', style: style);
        break;
      case 50:
        text = const Text('Jan 23', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData(int idx) {
    
    List<Color> gradientColor = [
      const Color(0xff5ADFB2),
      const Color.fromARGB(0, 255, 255, 255),
    ];

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color.fromARGB(255, 22, 21, 21),
            strokeWidth: .7,
            dashArray: [2, 2],
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color.fromARGB(0, 55, 67, 77),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false,),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color.fromARGB(0, 255, 255, 255)),
      ),
      minX: 5,
      maxX: idx.toDouble(),
      minY: 0,
      maxY: 100000000,
      lineBarsData: [
        LineChartBarData(
          spots: getAccData(),
          // isCurved: true,
          color: const Color(0xff5ADFB2),
          // gradient: LinearGradient(
          //   colors: gradientColors,
          // ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            // color: Color(0xff5ADFB2),
            gradient: LinearGradient(
              colors: gradientColor
                  .map((color) => color.withOpacity(1))
                  .toList(),
              stops: [0.0, 1],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter
            ),
          ),
        ),
      ],
    );
  }

}





    