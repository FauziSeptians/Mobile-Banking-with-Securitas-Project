import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import "package:intl/intl.dart";
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/saham/sahampinpage.dart';

class ReksadanaDetail extends StatefulWidget {
  const ReksadanaDetail({super.key, required this.img, required this.name, required this.yearReturn, required this.expense, required this.aum, required this.user});
  final String name;
  final String img;
  final double yearReturn;
  final double expense;
  final double aum;
  final AsyncSnapshot<User?> user;
  

  @override
  State<ReksadanaDetail> createState() => _ReksadanaDetailState();
}

double ppy = 0;

class _ReksadanaDetailState extends State<ReksadanaDetail> {

  List<FlSpot> getAccData() {
    List<FlSpot> accList = [];
    for (int i = 0; i <= idx; i++) {
      accList.add(FlSpot(i.toDouble(), (Random().nextInt(300)).toDouble() + 1800)); 
    }
    return accList;
  }

  MoneyMaskedTextController nominal = MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', initialValue: 1000000, precision: 0);

  @override
  void initState() {
    ppy = widget.yearReturn;
    ppm = ppy/12;
    pphy = ppy/2;
    super.initState();
    // print(ppy * modal / 100);
    setState(() {
      
    });
  }
  int pressed = 0;
  int idx = 10;
  double modal = 1000000;
  double ppm = 0;
  double pphy = 0;
  int year = 0;
  bool month = true;
  double pby = 0.008;
  BottomDialogs bot = const BottomDialogs();

