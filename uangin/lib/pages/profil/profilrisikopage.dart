import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class RincianProfil extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const RincianProfil({super.key, required this.user});

  @override
  State<RincianProfil> createState() => _RincianProfilState();
}

class Alokasidana {
  String getnama() {
    return nama;
  }

  double getpercentage() {
    return percentage;
  }

  Color getcolor() {
    return color;
  }

  final String nama;
  final double percentage;
  Color color;
  Alokasidana(this.nama, this.percentage, this.color);
}

class _RincianProfilState extends State<RincianProfil> {
  final List<Alokasidana> datachart = [
    Alokasidana('Reksadana Pasar Uang', 42, const Color(0XFFFFEEC0)),
    Alokasidana('Reksadana Saham', 28, const Color(0XFF8962DB)),
    Alokasidana('Saham', 30, const Color(0XFF5ADFB2)),
  ];

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? _shortName;

  @override
  void initState() {
    fetchData();
    
    super.initState();
  }

  void fetchData () async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    await users.doc(widget.user.data!.email).get().then((value) {
      firstName = value['firstName'];
      lastName = value['lastName'];
      phoneNumber = value['phoneNumber'];
      _shortName = firstName!.substring(0, 1) + lastName!.substring(0, 1);
    });

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return firstName == null ? const Center(child: CircularProgressIndicator(),) :
     Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
        children: [
          Row(
            children: [
              Container(
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
              const SizedBox(
                width: 80,
              ),
              const Text(
                "Profil Risiko",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: const Color(0XFF5ADFB2),
                  child: Text(
                    '${firstName!.substring(0,1)}${lastName!.substring(0,1)}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSans"
                        ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text("$firstName $lastName",
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "OpenSans")),
              const SizedBox(
                height: 5,
              ),
              const Text("Konservatif",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF8D8D8D))),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Tipe investor yang memiliki pemahaman dan penguasaan investasi yang terbatas dan tingkat toleransi investasinya cukup rendah. Kamu mengharapkan timbal balik yang positif dalam jangka panjang, di atas 10 tahun.",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "OpenSans"
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Container(
                    // color: Colors.red,
                    width: double.infinity,
                    child: const Text(
                      "Alokasi Dana",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                Container(
                  // color: Colors.blue,
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      // Renders doughnut chart
                      DoughnutSeries<Alokasidana, String>(
                          radius: '70%',
                          innerRadius: '70%',
                          dataSource: datachart,
                          pointColorMapper: (Alokasidana data, _) =>
                              data.color,
                          xValueMapper: (Alokasidana data, _) => data.nama,
                          yValueMapper: (Alokasidana data, _) =>
                              data.percentage,
                              ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(children: [
                  alokasi('Reksadana Pasar Uang', 42, const Color(0XFFFFEEC0)),
                  const SizedBox(
                    height: 10,
                  ),
                  alokasi('Reksadana Saham', 28, const Color(0XFF8962DB)),
                  const SizedBox(
                    height: 10,
                  ),
                  alokasi('Saham', 30, const Color(0XFF5ADFB2)),
                  const SizedBox(
                    height: 10,
                  ),
                ])
              ],
            ),
          )
        ],
          ),
        ),
      ),
    );
  }
}

Widget alokasi(
  String nama,
  int percentage,
  Color color,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: CircleAvatar(
                backgroundColor: color,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(nama)
          ],
        ),
      ),
      Text(percentage.toString() + "%"),
    ],
  );
}
