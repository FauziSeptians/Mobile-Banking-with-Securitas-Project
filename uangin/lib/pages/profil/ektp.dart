import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';


class ektpPage extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const ektpPage({super.key, required this.user});

  @override
  State<ektpPage> createState() => _ektpPageState();
}


double ppy = 0.0617;
class _ektpPageState extends State<ektpPage> {
  BottomDialog bot = const BottomDialog();
  Map <String, String> data = {
    
  };

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void fetchData () async {
    firestore.collection('users').doc(widget.user.data!.email).get().then((value) {
      setState(() {
        //get value then assign it to a map
        data = Map<String, String>.from(value.get('eKTP'));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(child: ListView(
            children: [
             Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          // color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: const Icon(Icons.arrow_back_ios, color: UsedColor.primaryGreen, size: 20,)
                      ),
                    ),
                  ],            
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: const Text("E-KTP",
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 35,),
              Container(
                // color: Colors.amber,
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Nama Lengkap (Sesuai E-KTP)",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.grey,
                        fontSize: 14
                      ),
                    ),
                    Text(data["nama"].toString(),
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                // color: Colors.amber,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("NIK",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.grey,
                        fontSize: 14
                      ),
                    ),
                    Text(data["nik"].toString(),
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                // color: Colors.amber,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Tanggal Lahir",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.grey,
                        fontSize: 14
                      ),
                    ),
                    Text(data["tglLahir"].toString(),
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                // color: Colors.amber,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Alamat",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.grey,
                        fontSize: 14
                      ),
                    ),
                    Text(data["alamat"].toString(),
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("RT",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              color: Colors.grey,
                              fontSize: 14
                            ),
                          ),
                          Text(data["RT"].toString(),
                            style: const TextStyle(
                              fontFamily: "OpenSans",
                              color: Colors.black,
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("RW",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              color: Colors.grey,
                              fontSize: 14
                            ),
                          ),
                          Text(data["RT"].toString(),
                            style: const TextStyle(
                              fontFamily: "OpenSans",
                              color: Colors.black,
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                // color: Colors.amber,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Kelurahan/Desa",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.grey,
                        fontSize: 14
                      ),
                    ),
                    Text(data["kelurahan"].toString(),
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                // color: Colors.amber,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Kecamatan",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.grey,
                        fontSize: 14
                      ),
                    ),
                    Text(data["kecamatan"].toString(),
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                // color: Colors.amber,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Kota/Kabupaten",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.grey,
                        fontSize: 14
                      ),
                    ),
                    Text(data["kota"].toString().toUpperCase(),
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                // color: Colors.amber,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Provinsi",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.grey,
                        fontSize: 14
                      ),
                    ),
                    Text(data["provinsi"].toString().toUpperCase(),
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100,),
            ],
          )),
        ),
        floatingActionButton: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            alignment: Alignment.center,
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: UsedColor.primaryGreen,
            ),
            child: Material(
              color: UsedColor.primaryGreen,
              child: InkWell(
                onTap: () {
                  bot.showBottomDialog(context);
                },
                child: const Text('Perbaharui E-KTP', style: 
                  TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}

class BottomDialog extends StatefulWidget {
  const BottomDialog({super.key});

  void showBottomDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return const Align(
          alignment: Alignment.bottomCenter,
          child: Dialogcontent(),
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
  const Dialogcontent({super.key});

  @override
  State<Dialogcontent> createState() => _DialogcontentState();
}

class _DialogcontentState extends State<Dialogcontent> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: 
      Container(
          // color: Colors.amberAccent,
          height: 480,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
            // color: Colors.red,
            height: 600,
            width: double.infinity,
            child: Material(
              color: const Color.fromARGB(0, 255, 193, 7),
              child: Column(
                children: [
                  Image.asset("assets/Icon/id.png", height: 190, width: 250,),
                  SizedBox(
                    // color: Colors.amber,
                    height: 45,
                    width: 370,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text("Ada perubahan data E-KTP?",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const Text("Tim Uangin siap bantu perubahan data kamu",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.grey,
                            fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 55,),
                  Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      alignment: Alignment.center,
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: UsedColor.primaryGreen,
                      ),
                      child: const Text('Hubungi', style: 
                            TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500
                            ),
                          ),
                  ),
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {Navigator.pop(context);},
                      child: Container(
                          // margin: const EdgeInsets.only(bottom: 15),
                          alignment: Alignment.center,
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: UsedColor.primaryGreen, width: 1),
                            
                          ),
                          child: const Text('Batal', style: 
                                TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                      ),
                    ),
                  ),
                        
                  // Material(child: InkWell(onTap: () {Navigator.pop(context);}, child: Container(width: 30, height: 30,child: const Icon(Icons.close, size: 15, color: Color(0xffB1B1B1),))))
                ],
              ),
            ),
          )
        ),
    
    
    );
  }
}