  List<Color> gradientColors = [
    const Color(0xffC2F3E2),
    const Color.fromARGB(0, 255, 255, 255),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
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
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        widget.name,
                        overflow: TextOverflow.fade,
                        
                        textWidthBasis: TextWidthBasis.parent,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15,
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
            const SizedBox(height: 20,),
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
              width: 100,
              // color: Colors.amberAccent,
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 40,
                    // color: Colors.red,
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: pressed == 0 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          setState(() {
                            pressed = 0;
                            idx = 10;
                          });
                        },
                        child: Text(
                          '1D',
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 12,
                            color: pressed == 0 ? const Color(0xff20E2A0) : Colors.grey,
                          ),
                        ),
                      ),
                  ),
                  Container(
                    width: 40,
                    // color: Colors.red,
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: pressed == 1 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          setState(() {
                            pressed = 1;
                            idx = 30;
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
                            idx = 45;
                          });
                        },
                        child: Text(
                          '6M',
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
                            idx = 60;
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
                            idx = 80;
                          });
                        },
                        child: Text(
                          '5M',
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 12,
                            color: pressed == 4 ? Colors.cyan : Colors.grey,
                          ),
                        ),
                      ),
                  ),
                  Container(
                    width: 40,
                    // color: Colors.red,
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: pressed == 5 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          setState(() {
                            pressed = 5;
                            idx = 101;
                          });
                        },
                        child: Text(
                          'All',
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 12,
                            color: pressed == 5 ? Colors.cyan : Colors.grey,
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              // color: Colors.redAccent,
              // padding: EdgeInsets.symmetric(horizontal: 20),
              width: 100,
              height: 180,
              child: Column(
                children: [
                  
                  Container(
                    width: double.infinity,
                    height: 50,
                    // color: Colors.amberAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), 
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          width: 107,
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Center(
                                child: Text("1 Tahun", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                              ),
                              Center(
                                child: Text("${widget.yearReturn}%", style: const TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), 
                            border: Border(
                              right: BorderSide(color: Colors.white),
                              left: BorderSide(color: Colors.white),
                            )
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          width: 106,
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Center(
                                child: Text("3 Tahun", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                              ),
                              const Center(
                                child: Text("-", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                            
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          width: 106,
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Center(
                                child: Text("5 Tahun", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                              ),
                              const Center(
                                child: Text("-", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14),),
                              )
                            ],
                          ),
                        ),
                      ]
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    // color: Colors.amberAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), 
                            border: Border(
                              right: BorderSide(color: Colors.white),
                              left: BorderSide(color: Color(0xffF5F5F5)),
                              top: BorderSide(width: 1, color: Colors.white),
                            )
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          width: 107,
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Center(
                                child: Text("1 Bulan", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                              ),Center(
                                child: Text("${(widget.yearReturn/12).toString().substring(0, 4)}%", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), 
                            border: Border(
                              right: BorderSide(color: Colors.white),
                              top: BorderSide(width: 1, color: Colors.white),                            
                            )
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          width: 106,
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Center(
                                child: Text("6 Bulan", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                              ),
                              Center(
                                child: Text("${(widget.yearReturn/2).toString().substring(0, 4)}%", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), 
                            border: Border(
                              right: BorderSide(width: 1, color: Color(0xffF5F5F5)),
                              top: BorderSide(width: 1, color: Colors.white),
                            )
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          width: 106,
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Center(
                                child: Text("Awal tahun", style: TextStyle(fontFamily: "OpenSans", fontSize: 10),),
                              ),
                              const Center(
                                child: Text("0.08%", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 14),),
                              )
                            ],
                          ),
                        ),
                      ]
                    ),
                  ),
                
                  Container(
                    width: double.infinity,
                    height: 35,
                    // color: Colors.amberAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), 
                            // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)), 
                            border: Border(
                              left: BorderSide(width: 1, color: Color(0xffF5F5F5)),
                              top: BorderSide(width: 1, color: Colors.white),
                            )
                          ),
                          width: 100,
                          height: 50,
                          child: const Center(
                                child: Text("Total AUM", style: TextStyle(fontFamily: "OpenSans", fontSize: 12),),
                              ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), 
                            // borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                            border: Border(
                              right: BorderSide(width: 1, color: Color(0xffF5F5F5)),
                              top: BorderSide(width: 1, color: Colors.white),
                            )
                          ),
                          padding: const EdgeInsets.only(right: 80),
                          width: 220,
                          height: 50,
                          child: Center(
                                child: Text("${widget.aum}T", style: TextStyle(fontFamily: "OpenSans", fontSize: 14, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 35,
                    // color: Colors.amberAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), 
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10)
                            ),
                            // border: Border(
                            //   left: BorderSide(width: 1, color: Colors.white),
                            // )
                          ),
                          width: 80,
                          height: 50,
                          child: const Center(
                                child: Text("Resiko", style: TextStyle(fontFamily: "OpenSans", fontSize: 12),),
                              ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), 
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10)
                            ),
                          ),
                          padding: const EdgeInsets.only(left: 20),
                          width: 240,
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Container(
                                  width: 125,
                                  child: const StepProgressIndicator(
                                    size: 2,
                                    totalSteps: 5,
                                    currentStep: 3,
                                    selectedColor: Color(0xff5ADFB2),
                                    unselectedColor: Color(0xffB1B1B1),
                                    fallbackLength: 20,
                              ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                    ),
                  ),
                
                ],
              ),
            ),
            Container(
              // color: Colors.amber,
              width: 100,
              height: 227,
              child: 
                Column(
                  children: [
                    Container(
                      width: 115,
                      height: 20,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 220),
                      child: const Text("Manager Investasi", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, color: Color(0xff8D8D8D), fontWeight: FontWeight.w600),)
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      height: 60,
                      width: 290,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xffD9D9D9)))
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(widget.img, width: 44, height: 44,),
                          Container(
                            padding: const EdgeInsets.only(left: 10),  
                            child: Text(widget.name, style: TextStyle(fontFamily: "OpenSans", fontSize: 11, fontWeight: FontWeight.bold),)
                          )
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.amber,
                      margin: const EdgeInsets.only(top: 6),
                      width: 312,
                      height: 20,
                      // margin: EdgeInsets.only(right: 195),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Bank Kustodian", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff8D8D8D),),),
                          const Text("PT Bank HSBC Indonesia", style: TextStyle(fontFamily: "OpenSans", fontSize: 12, fontWeight: FontWeight.w600),),
                        ],
                      )
                    ),
                    Container(
                      // color: Colors.amber,
                      width: 312,
                      height: 20,
                      // margin: EdgeInsets.only(right: 195),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Bank Penampung", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff8D8D8D),),),
                          const Text("BCA", style: TextStyle(fontFamily: "OpenSans", fontSize: 12, fontWeight: FontWeight.w600),),
                        ],
                      )
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      // color: Colors.amber,
                      width: 312,
                      height: 20,
                      // margin: EdgeInsets.only(right: 195),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Minimum Pembelian", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff8D8D8D),),),
                          const Text("Rp100.000", style: TextStyle(fontFamily: "OpenSans", fontSize: 12, fontWeight: FontWeight.w600),),
                        ],
                      )
                    ),
                    Container(
                      // color: Colors.amber,
                      width: 312,
                      height: 20,
                      // margin: EdgeInsets.only(right: 195),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Komisi Pembelian", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff8D8D8D),),),
                          const Text("-", style: TextStyle(fontFamily: "OpenSans", fontSize: 12, fontWeight: FontWeight.w600),),
                        ],
                      )
                    ),
                    Container(
                      // color: Colors.amber,
                      width: 312,
                      height: 20,
                      // margin: EdgeInsets.only(right: 195),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Biaya Penjualan", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff8D8D8D),),),
                          const Text("-", style: TextStyle(fontFamily: "OpenSans", fontSize: 12, fontWeight: FontWeight.w600),),
                        ],
                      )
                    ),
                    const SizedBox(height: 25,),
                    Container(
                      color: const Color(0xffD9D9D9),
                      width: 312,
                      height: 1,
                    )
                  ],
                ),
            ),
            const SizedBox(height: 30,),
            Container(
              // color: Colors.amber,
              width: 200,
              height: 234,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      // color: Colors.amberAccent,
                      width: 312,
                      height: 40,
                      // margin: EdgeInsets.only(right: 195),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Kalkulator Investasi", style: TextStyle(fontFamily: "OpenSans", fontSize: 13, fontWeight: FontWeight.bold,),),
                          Container(
                            // color: Colors.pink,
                            width: 312,
                            height: 15,
                            // margin: EdgeInsets.only(right: 195),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Jika kamu investasi sebesar", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xff5D5D5D)),),
                                // Text(NumberFormat.simpleCurrency(locale: 'ind', decimalDigits: 0).format(modal) , style: const TextStyle(fontFamily: "OpenSans", fontSize: 12, fontWeight: FontWeight.w600),),
                                Container(
                                  // color: Colors.red,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text('Rp', style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 11,
                                        color: Color(0xff5D5D5D),
                                        fontWeight: FontWeight.bold
                                      ),),
                                      const SizedBox(width: 10,),
                                      Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(top: 18),
                                        width: 60,
                                        
                                        
                                        child: TextField(
                                          // expands: true,

                                          controller: nominal,
                                          onChanged: (value) {
                                            
                                            value = value.replaceAll('.', '');
                                            value = value.replaceAll(',', '.');

                                            setState(() {
                                              modal = double.parse(value);

                                            });
                                            
                                          },
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                            fontFamily: "OpenSans",
                                            fontSize: 11,
                                            color: Color(0xff5D5D5D),
                                            fontWeight: FontWeight.bold
                                          ),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(top: 35),
                                            hintText: '0',
                                            hintStyle: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontSize: 11,
                                              color: Color(0xff9E9E9E),
                                              fontWeight: FontWeight.bold
                                            ),
                    
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ),
                        ],
                      )
                  ),        
                  // SizedBox(height: 5,),
                  Container(
                    // color: Colors.cyan,
                    width: 312,
                    height: 45,
                    // margin: EdgeInsets.only(right: 195),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // color: Colors.black,
                          width: 156,
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: month ? 2 : 0.5, color: month ? const Color(0xff5ADFB2) : const Color(0xff8B8B8B)))
                          ),
                          child: 
                          TextButton(
                            onPressed: () {
                              setState(() {
                                month = true;
                              });
                            },
                            child: Text(
                              'Setiap Bulan',
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 12,
                                color: month ? const Color(0xff5ADFB2) : const Color(0xff8B8B8B),
                              ),
                            )
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          width: 156,
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: !month ? 2 : 0.5, color: !month ? const Color(0xff5ADFB2) : const Color(0xff8B8B8B)))
                          ),
                          child: 
                          TextButton(
                            onPressed: () {
                              setState(() {
                                month = false;
                              });
                            },
                            child: Text(
                              'Nabung Sekali',
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 12,
                                color: !month ? const Color(0xff5ADFB2) : const Color(0xff8B8B8B),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  const SizedBox(height: 17,),
                  Container(
                    // color: Colors.amber,
                    width: 312,
                    height: 51,
                    child:                   
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Text("Sejak Berapa Tahun?", style: TextStyle(fontFamily: "OpenSans", color: Color(0xff5D5D5D), fontSize: 11),)
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                                alignment: Alignment.center,
                                width: 70,
                                height: 30,
                                child: 
                                  TextButton(
                                  style: TextButton.styleFrom(backgroundColor: year == 0 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                    onPressed: () {
                                      setState(() {
                                        year = 0;
                                      });
                                    },
                                    child: Text(
                                      '1 Tahun',
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 11,
                                        color: year == 0 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                                      ),
                                    ),
                                  ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 70,
                                height: 30,
                                child: 
                                  TextButton(
                                  style: TextButton.styleFrom(backgroundColor: year == 1 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                    onPressed: () {
                                      setState(() {
                                        year = 1;
                                      });
                                    },
                                    child: Text(
                                      '3 Tahun',
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 11,
                                        color: year == 1 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                                      ),
                                    ),
                                  ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 70,
                                height: 30,
                                child: 
                                  TextButton(
                                  style: TextButton.styleFrom(backgroundColor: year == 2 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                    onPressed: () {
                                      setState(() {
                                        year = 2;
                                      });
                                    },
                                    child: Text(
                                      '5 Tahun',
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 11,
                                        color: year == 2 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                                      ),
                                    ),
                                  ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 70,
                                height: 30,
                                child: 
                                  TextButton(
                                  style: TextButton.styleFrom(backgroundColor: year == 3 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                    onPressed: () {
                                      setState(() {
                                        year = 3;
                                      });
                                    },
                                    child: Text(
                                      '10 Tahun',
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 11,
                                        color: year == 3 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                                      ),
                                    ),
                                  ),
                              ),
                            ],)
                          
                          ],
                        ),
                      )
                  ),
                  const SizedBox(height: 20,),
                  Container(
                      // color: Colors.amberAccent,
                      width: 312,
                      height: 35,
                      // margin: EdgeInsets.only(right: 195),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Nilai yang Didapatkan Saat ini", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff5D5D5D)),),
                          Profit(year),
                        ],
                      )
                  ),  
                  const SizedBox(height: 25,),
                  Container(
                    color: const Color(0xffD9D9D9),
                    width: 312,
                    height: 1,
                  ),
      
      
                ],
              ),
            ),
            const SizedBox(height: 26,),
            Container(
              // color: Colors.amberAccent,
              height: 86,
              width: 312,
              child: Column(
                children: [
                  Container(
                      // color: Colors.amberAccent,
                      width: 312,
                      height: 84,
                      // margin: EdgeInsets.only(right: 195),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 25,
                            width: 100,
                            // color: Colors.blue,
                            margin: const EdgeInsets.only(right: 210),
                            child: const Text("Alokasi Aset", style: TextStyle(fontFamily: "OpenSans", fontSize: 13, fontWeight: FontWeight.bold,),)
                          ),
                          Container(
                            width: 290,
                            height: 14,
                            child: const Center(
                              child: StepProgressIndicator(
                                totalSteps: 100,
                                currentStep: 10,
                                size: 14,
                                padding: 0,
                                selectedColor: Color(0xffFFEEC0),
                                unselectedColor: Color(0xff5ADFB2),
                                roundedEdges: Radius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 13,
                                      width: 13,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFFEEC0),
                                        borderRadius: BorderRadius.circular(100)
                                      ),
                                    ),
                                    const SizedBox(width: 7,),
                                    const Text("Pasar Uang (10.28%)", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w500, fontSize: 12),)
                                  ],
                                ),
                                const SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Container(
                                      height: 13,
                                      width: 13,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff5ADFB2),
                                        borderRadius: BorderRadius.circular(100)
                                      ),
                                    ),
                                    const SizedBox(width: 7,),
                                    const Text("Saham (89.72%)", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w500, fontSize: 12),)
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 45,),
            Container(
              // color: Colors.amberAccent,
              width: 150,
              height: 180,
              child: Column(
                children: [
                  Container(
                    // color: Colors.pink,
                    width: 312,
                    height: 20,
                    // margin: EdgeInsets.only(right: 195),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Top Holdings", style: TextStyle(fontFamily: "OpenSans", fontSize: 13, fontWeight: FontWeight.bold,),),
                        const Text("31 Oktober 2022", style: TextStyle(fontFamily: "OpenSans", fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff9E9E9E)),),
                      ],
                    )
                  ),
                  const SizedBox(height: 11,),
                  Container(
                    margin: const EdgeInsets.only(right: 135),
                    height: 120,
                    width: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Adaro Energy Indonesia Tbk.", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, color: Color(0xff5D5D5D)),),
                        const Text("Bank Central Asia Tbk.", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, color: Color(0xff5D5D5D)),),
                        const Text("Bank Mandiri (Persero) Tbk.", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, color: Color(0xff5D5D5D)),),
                        const Text("Bank Pan Indonesia Tbk.", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, color: Color(0xff5D5D5D)),),
                        const Text("Bank Rakyat Indonesia (Persero)", style: TextStyle(fontFamily: "OpenSans", fontSize: 11, color: Color(0xff5D5D5D)),),
      
                      ],
                    ),
                  ),               
                ],
              ),
            ),
            // SizedBox(height: 40,),
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: const Color(0xff5ADFB2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    bot.showBottomDialog(context, widget.name, widget.img, widget.user);
                  },
                  child: const Text(
                    'Beli',
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ),
            const SizedBox(height: 35,),
          ],
        )),
      ),
    );
  }

  Widget Profit(int year){

    double temp = modal;
    if (!month) {
      switch (year) {
        case 0:
          temp = modal + (modal*ppy/100);
          break;
        case 1:
          temp = modal + modal*ppy*(3)/100;
          break;
        case 2:
          temp = modal + modal*ppy*(5)/100;
          break;
        case 3:
          temp = modal + modal*ppy*(10)/100;
          break;
        default:
      }
    } else{
      switch (year) {
        case 0:
          temp = modal*12 + (modal*ppy/100*1);
          break;
        case 1:
          temp = modal*12*3 + modal*ppy/100*(3);
          break;
        case 2:
          temp = modal*12*5 + modal*ppy/100*(5);
          break;
        case 3:
          temp = modal*12*10 + modal*ppy/100*(10);
          break;
        default:
      }
    }

    return Text(NumberFormat.simpleCurrency(locale: 'ind', decimalDigits: 0).format(temp), style: const TextStyle(color: Color(0xff1AE282)),);
  }

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 1800:
        text = '2200';
        break;
      case 2100:
        text = '2400';
        break;
      case 2400:
        text = '2600';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(int idx) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 300,
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
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: rightTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color.fromARGB(0, 255, 255, 255)),
      ),
      minX: 0,
      maxX: idx.toDouble(),
      minY: 1500,
      maxY: 2600,
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
              colors: gradientColors
                  .map((color) => color.withOpacity(.7))
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

