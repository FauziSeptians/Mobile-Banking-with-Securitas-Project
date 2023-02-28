
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uangin/pages/mainpage.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:uangin/pages/pinpage.dart';

import 'classes/auth_controller.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  // runApp(const MyApp());
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final authC = Get.put(AuthController());
  
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<User?>(
      // initialData: FirebaseAuth.instance.currentUser,
      // initialData: null,
      stream: authC.streamAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          return (snapshot.data != null) ? 
          MaterialApp(
            theme: ThemeData(
              androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
            ),
            debugShowCheckedModeBanner: false,
            home: Builder(
              builder: (context) {
                return PinWidget(user: snapshot);
              }
            ),
          )
          :
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Builder(
              builder: (context) {
                return const MainWidget();
              }
            ),
          );
        }
        
      });
    
  }
}
