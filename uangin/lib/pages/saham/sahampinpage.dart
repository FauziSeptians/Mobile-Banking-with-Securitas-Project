// ignore_for_file: prefer_final_fields


import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

import 'package:uangin/pages/homepage.dart';
import 'package:uangin/pages/saham/sahamorder.dart';
import 'package:uangin/pages/transfer/transferpage.dart';
import 'package:uangin/pages/transfer/transferreceipt.dart';
import 'package:vibration/vibration.dart';

import 'package:local_auth/local_auth.dart';

import '../../classes/auth_controller.dart';


class IntStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
 
    return directory.path;
  }
 
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }
 
  Future<String> get readCounter async {
    try {
      final file = await _localFile;
 
      // Read the file
      final contents = await file.readAsString();
 
      return (contents);
    } catch (e) {
      // If encountering an error, return 0
      return 'something went wrong';
    }
  }
 
  Future<File> writeCounter(List<int> counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class IntStorage2 {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
 
    return directory.path;
  }
 
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/biometricStatus.txt');
  }
 
  Future<String> get readCounter async {
    try {
      final file = await _localFile;
 
      // Read the file
      final contents = await file.readAsString();
 
      return (contents);
    } catch (e) {
      // If encountering an error, return 0
      return 'something went wrong';
    }
  }
 
  Future<File> writeCounter(List<int> counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}



class SahamPinPage extends StatefulWidget {
  
  const SahamPinPage({super.key, required this.user, });

  final AsyncSnapshot<User?> user;


  @override
  State<SahamPinPage> createState() => _SahamPinPageState();
}

