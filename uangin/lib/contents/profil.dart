import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/services.dart';
import 'package:uangin/classes/biometric.dart';
import 'package:uangin/main.dart';
import 'package:uangin/pages/changepinpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uangin/pages/profil/bantuanpage.dart';
import 'package:uangin/pages/profil/ektp.dart';
import 'package:uangin/pages/profil/kamus.dart';
import 'package:uangin/pages/profil/limitpage.dart';
import 'package:uangin/pages/profil/profilrisikopage.dart';
import 'package:uangin/pages/profil/syarat.dart';
import 'package:uangin/pages/transfer/transferpage.dart';

import 'dart:developer' as dev;
import 'dart:math';

import '../classes/auth_controller.dart';

class Profil extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const Profil({Key? key, required this.user}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilWidgetState();
}

class _ProfilWidgetState extends State<Profil> {
  IntStorage2 _biometricStorage = IntStorage2();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final AsyncSnapshot<User?> Fireuser;
  String? nowUser = '';

  final authC = Get.find<AuthController>();

  void writeTest(int status){
    _biometricStorage.writeCounter(status);
  }
  
  String _shortName = 'n';
  String? firstName;
  String? lastName;
  String? phoneNumber;

  FToast? fToast;

  Random rnd = Random();
  

  bool savedValue = false;
  Future<void> biometricRead() async {
    CollectionReference users = firestore.collection("users");
    await users.doc(widget.user.data!.email).get().then((value) {
      savedValue = value['biometric'];
    });
    
    if (savedValue){
      biometricNow = true;
    } else {
      biometricNow = false;
    }
    setState(() {
      
    });
  }

  bool biometricNow = false;

  List<String> transferDummy = [
    "Ilham Sempol",
    "Suki",
    "Indrianto",
    "Jhun Liong",
    "Yu Zhong"
  ];

  