class BottomDialogs extends StatefulWidget {
  const BottomDialogs({super.key});

  void showBottomDialog(BuildContext context, String nama, String gambar, AsyncSnapshot<User?> user) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Dialogcontent(nama: nama, gambar: gambar, user: user),
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
  const Dialogcontent({super.key, required this.nama, required this.gambar, required this.user});
  final AsyncSnapshot<User?> user;
  final String nama;
  final String gambar;

  @override
  State<Dialogcontent> createState() => _DialogcontentState();
}

class _DialogcontentState extends State<Dialogcontent> {
  int nom = 0;
  TextEditingController nameController = TextEditingController();
  String input_field = 'halo';
  @override
  BottomDialog1 bot2 = BottomDialog1();
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: 
      Container(
          // color: Colors.amberAccent,
          height: 230,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Container(
            // color: Colors.red,
            height: 240,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: 300,
                  // padding: const,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Mau Investasi Berapa?", style: TextStyle(fontFamily: "OpenSans", fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none)),
                      Material(child: InkWell(onTap: () {Navigator.pop(context);}, child: Container(width: 30, height: 30,child: const Icon(Icons.close, size: 15, color: Color(0xffB1B1B1),))))
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  margin: const EdgeInsets.all(20),
                  child: Material(
                    child: TextField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: UnderlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(
                            width: 1, color: Color(0xff9EBDB3)), 
                        ),
                        hintText: "Input Nominal",
                        hintStyle: TextStyle(fontFamily: "OpenSans", fontSize: 14)
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [ThousandsSeparatorInputFormatter()],
                      onChanged: (text) {
                        setState(() {
                          input_field = text;
                          nom = 0;
                          //you can access nameController in its scope to get
                          // the value of text entered as shown below
                          //input_field = nameController.text;
                        });
                      },
                    ),
                  )
                ),
                const SizedBox(height: 8,),
                Container(
                  // color: Colors.blue,
                  height: 30,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(
                      // color: Colors.amber,
                      alignment: Alignment.center,
                      width: 70,
                      height: 30,
                      child: 
                        TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: nom == 1 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Color(0xffD9D9D9)))
                        ),
                        onPressed: () {
                          setState(() {
                            nom = 1;
                            nameController.text = "100.000";
                          });
                        },
                          child: Text(
                            '100.000',
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 11,
                              color: nom == 1 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                            ),
                          ),
                        ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 30,
                      child: 
                        TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: nom == 2 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Color(0xffD9D9D9)))
                        ),
                          onPressed: () {
                            setState(() {
                              nom = 2;
                              nameController.text = "500.000";
                            });
                          },
                          child: Text(
                            '500.000',
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 11,
                              color: nom == 2 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                            ),
                          ),
                        ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 30,
                      child: 
                        TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: nom == 3 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Color(0xffD9D9D9)))
                        ),
                          onPressed: () {
                            setState(() {
                              nom = 3;
                              nameController.text = "1.000.000";
                            });
                          },
                          child: Text(
                            '1.000.000',
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 11,
                              color: nom == 3 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                            ),
                          ),
                        ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 30,
                      child: 
                        TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: nom == 4 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Color(0xffD9D9D9)))
                        ),
                          onPressed: () {
                            setState(() {
                              nom = 4;
                              nameController.text = "5.000.000";
                            });
                          },
                          child: Text(
                            '5.000.000',
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 11,
                              color: nom == 4 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                            ),
                          ),
                        ),
                    ),
                  ],),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 320,
                  height: 50,
                  // padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: const Color(0xff5ADFB2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        bot2.showBottomDialog1(context, int.parse(nameController.text.replaceAll('.', '')), widget.nama, widget.nama, widget.gambar, widget.user);
                      },
                      child: const Text(
                        'Beli Sekarang',
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                  ),
                ),  
              ],
            ),
          )
        ),
    
    
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = '.'; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