class _SahamPinPageState extends State<SahamPinPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final AsyncSnapshot<User?> Fireusers;

  LocalAuthentication auth = LocalAuthentication();
  IntStorage intStorage = IntStorage();
  IntStorage2 biometricStatus = IntStorage2();

  Future authenticate() async {
      final bool isBiometricsAvailable = await auth.isDeviceSupported();
      
      if (!isBiometricsAvailable) return false;

      try {
        return await auth.authenticate(
          localizedReason: 'Masuk ke Uangin dengan biometrik kamu',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,

          ),
          
        );
      } on PlatformException {
        return;
      }
    }
  
  final List<Color> _colors = [
    const Color(0xff8B8B8B),
    const Color(0xff5ADFB2),
    const Color(0xffE74E4E),
  ];
  List<int> _pinBoxColor = [
    0, 0, 0, 0, 0, 0
  ];

  double _pinBoxMovementLeft = 0;
  double _pinBoxMovementRight = 0;

  int _pinBoxIndex = 0;
  void writeTest(){
    intStorage.writeCounter([1,2,3,4,5,6]);
  }
  List<int> _pinInput = [-1,-1,-1,-1,-1,-1];
  String savedValue = 'null';
  String savedBiometricStatus = 'belum';
  int point = 0;

  final authC = Get.find<AuthController>();

  Future<void> readTest() async {
    savedValue = await intStorage.readCounter;
  }
  Future<void> biometricRead() async {
    savedBiometricStatus = await biometricStatus.readCounter;
    print('w');
    while (savedBiometricStatus == 'belum'){
      biometricRead();
    }
    if (savedBiometricStatus == 'belum') {
      setState(() {
            
      });
    }
    else if (savedBiometricStatus != 'belum' && point == 0) {
      setState(() {
        point = 1;
      });
    }
  }

  String _pinPrompt = ' ';

  @override
  void initState(){
    super.initState();
    CollectionReference users = firestore.collection("users");
    users.doc(widget.user.data!.email).get().then((value) {
      log(value['pin'].toString());
      
      savedValue = value['pin'].toString();
    });
    Fireusers = widget.user;


  }

  void getToken() async {
  
  }

  

  @override
  Widget build(BuildContext context) {
 
    
    if (_pinBoxIndex == 6) {
      if (_pinInput.toString() ==  savedValue) {
        debugPrint('correct');
        Future.delayed(const Duration(milliseconds: 200) , (){
          Navigator.pushReplacement(
            context,
            // MaterialPageRoute(builder: (context) => const HomeWidget()),
            PageTransition (child: const SahamOrder(), type: PageTransitionType.fade,duration: const Duration(milliseconds: 250))
          );
        });
        
      } else {
        debugPrint('incorrect');
        Vibration.vibrate(duration: 450);
        setState(() {
          _pinBoxColor[0] = _pinBoxColor[1] = _pinBoxColor[2] = _pinBoxColor[3] = _pinBoxColor[4] = _pinBoxColor[5] = 2;   
          _pinPrompt = 'PIN kamu salah, coba lagi';
          
        });
        
        Future.delayed(const Duration(milliseconds: 750), () {
            setState(() {
            
            _pinBoxColor[0] = _pinBoxColor[1] = _pinBoxColor[2] = _pinBoxColor[3] = _pinBoxColor[4] = _pinBoxColor[5] = 0;
            _pinBoxIndex = 0;
            _pinInput = [-1,-1,-1,-1,-1,-1];
          });
        });
        
        
      }
    }

    return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox (
                    width: double.infinity,
                    height: 45,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 30),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 20,
                                offset: const Offset(0, 5), // changes position of shadow
                              ),
                            ],
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(100),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // authC.logout();
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text('Masukkan PIN', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, fontSize: 25, color: Color(0xff5ADFB2),),),
                  const Text('Masukkan 6 digit PIN kamu', style: TextStyle(fontFamily: 'OpenSans', fontSize: 16, color: Color(0xff8D8D8D),),),
                  const SizedBox(
                    height: 83,
                  ),
                  AnimatedContainer(
                    width: 262,
                    height: 20,
                    margin: EdgeInsets.only(left: _pinBoxMovementLeft, right: _pinBoxMovementRight),
                    duration: const Duration(milliseconds: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedContainer(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            color: _colors[_pinBoxColor[0]],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          duration: const Duration(milliseconds: 100),
                        ),
                        AnimatedContainer(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            color:  _colors[_pinBoxColor[1]],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          duration: const Duration(milliseconds: 100),
                        ),
                        AnimatedContainer(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            color:  _colors[_pinBoxColor[2]],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          duration: const Duration(milliseconds: 100),
                        ),
                        AnimatedContainer(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            color:  _colors[_pinBoxColor[3]],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          duration: const Duration(milliseconds: 100),
                        ),
                        AnimatedContainer(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            color:  _colors[_pinBoxColor[4]],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          duration: const Duration(milliseconds: 100),
                        ),
                        AnimatedContainer(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            color:  _colors[_pinBoxColor[5]],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          duration: const Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 71,
                    child: Center(
                      child: Text(_pinPrompt, style: const TextStyle(fontFamily: 'OpenSans', fontSize: 13, color: Color(0xffE74E4E),),),
                    ),
                  ),

                  SizedBox(
                    width: 290,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 1;
                                _pinBoxIndex++;

                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          
                          child: const Text('1', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 2;
                                _pinBoxIndex++;
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Text('2', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 3;
                                _pinBoxIndex++;
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Text('3', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 290,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 4;
                                _pinBoxIndex++;
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Text('4', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 5;
                                _pinBoxIndex++;
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Text('5', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 6;
                                _pinBoxIndex++;
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Text('6', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                    ]),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 290,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 7;
                                _pinBoxIndex++;
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Text('7', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 8;
                                _pinBoxIndex++;
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Text('8', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 9;
                                _pinBoxIndex++;
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Text('9', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                    ]),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 290,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: savedBiometricStatus == '1'? TextButton(
                          onPressed: () async {
                            bool isAuthenticated = await authenticate();
                            if (isAuthenticated) {
                              setState(() {
                                _pinBoxColor[0] = 1;
                                _pinBoxColor[1] = 1;
                                _pinBoxColor[2] = 1;
                                _pinBoxColor[3] = 1;
                                _pinBoxColor[4] = 1;
                                _pinBoxColor[5] = 1;
                                
                              });
                              Future.delayed(Duration(milliseconds: 100), () {
                                Navigator.pushReplacement(
                                  context,
                                  // MaterialPageRoute(builder: (context) => const HomeWidget()),
                                  PageTransition ( child: HomeWidget(user: Fireusers), type: PageTransitionType.fade,duration: const Duration(milliseconds: 250))
                                );
                              });

                              // ignore: use_build_context_synchronously
                              
                            }
                            else {
                              setState(() {
                                _pinBoxColor[0] = 2;
                                _pinBoxColor[1] = 2;
                                _pinBoxColor[2] = 2;
                                _pinBoxColor[3] = 2;
                                _pinBoxColor[4] = 2;
                                _pinBoxColor[5] = 2;
                                _pinPrompt = 'Fingerprint kamu tidak cocok, coba lagi atau gunakan PIN!';
                              });
                              Future.delayed(Duration(milliseconds: 750), () {
                                setState(() {
                                  _pinBoxColor[0] = 0;
                                  _pinBoxColor[1] = 0;
                                  _pinBoxColor[2] = 0;
                                  _pinBoxColor[3] = 0;
                                  _pinBoxColor[4] = 0;
                                  _pinBoxColor[5] = 0;
                                });
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Icon(
                            Icons.fingerprint,
                            size: 30,
                            color: Color(0xff8D8D8D),
                          ),
                        ): Container(),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex < 6) {
                              setState(() {
                                _pinBoxColor[_pinBoxIndex] = 1;
                                _pinInput[_pinBoxIndex] = 0;
                                _pinBoxIndex++;
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Text('0', style: TextStyle(fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff8D8D8D)),),
                        ),
                      ),
                      
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_pinBoxIndex > 0) {
                              setState(() {
                                _pinBoxColor[--_pinBoxIndex] = 0;
                                _pinInput[_pinBoxIndex] = -1;
                                
                              });
                            }
                            HapticFeedback.heavyImpact();
                          },
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            foregroundColor: const Color(0xff5ADFB2),
                            disabledForegroundColor:const Color(0xff5ADFB2),
                          ),
                          child: const Icon(
                            Icons.backspace_outlined,
                            size: 30,
                            color: Color(0xff8D8D8D),
                          ),
                        ),
                      ),
                    ]),
                  ),

                ]
              ),
            ),
          );
  }
}