  LocalAuthentication auth = LocalAuthentication();
  Future authenticate() async {
      final bool isBiometricsAvailable = await auth.isDeviceSupported();

      if (!isBiometricsAvailable) return false;

      try {
        return await auth.authenticate(
          localizedReason: 'Verifikasi biometrik kamu',
          
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      } on PlatformException {
        return;
      }
    }
  
  @override
  void initState() {
    biometricRead();
    fToast = FToast();
    fToast!.init(context);
    
    super.initState();

    CollectionReference users = firestore.collection("users");
    users.doc(widget.user.data!.email).get().then((value) {
      firstName = value['firstName'];
      lastName = value['lastName'];
      phoneNumber = value['phoneNumber'];
      _shortName = firstName!.substring(0, 1) + lastName!.substring(0, 1);
    });
    nowUser = widget.user.data!.email;
    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(
      slivers: firstName != null ? [
        const SliverAppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 5,
          pinned: true,
          shadowColor: Colors.transparent,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            
            child: Container(
                  // color: Colors.red,
                  width: 360,
                  height: 50,
                  padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                  // color: Colors.blueAccent,
                  child: Row(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: const Color(0xff5ADFB2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(_shortName, style: const TextStyle(fontFamily: 'OpenSans', fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),),
                        )
                      ),
                      Container(
                        width: 252,
                        height: 70,
                        padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                '$firstName $lastName',
                                style: const TextStyle(fontFamily: 'OpenSans', fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xff5ADFB2)),
                              ),
                              Text(
                                phoneNumber!,
                                style: const TextStyle(fontFamily: 'OpenSans', fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff8D8D8D)),
                              ),
                              Text(
                                nowUser!,
                                style: const TextStyle(fontFamily: 'OpenSans', fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff8D8D8D)),
                              )
                            ],
                          ),
                      ),

                    ],
                  ),
                ),
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 10,)
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            height: 0.5,
            // color: Colors.black,
            child: Container(
              color: UsedColor.primaryGrey,
            ),
          ),
        ),
        

        //bagian 1
        SliverToBoxAdapter(
          child: Column(
            children: [
              InkWell(
                onTap:() {
                  // fToast?.showToast(
                  //   toastDuration: const Duration(milliseconds: 4500),
                  //   fadeDuration: const Duration(milliseconds: 100),
                  //   child: Material(
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: GestureDetector(
                  //       onVerticalDragUpdate: (details) {
                  //         if(details.delta.direction <= 0){
                  //           fToast?.removeCustomToast();
                  //         }
                  //       },
                  //       child: Container(
                  //         padding: const EdgeInsets.all(10),
                  //         height: 75,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           color: UsedColor.primaryGreen,
                  //           boxShadow: [
                  //              BoxShadow(
                  //               color: Colors.grey.withOpacity(0.5),
                  //               spreadRadius: 5,
                  //               blurRadius: 7,
                  //               offset: const Offset(0, 3), // changes position of shadow
                  //             ),
                  //           ]
                  //         ),
                  //         child: Row(
                  //           // mainAxisSize: MainAxisSize.min,
                  //           children:  [
                  //             Image.asset('assets/setorTunaiImage.png', width: 60,),
                  //             const SizedBox(width: 10,),
                  //             Text(
                  //               "Dana masuk dari Setoran Tunai melalui \nmesin ATM Sebesar Rp 200.000",
                  //               style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans"),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   // gravity: ToastGravity.BOTTOM,
                  //   positionedToastBuilder: (context, child) {
                  //     return Center(
                  //       child: Container(
                  //         margin: const EdgeInsets.only(bottom:700, left: 10, right: 10),
                  //         child: child,
                  //       ),
                  //     );
                  //   },
                  // );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RincianProfil(user: widget.user)));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/profileIcon2.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Profil',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ektpPage(user: widget.user,)));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/eKTPIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'e-KTP',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap:() {},
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/settingsIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Pengaturan',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap:() {
                  // copy to firestore
                  // FirebaseFirestore.instance.collection('users').doc('user1').set({
                  // firestore.collection('users').doc('mkristianto@gmail.com').get().then((value) {
                  //   firestore.collection('users').doc('mkristianto@uangin.id').set(value.data()!); })
                  // });

                  //copy to firestore
                  // firestore.collection('users').doc('julsalim14@gmail.com').get().then((value) {
                  //   firestore.collection('users').doc('keziaoktavioni@uangin.id').set(value.data()!);
                  // });

                  // firestore.collection('portofolio').doc('julsalim14@gmail.com').get().then((value) {
                  //   dev.log(value.get('investasi').toString());
                  // //   // firestore.collection('daftarRekening').doc('julsalim14@gmail.com').collection('daftarRekening3').add(value.get('daftarRekening3') as Map<String, dynamic>);

                  // //   //update firestore array
                  //   List<dynamic> temp = value.get('investasi') as List<dynamic>;
                  //   temp.add(value.get('investasi')[0]);
                  //   print(temp);
                  //   firestore.collection('portofolio').doc('mkristianto@uangin.id').update({
                  //     'investasi': temp
                  //   });

                  // });


                  // firestore.collection('users').doc('julsalim14@gmail.com').get().then((value) {
                  //   dev.log(value.get('eKTP').toString());
                  // //   // firestore.collection('daftarRekening').doc('julsalim14@gmail.com').collection('daftarRekening3').add(value.get('daftarRekening3') as Map<String, dynamic>);

                  // //   //update firestore array
                  //   var temp = value.get('eKTP');
                  //   // temp.add(value.get('eKTP')[0]);
                  //   print(temp);
                  //   firestore.collection('users').doc('mkristianto@uangin.id').update({
                  //     'eKTP': temp
                  //   });

                  // });

                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/referralIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Kode Referral',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),

              

            ],
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            color: UsedColor.secondaryGrey,
            height: 10,
          ),
        ),

        SliverToBoxAdapter(
          child: Column(
            children: [
              InkWell(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransferPage(user: widget.user,)));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/daftarRekeningIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Daftar Rekening',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),
              
              InkWell(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Limitpage(user: widget.user,)));
                
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/limitIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Limit Transaksi',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),

              

            ],
          ),
        ),


        SliverToBoxAdapter(
          child: Container(
            color: UsedColor.secondaryGrey,
            height: 10,
          ),
        ),

        //bagian 3
        SliverToBoxAdapter(
          child: Column(
            children: [
              InkWell(
                onTap:() async{
                  final res = await Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePinWidget(user: widget.user)));

                  if (res != null) {
                    
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/gantiPinIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Ganti PIN',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),
              
              InkWell(
                onTap:() async{

                  if (biometricNow) {
                    firestore.collection('users').doc(widget.user.data!.email).update({
                      'biometric': !biometricNow,
                    });
                    setState(() {
                      biometricNow = !biometricNow;
                    });
                    writeTest(0);

                  }
                  else {
                    bool isAuthenticated = await authenticate();
                    firestore.collection('users').doc(widget.user.data!.email).update({
                      'biometric': !biometricNow,
                    });
                    if (isAuthenticated) {
                      setState(() {
                        biometricNow = !biometricNow;
                      });
                      writeTest(1);
                      
                    }
                  }
                  
             

                 
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/biometrikIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Aktifkan Login Biometrik',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        width: 35,
                        height: 20,
                        padding: 5,
                        activeColor: UsedColor.primaryGreen,
                        toggleSize: 12.0,
                        value: biometricNow,
                        onToggle: (value) async {
                          if (biometricNow) {
                            firestore.collection('users').doc(widget.user.data!.email).update({
                              'biometric': !biometricNow,
                            });
                            setState(() {
                              biometricNow = !biometricNow;
                            });
                            writeTest(0);

                          }
                          else {
                            bool isAuthenticated = await authenticate();
                            firestore.collection('users').doc(widget.user.data!.email).update({
                              'biometric': !biometricNow,
                            });
                            if (isAuthenticated) {
                              setState(() {
                                biometricNow = !biometricNow;
                              });
                              writeTest(1);
                            }
                          }         
                        },

                      ),
                    ],
                  ),
                ),
              ),

              

              

            ],
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            color: UsedColor.secondaryGrey,
            height: 10,
          ),
        ),

        //bagian 4
        SliverToBoxAdapter(
          child: Column(
            children: [
              InkWell(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const KamusPage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/kamusIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Kamus Investasi',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SyaratDanKetentuan()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/syaratIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Syarat dan Ketentuan',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),
              
              InkWell(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BantuanPage(user: widget.user, nama: '$firstName $lastName')));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/bantuanIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Bantuan',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap:() {
                  //dialog
                  showDialog(
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
                                'Mau Masuk dengan Akun Lain?',
                                style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                              ),
                              const SizedBox(height: 10,),
                              const Text('Data Login Anda akan dihapus dari perangkat ini', style: TextStyle(fontFamily: 'OpenSans', fontSize: 12, fontWeight: FontWeight.w400, color: UsedColor.primaryGrey),),
                              Image.asset("assets/keluarImage.png", width: 214, height: 214,),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      authC.logout();
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
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
                                            decoration: const BoxDecoration(
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
                                            decoration: const BoxDecoration(
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
                  );
                  // authC.logout();
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: UsedColor.secondaryGrey, width: 0.5))
                  ),
                  height: 45,
                  child: Row(
                    children: [
                      Image.asset("assets/Icon/logoutIcon.png", width: 22),
                      const SizedBox(width: 20,),
                      const Text(
                        'Masuk dengan Akun Lain',
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xffE74E4E)),
                      ),
                    ],
                  ),
                ),
              ),

              

              

            ],
          ),
        ),

        

        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 100, right: 100, top: 20),
                width: 200,
                child: const Text(
                  'Uangin terdaftar dan diawasi oleh Otoritas Jasa Keuangan',
                  style: TextStyle(fontFamily: 'OpenSans', fontSize: 12, fontWeight: FontWeight.w400, color: UsedColor.primaryGrey),
                  textAlign: TextAlign.center,
                  ),
              ),

              Image.asset("assets/Icon/ojkIcon.png", width: 120),

            ]
          )
        ),

        const SliverToBoxAdapter(
          child: SizedBox(
            height: 70,
          ),
        )


      ]
      :
      [
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
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
            ),
            
          )
        ],
    );
  }

}