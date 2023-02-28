import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:projecttugas/Mainmenu/widgets/Alokasidanawidget.dart';
import 'package:uangin/pages/portfolio/alokasidana.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../classes/color_scheme.dart';

class InvestasiPortofolio extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const InvestasiPortofolio({super.key, required this.user});

  @override
  State<InvestasiPortofolio> createState() => _InvestasiPortofolioState();
}

class Datainvest {
  final String nama;
  final int uanginvest;
  final int keuntungan;
  final String dataLabel;
  final Color color;
  final int jlhProduk;
  Datainvest(this.nama, this.uanginvest, this.keuntungan, this.color, this.dataLabel, this.jlhProduk);
}



class _InvestasiPortofolioState extends State<InvestasiPortofolio> {
  bool isLoading = true;
  final List<Datainvest> datachart = [
   
  ];
  List<Color> listColor = [
    Color.fromARGB(255, 234, 191, 73),
    Color(0XFF8962DB),
    Color(0XFF5ADFB2),
    

  ];
  // int totalinvest = 1000000;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    
    fetchData();

    super.initState();
  }

  void fetchData() async {
    await firestore.collection('portofolio').doc(widget.user.data!.email).get().then((value) {
      log(value.get('investasi')[0].toString());
      for (var i = 0; i < value.get('investasi').length; i++) {
        datachart.add(
          Datainvest(
            value.get('investasi')[i]["namaInvestasi"], 
            value.get('investasi')[i]['totalInvestasi'], 
            value.get('investasi')[i]['kerugian'], 
            listColor[i], 
            value.get('investasi')[i]["namaInvestasi"],
            value.get('investasi')[i]["jlhProduk"])
        );

      }
      // setState(() {
      //   datachart[0].uanginvest = value.data()!['reksadana_pasar_uang'];
      //   datachart[1].uanginvest = value.data()!['reksadana_saham'];
      //   datachart[2].uanginvest = value.data()!['saham'];
      // });
      setState(() {
        isLoading = false;
      });
    });
  }

  final TooltipBehavior _toolTipBehavior = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    return 
    !isLoading ?
    Column(
      children: [
        SfCircularChart(
          // legend: Legend(isVisible: true),
          tooltipBehavior: _toolTipBehavior,
          series: <CircularSeries>[
            // Renders doughnut chart
            DoughnutSeries<Datainvest, String>(
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true, labelIntersectAction: LabelIntersectAction.shift ,labelPosition: ChartDataLabelPosition.outside, textStyle: TextStyle(fontSize: 10)),
                radius: '70%',
                innerRadius: '70%',
                dataSource: datachart,
                pointColorMapper: (Datainvest data, _) => data.color,
                xValueMapper: (Datainvest data, _) =>
                    data.nama.toString(),
                yValueMapper: (Datainvest data, _) => data.uanginvest,
                enableTooltip: true,
                dataLabelMapper: (Datainvest data, _) =>
                    data.dataLabel.toString(),

                ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),

        // Container(
        //   height: 200,
        //   child: 
        // ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: datachart.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            
            return Alokasidanawidget(
              nama: datachart[index].nama,
              uanginvest: datachart[index].uanginvest,
              color: datachart[index].color,
              produk: datachart[index].jlhProduk,
              keuntungan: datachart[index].keuntungan,
              totalinvest: datachart[0].uanginvest + datachart[1].uanginvest + datachart[2].uanginvest,
              user: widget.user,
            );
          },
        ),
        const SizedBox(
          height: 20,
        )
      ],
    )
    :
    SizedBox(
      height: 400,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/UanginLogo1.png', height: 100,),
          
          const SizedBox(height: 20,),
          Container(
            height: 15,
            width: 15,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(UsedColor.primaryGreen),
              strokeWidth: 2,
            ),
          )
        ],
      )
    );
    
  }
}