class BottomDialog1 extends StatefulWidget {
  const BottomDialog1({super.key});

  void showBottomDialog1(BuildContext context, int passinginput,
      String namaperusahaan, String namasaham, String image, AsyncSnapshot<User?> user) {
    print("galo");
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Dialogcontent1(
            uangtf: passinginput,
            perusahaan: namaperusahaan,
            saham: namasaham,
            images: image,
            user: user,
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

class Dialogcontent1 extends StatefulWidget {
  final int uangtf;
  final String perusahaan;
  final String saham;
  final String images;
  final AsyncSnapshot<User?> user;

  const Dialogcontent1(
      {super.key,
      required this.uangtf,
      required this.perusahaan,
      required this.saham,
      required this.images, required this.user});

  @override
  State<Dialogcontent1> createState() =>
      _Dialogcontent1State(uangtf, perusahaan, saham, images);
}

class _Dialogcontent1State extends State<Dialogcontent1> {
  final int uangtf;
  final String perusahaan;
  final String saham;
  final String image;

  _Dialogcontent1State(this.uangtf, this.perusahaan, this.saham, this.image);

  int nom = 0;
  int komisi = 0;
  int tap = 1;
  int press = 0;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Material(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(16),
              // height: 1000,
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
                              width: 40,
                            ),
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
                                        fontFamily: "OpenSans",
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
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Row(children: [
                      Image.asset(
                        image,
                        width: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        perusahaan,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: "OpenSans"),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              saham,
                              style: TextStyle(
                                  // fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: "OpenSans"),
                            ),
                            Text(
                              "Rp " + uangtf.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: "OpenSans"),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Komisi Pembelian",
                              style: TextStyle(
                                  fontSize: 14, fontFamily: "OpenSans"),
                            ),
                            komisi == 0
                                ? Text(
                                    "-",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        fontFamily: "OpenSans"),
                                  )
                                : Text(
                                    "Rp " + komisi.toString(),
                                    style: TextStyle(
                                        // fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        fontFamily: "OpenSans"),
                                  ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "OpenSans"),
                            ),
                            Text(
                              "Rp " + (uangtf + komisi).toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: "OpenSans"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFF5F5F5),
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/Icon/donate.png",
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Nabung Rutin Pembelian Ini"),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (tap == 1) {
                                  tap = 0;
                                } else if (tap == 0) {
                                  tap = 1;
                                }
                              });
                            },
                            child: Container(
                                width: 45,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: tap == 1
                                        ? Color(0XFFCBE4D1).withOpacity(0.7)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                      color: Color(0XFFCBE4D1),
                                    )),
                                child: Switching(tap)),
                          )
                        ]),
                  )
                ],
              )),
          Container(
            // color: Colors.red,
            height: 10,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (press == 0) {
                          press = 1;
                        } else if (press == 1) {
                          press = 0;
                        }
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      child: CircleAvatar(
                        backgroundColor:
                            press == 0 ? Colors.grey : Color(0XFF20E2A1),
                        radius: 9,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor:
                              press == 0 ? Colors.white : Color(0XFF20E2A1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 320,
                    // color: Colors.red,
                    child: Text(
                      textAlign: TextAlign.justify,
                      "Saya menyetujui pembelian reksa dana saham di halaman ini dan menyetujui seluruh isi Prospektus dan keterangan ringkas serta memahami risiko atas keputusan investasi yang saya buat. Baca Selengkapnya",
                      style: TextStyle(
                          overflow: TextOverflow.clip,
                          color: press == 0 ? Colors.grey : Colors.black,
                          fontFamily: "OpenSans"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pembayaran",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: "OpenSans"),
                ),
                Text(
                  "Rp " + (uangtf + komisi).toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "OpenSans"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SahamPinPage(user: widget.user)));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: press == 1 ? UsedColor.primaryGreen : UsedColor.primaryGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Beli Sekarang",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}

Widget Switching(int value) {
  if (value == 1) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      // color: Colors.black,
      width: 50,
      height: 20,
      child: CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  } else if (value == 0) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      // color: Colors.red,
      width: 45,
      height: 20,
      child: CircleAvatar(
        backgroundColor: Color(0XFF5ADFB2),
      ),
    );
  }
  return Text("-");
}
