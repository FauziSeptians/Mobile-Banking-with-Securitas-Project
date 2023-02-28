import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uangin/pages/loginpage.dart';
import 'package:uangin/pages/pinpage.dart';
import 'package:flutter/services.dart';
import '../classes/auth_controller.dart';
import '/classes/color_scheme.dart';


class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
            body: Center(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(0,0,0,7),
                    child: Image.asset('assets/splashImage4.png',),
                  ),
                  Container (
                    margin: const EdgeInsets.only(top: 330),
                    // color: Colors.amber,
                    height: 400,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 181,
                          child: Image.asset('assets/UanginLogo1.png',),
                        ),
                        Container(
                          width: 316,
                          height: 81,
                          margin: const EdgeInsets.only(top: 10, bottom: 30),
                          child: const Text('Bank Digital dan Sekuritas Investasi\ndalam Satu Genggaman', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, fontSize: 15, color: Color(0xff8D8D8D),), textAlign: TextAlign.center,),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        ElevatedButton(
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

                              HapticFeedback.heavyImpact();

                              setState(() {
                                
                              });
                              // authC.logout();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: UsedColor.primaryGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 127)
                          ),
                          child: const SizedBox(
                            height: 35,
                            width: 80,
                            child: Center(child: Text('Masuk', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xffFFFFFF),), textAlign: TextAlign.center,),)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}