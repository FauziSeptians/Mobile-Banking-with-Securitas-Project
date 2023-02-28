import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/transfer/transferconfirmationpage.dart';
import 'package:uangin/pages/transfer/transfernewrek.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Person {
  String? nama;
  String? bank;
  String? norek;
  String? email;

  Person(this.nama, this.bank, this.norek, this.email);
}

class TransferPage extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const TransferPage({super.key, required this.user});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  
  List<Person> display_list = [];
  List<Person> contact_list = [];


  void update_list(String value) {
    setState(() {
      display_list = contact_list
        .where((element) => 
          element.nama!.toLowerCase().contains
          (value.toLowerCase()))
        .toList();
    });
  }

  bool isLoading = true;

  void fetchData () async{
    contact_list.clear();
    await firestore.collection("daftarRekening").doc(widget.user.data!.email).get().then((value) {
        //create for each loop
        for (var i = 0; i < value.get('daftarRekening3').length; i++) {
          //create new object
          // log(value.get('daftarRekening3')[i]['noRekening'].toString());
          Person person = Person(
            value.get('daftarRekening3')[i]['nama'],
            value.get('daftarRekening3')[i]['bank'],
            value.get('daftarRekening3')[i]['noRekening'],
            value.get('daftarRekening3')[i]['email'],
          );
          //add object to list
          contact_list.add(person);
        }
    });
    contact_list.sort((a, b) => a.nama!.compareTo(b.nama!));
    display_list = contact_list;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }
  
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    fetchData();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }


  @override
  Widget build(BuildContext context) {
    // display_list = contact_list;
    // print(display_list.length);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Transfer',
                        style: TextStyle(
                          fontSize: 16,
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
              const SizedBox(height: 10,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                child: const Text("Daftar Rekening", style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    color: Color(0xff3D3D3D),
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 13,),
              Container(
                height: 40,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  // textAlign: TextAlign.center,
                  onChanged: (value) => update_list(value),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Color(0xffF0F0F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Cari",
                    prefixIcon: Icon(Icons.search, color: UsedColor.primaryGreen),
                    // prefixIconColor: Color(0xff5D5D5D),

                  ),
                ),
              ),
              SizedBox(height: 13,),
              (isLoading || contact_list.length == 0) ? Container(
              height: MediaQuery.of(context).size.height - 250,
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
              ) :
              Container(
                // color: Colors.blue,
                height: 700,
                child: SmartRefresher(
                  onRefresh: _onRefresh,
                  enablePullDown: true,
                  controller: _refreshController,
                  child: ListView.builder(
                    shrinkWrap: false,
                    
                    padding: EdgeInsets.zero,
                    itemCount: display_list.length + 4,
                    itemBuilder: (context, index) => (index < display_list.length) ? InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TfConfirmationPage(user: widget.user, contact: display_list[index],)));
                      },
                      child: ListTile(
                        // contentPadding: EdgeInsets.all(8),
                        title: Text(display_list[index].nama!, 
                          style: const TextStyle(
                            color: Color(0xff5D5D5D),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: "OpenSans"
                          ),
                        ),
                        subtitle: Text(
                          '${display_list[index].bank!}'" - "'${display_list[index].norek!}', 
                          style: const TextStyle(
                            color: Color(0xff8D8D8D),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: "OpenSans"
                          ),
                        ),
                    
                        leading: Initial(display_list[index].nama!),
                      ),
                    ):
                    const SizedBox(height: 20,)
                  ),
                ),
                
              ),
              const SizedBox(height: 200,),
            ],
          ),
        ),
      ),
      floatingActionButton: Material(
        color: UsedColor.primaryGreen,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            HapticFeedback.mediumImpact();
            Navigator.push(context, MaterialPageRoute(builder: (context) => TfNewPage(user: widget.user,)));
          },
          child: Container(
            alignment: Alignment.center,
            width: 160,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: UsedColor.primaryGreen,
            ),
            child: const Text('Rekening Baru', style: 
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    // return Scaffold();
  }
}

Widget Initial(name) {
  String getInitials(String name) => name.isNotEmpty
    ? name.trim().split(' ').map((l) => l[0]).take(2).join()
    : '';

  return Container(
    width: 50,
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: UsedColor.primaryGreen,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      getInitials(name),
      style: TextStyle(
        fontFamily: "OpenSans",
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold

      ),
    ),
  );
}