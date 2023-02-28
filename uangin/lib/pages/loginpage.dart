import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uangin/classes/color_scheme.dart';

import '../classes/auth_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
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

            Image.asset('assets/UanginLogo1.png', width: 180, height: 180,),

            const SizedBox(height: 20,),

            const Text(
              'Selamat Datang di Uangin! Sign in untuk\nmemulai',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: UsedColor.primaryGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Color(0xffEEEEEE),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                controller: emailController,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email Address',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: UsedColor.primaryGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),  
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Color(0xffEEEEEE),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,

                controller: passwordController,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  
                  
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: UsedColor.primaryGrey,

                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),

            Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Lupa Password?', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: UsedColor.primaryGreen,
                    ),),
                  ),
                  ]
              )
            ),
            
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(UsedColor.primaryGreen),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(349, 50)),
              ),
              onPressed: () async{
                bool isLogin = false;
                isLogin = await authC.login(emailController.text, passwordController.text);
                
                //close keyboard
                

                if (isLogin) {
                  Navigator.pop(context);
                }
                else {
                  FocusScope.of(context).unfocus();
                  //open dialog error
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Login Gagal'),
                        content: const Text('Email atau Password salah'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    }
                  );
                }
              },
              child: const Text('Masuk', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "OpenSans",
                color: Colors.white,
              ),),
            ),

            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Tidak Ada Akun? Sign Up', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: UsedColor.primaryGreen,
                    ),),
                  ),
                  ]
              )
            ),
          ],
        ),
      )
      
    );
  }
}