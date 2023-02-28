import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TfNewPage extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const TfNewPage({super.key, required this.user});

  @override
  State<TfNewPage> createState() => _TfNewPageState();
}

class _TfNewPageState extends State<TfNewPage> {
  String selectedValue = '-- Pilih Bank --';
  TextEditingController noRek = TextEditingController();
  TextEditingController namaPenerima = TextEditingController();
  final List<String> namaBank = [
    '-- Pilih Bank --',
    'Uangin',
    'BCA Digital',
    'Bank BCA',
    'BRI',
    'MANDIRI ',
    'BNI',
    'BTN',
    'DANAMON INDONESIA',
    'BANK PERMATA',
    'MAYBANK  INDONESIA',
    'PT PAN INDONESIA BANK',
    'CIMB NIAGA',
    'UOB INDONESIA',
    'OCBC NISP',
    'ARTHA GRAHA INTERNASIONAL',
    'BUMI ARTA',
    'HSBC INDONESIA',
    'JTRUST INDONESIA',
    'MAYAPADA INTERNATIONAL',
    'BANK OF INDIA INDONESIA',
    'MUAMALAT INDONESIA',
    'MESTIKA DHARMA',
    'SHINHAN INDONESIA',
    'SINARMAS',
    'MASPION INDONESIA',
    'GANESHA',
    'ICBC INDONESIA',
    'QNB INDONESIA',
    'WOORI SAUDARA INDONESIA 1906',
    'MEGA',
    'BANK SYARIAH INDONESIA ',
    'KB BUKOPIN',
    'KEB HANA INDONESIA',
    'MNC INTERNASIONAL',
    'RAYA INDONESIA Tbk',
    'SBI INDONESIA',
    'MEGA SYARIAH',
    'INDEX SELINDO',
    'MAYORA',
    'CHINA CONSTRUCTION BANK INDONESIA',
    'DBS INDONESIA',
    'RESONA PERDANIA',
    'MIZUHO INDONESIA',
    'CAPITAL INDONESIA',
    'BNP PARIBAS INDONESIA',
    'ANZ INDONESIA',
    'IBK INDONESIA',
    'PT BANK ALADIN SYARIAH **)',
    'CTBC INDONESIA',
    'COMMONWEALTH',
    'BTPN',
    'VICTORIA SYARIAH',
    'JABAR BANTEN SYARIAH',
    'PT KROM BANK INDONESIA',
    'JASA JAKARTA',
    'NEO COMMERCE',
    'DIGITAL BCA',
    'NATIONALNOBU',
    'INA PERDANA',
    'PANIN DUBAI SYARIAH',
    'PT PRIMA MASTER BANK',
    'KB BUKOPIN SYARIAH',
    'SAHABAT SAMPOERNA',
    'OKE INDONESIA',
    'AMAR INDONESIA',
    'SEABANK INDONESIA',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: MediaQuery.of(context).size.width * 0.68,
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
              SizedBox(height: 40,),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: Text("Transfer Baru", style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "OpenSans"
                )),
              ),
              SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: Text("Nama Bank Tujuan", style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "OpenSans"
                )),
              ),
              SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: 900,
                child: InkWell(
                  onTap: () {
                    //on tap show bottom sheet
                    
                  },
                  child: DropdownButtonHideUnderline (
                    child: DropdownButton2(
                      style:  const TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 18,
                        color: Color(0xff5D5D5D),
                        fontWeight: FontWeight.w500
                      ),
                      hint: const Text('Pilih Bank', style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 18,
                        color: Color(0xff5D5D5D),
                        fontWeight: FontWeight.w500
                      ),),
                      items: namaBank
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                              .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 140,
                      itemHeight: 40,
                    ),
                  )
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: Text("Nomor Rekening Tujuan", style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "OpenSans"
                )),
              ),
              SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                height: 52,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9 - 53,
                          height: 50,
                          child: TextField(
                            controller: noRek,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 20,
                              color: Color(0xff5D5D5D),
                              fontWeight: FontWeight.bold
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukkan Nomor Rekening',
                              hintStyle: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 17,
                                color: Color(0xff9E9E9E),
                                fontWeight: FontWeight.w600
                              ),
      
                            )
                          ),
                        ),
      
                        
                      ],
                    ),
                    
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(0xffD9D9D9),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
               Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: Text("Nama Penerima", style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "OpenSans"
                )),
              ),
              SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                height: 52,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9 - 53,
                          height: 50,
                          child: TextField(
                            controller: namaPenerima,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 20,
                              color: Color(0xff5D5D5D),
                              fontWeight: FontWeight.bold
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukkan Nama Penerima',
                              hintStyle: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 17,
                                color: Color(0xff9E9E9E),
                                fontWeight: FontWeight.w600
                              ),
      
                            )
                          ),
                        ),
      
                        
                      ],
                    ),
                    
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(0xffD9D9D9),
                    ),
                  ],
                ),
              ),
              Spacer(),
              selectedValue != '-- Pilih Bank --' && noRek.text.isNotEmpty? Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
        
        child: Material(
          color: UsedColor.primaryGreen,
          borderRadius: BorderRadius.circular(15),

          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              
              FirebaseFirestore firestore = FirebaseFirestore.instance;
              CollectionReference users = firestore.collection('daftarRekening');
              users.doc(widget.user.data!.email).get().then((value) {
                // log(value.get('daftarRekening3').toString());
                List<dynamic> temp = value.get('daftarRekening3') as List<dynamic>;
                temp.add({
                  'bank': selectedValue,
                  'noRekening': noRek.text,
                  'nama': namaPenerima.text,
                  'email': 'null',
                });
                users.doc(widget.user.data!.email).update({
                  'daftarRekening3': temp,
                }).then((value) {
                  // Navigator.pop(context);
                  log('berhasil');
                });
              });
              Navigator.pop(context);
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text('Tambah Rekening', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),
              ),
            ),
          ),
        )
      )
      :
      Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
        
        child: Material(
          color: UsedColor.primaryGrey,
          borderRadius: BorderRadius.circular(15),

          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text('Transfer', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),
              ),
            ),
          ),
        )
      ),
            ],
          )
        ),
      ),
      
    );
  }
}