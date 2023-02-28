// ignore_for_file: prefer_final_fields

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uangin/contents/portofolio.dart';
import 'package:uangin/contents/portofolio2.dart';
import 'package:uangin/contents/transaksi.dart';

import '/classes/io_thing.dart';
import 'package:money_formatter/money_formatter.dart';
import '/classes/color_scheme.dart';
import 'package:uangin/contents/home.dart';
import 'package:uangin/contents/invest.dart';
import 'package:uangin/contents/profil.dart';



class HomeWidget extends StatefulWidget {
  
  const HomeWidget({super.key, required this.user});
  final AsyncSnapshot<User?> user;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int _currentIndex = 0;
  late final AsyncSnapshot<User?> Fireuser;
  
  StrStorage _primaryStorage = StrStorage('primary');
  
  void primaryTestWrite(int amount) async {
    await _primaryStorage.writeCounter(amount);
  }
  

  @override
  void initState() {
    debugPrint('init');
    
    super.initState();

    CollectionReference users = firestore.collection("users");
    users.doc(widget.user.data!.email).get().then((value) {
      log(value['pin'].toString());

    });
    Fireuser = widget.user;
    contents = [
      Home(user: Fireuser),
      Invest(user: Fireuser),
      Transaksi(user: Fireuser,),
      Portofolio(user: Fireuser),
      Profil(user: Fireuser)
    ];
  }
  late List <Widget> contents;

  

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitConfirmation() async {
      return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 328,
              // width: 500,
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Yakin akan keluar dari Uangin?',
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                  ),
                  const SizedBox(height: 10,),
                  Image.asset("assets/keluarImage.png", width: 214, height: 214,),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                          Future.delayed(const Duration(milliseconds: 1000), () {
                            exit(0);
                            });
                          // Navigator.of(context).pop(true);
                        },
                        child: Container(
                          // margin: const EdgeInsets.only(left: 25, right: 25),
                          // padding: const EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                            // border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                            //rounded
                            
                          ),
                          height: 45,
                          child: Row(
                            children: [
                              Container(
                                width: 156.3,
                                height: 60,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(5),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                  color: Color(0xffF0F0F0),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Ya',
                                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          // margin: const EdgeInsets.only(left: 25),
                          // padding: const EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                            
                          ),
                          height: 45,
                          child: Row(
                            children: [
                              Container(
                                width: 156.3,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
                                  color: UsedColor.primaryGreen,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Tidak',
                                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          );
            
        }
      )??false; //if showDialouge had returned null, then return false
    }
    return WillPopScope(
      onWillPop: showExitConfirmation,
      child: Scaffold(
        body: contents[_currentIndex],
        backgroundColor: Colors.white,
        
        //bagian navbar bawah
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 65,
          
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                  HapticFeedback.lightImpact();
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/HomeIcon.png', width: 16, height: 16, ),
                  ),
                  label: 'Home',
                  tooltip: 'Pergi ke Home',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/HomeIconActive.png', width: 16, height: 16,),
                  ),
                  
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/InvestIcon.png', width: 16, height: 16,),
                  ),
                  label: 'Investasi',
                  tooltip: 'Mulai Investasi',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/InvestIconActive.png', width: 16, height: 16,),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/TransactionIcon.png', width: 16, height: 16,),
                  ),
                  label: 'Transaksi',
                  tooltip: 'Lakukan Transaksi',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/TransactionIconActive.png', width: 16, height: 16,),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/TrackerIcon.png', width: 16, height: 16,),
                  ),
                  label: 'Portofolio',
                  tooltip: 'Portofolio Kamu',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/TrackerIconActive.png', width: 16, height: 16,),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/ProfileIcon.png', width: 16, height: 16,),
                  ),
                  label: 'Profil',
                  tooltip: 'Ke Profil Kamu',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset('assets/Icon/ProfileIconActive.png', width: 16, height: 16,),
                  ),
                ),
              ],
              selectedFontSize: 0,
              unselectedFontSize: 0,
              selectedLabelStyle:  const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w500, fontSize: 9.5, color: Color(0xff5ADFB2),),
              unselectedLabelStyle: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w500, fontSize: 9.5, color: Color(0xff8D8D8D)),
              selectedItemColor: UsedColor.primaryGreen,
              unselectedItemColor: UsedColor.primaryGrey,
              showUnselectedLabels: true,
              showSelectedLabels: true,
            ),
          ),
        ),
        extendBody: true,
      ),
    );
  }
}