import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/transfer/transferpage.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:uangin/pages/transfer/transferpinpage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class TfConfirmationPage extends StatefulWidget {
  const TfConfirmationPage({super.key, required this.contact, required this.user});
  final Person contact;
  final AsyncSnapshot<User?> user;
  @override
  State<TfConfirmationPage> createState() => _TfConfirmationPageState();
}

class _TfConfirmationPageState extends State<TfConfirmationPage> {
  MoneyMaskedTextController nominal = MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', initialValue: 0, precision: 0);
  TextEditingController catatan = TextEditingController();
  bool isCanTransfer = false;
  String warningMinimum = "";
  bool initial = false;

  final List<String> items = [
    'Makanan',
    'Liburan',
    'Edukasi',
    'Lainnya',
  ];
  String? selectedValue = 'Lainnya';

  Future<bool> showExitConfirmation() async {
      return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 308,
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
                    'Melebihi batas transfer hari ini',
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.w600, color: UsedColor.primaryGrey),
                  ),
                  // const SizedBox(height: 10,),
                  Image.asset("assets/sedih.png", width: 214, height: 214,),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                width: 156.3 * 2,
                                height: 70,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                  color: UsedColor.primaryGreen,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Kembali',
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
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
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: const Text("Transfer", style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    color: Color(0xff3D3D3D),
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                height: 90,
                decoration: BoxDecoration(
                  // color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                  
                  border: Border.all(
                    color: const Color(0xffD9D9D9),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Initial(widget.contact.nama),
                    const SizedBox(width: 10,),
                    Container(
                      height: 50,
                      // color: Colors.red,
      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.contact.nama!, 
                            style: const TextStyle(
                              color: Color(0xff5D5D5D),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: "OpenSans"
                            ),
                          ),
                          Text(
                          '${widget.contact.bank!}'" - "'${widget.contact.norek!}', 
                          style: const TextStyle(
                            color: Color(0xff8D8D8D),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: "OpenSans"
                          ),
                        ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Image.asset('assets/Icon/pencilicon.png', width: 25, height: 25,)
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: const Text("Nominal Transfer", style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 14,
                    color: Color(0xff8B8B8B),
                    fontWeight: FontWeight.w500
                  ),
                ),          
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                height: 52,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Rp', style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 20,
                          color: Color(0xff5D5D5D),
                          fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9 - 53,
                          height: 50,
                          child: TextField(
                            controller: nominal,
                            onChanged: (value) {
                              initial = true;
                              value = value.replaceAll('.', '');
                              value = value.replaceAll(',', '.');
                              if (double.parse(value)  < 10000) {
                                setState(() {
                                  isCanTransfer = false;
                                  warningMinimum = 'Transaksi minimal Rp 10.000';
                                });
                              }
                              else {
                                setState(() {
                                  warningMinimum = '';
                                  isCanTransfer = true;
                                });
                              }
                            },
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 20,
                              color: Color(0xff5D5D5D),
                              fontWeight: FontWeight.bold
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '0',
                              hintStyle: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 20,
                                color: Color(0xff9E9E9E),
                                fontWeight: FontWeight.bold
                              ),
      
                            )
                          ),
                        ),
                      ],
                    ),
                    
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: !isCanTransfer && initial ? const Color(0xffFF0000):const Color(0xffD9D9D9),
                    ),
                    
                  ],
                ),
              ),
              !isCanTransfer ?
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: Text(warningMinimum, style: const TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 12,
                    color: Color(0xffFF0000),
                    fontWeight: FontWeight.w500
                  ),
                  
                ),
              ):
              Container(),
              const SizedBox(height: 15,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: const Text("Tipe Transaksi", style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 14,
                    color: Color(0xff8B8B8B),
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //dropdown menu
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Text(
                        'Transfer Online',
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 20,
                          color: Color(0xff5D5D5D),
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(left: 10),
                        child: const Icon(Icons.keyboard_arrow_down, color: Color(0xff5D5D5D), size: 20,),
                      )
                
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 25, right: 25),
                height: 1,
                color: const Color(0xffD9D9D9),
              ),
              const SizedBox(height: 15,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: const Text("Catatan", style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 14,
                    color: Color(0xff8B8B8B),
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 5,),
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
                            controller: catatan,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 20,
                              color: Color(0xff5D5D5D),
                              fontWeight: FontWeight.bold
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '(Opsional)',
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

              const SizedBox(height: 15,),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: const Text("Kategori Transaksi", style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 14,
                    color: Color(0xff8B8B8B),
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //dropdown menu
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
                      hint: const Text('Lainnya', style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 18,
                        color: Color(0xff5D5D5D),
                        fontWeight: FontWeight.w500
                      ),),
                      items: items
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
              

              const SizedBox(height: 80,),
      
              Container(
                width: double.infinity,
                height: 60,
                
                child: const Text(
                  'Uangin tidak bertanggung jawab atas segala akibat atas ketidakbenaran pengisian data ini',
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 12,
                    color: Color(0xff8D8D8D),
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                ),
              )
              
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: isCanTransfer ? Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
        
        child: Material(
          color: UsedColor.primaryGreen,
          borderRadius: BorderRadius.circular(15),

          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () async{
              FirebaseFirestore firestore = FirebaseFirestore.instance;
              CollectionReference users = firestore.collection('users');
              var limit = 0;
              await users.doc(widget.user.data!.email).get().then((value) {
                limit = value.get('sisalimit');
                
              });
              
              if (limit <= 0 || (limit - int.parse(nominal.text.replaceAll('.', '').toString())) < 0) {
                showExitConfirmation();
              }
              else {
                users.doc(widget.user.data!.email).update({
                  'sisalimit': limit - int.parse(nominal.text.replaceAll('.', '').toString())
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => TfPinPage(user: widget.user, catatan: catatan.text, nominal: nominal.text, contact: widget.contact, kategori: selectedValue!,)));
              }

            },
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
    );
  }
}

// ignore: non_constant_identifier_names
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
      style: const TextStyle(
        fontFamily: "OpenSans",
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold

      ),
    ),
  );
}

// class CurrencyInputFormatter extends TextInputFormatter {

//     TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

//         if(newValue.selection.baseOffset == 0){
//             print(true);
//             return newValue;
//         }

//         double value = double.parse(newValue.text);

//         final formatter = NumberFormat.simpleCurrency(locale: "id_ID");

//         String newText = formatter.format(value).substring(2, formatter.format(value).length);

//         return newValue.copyWith(
//             text: newText,
//             selection: TextSelection.collapsed(offset: newText.length));
//     }
// }