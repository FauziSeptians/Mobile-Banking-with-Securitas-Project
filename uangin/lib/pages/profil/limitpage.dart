import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/classes/color_scheme.dart';

class Limitpage extends StatefulWidget {
  const Limitpage({super.key, required this.user});
  final AsyncSnapshot<User?> user;

  @override
  State<Limitpage> createState() => _LimitpageState();
}


int tap = 0;

class _LimitpageState extends State<Limitpage> {
  int setuang = -1;
  int sisauang = 0;
  MoneyFormatter? limitTransaksi;
  MoneyFormatter? sisaUangFormatter;

  @override
  initState() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    users.doc(widget.user.data!.email).get().then((value) {
      setState(() {
        setuang = value['limit'];
        sisauang = value['sisalimit'];
      });
    });
    setState(() {
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    MoneyMaskedTextController controllerNominal = MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', initialValue: setuang.toDouble(), precision: 0);
    limitTransaksi = MoneyFormatter(
        amount: setuang.toDouble(),
        settings: MoneyFormatterSettings(
            symbol: 'Rp ',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 0,
            compactFormatType: CompactFormatType.short));
    
    sisaUangFormatter = MoneyFormatter(
        amount: sisauang.toDouble(),
        settings: MoneyFormatterSettings(
            symbol: 'Rp ',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 0,
            compactFormatType: CompactFormatType.short));
    return
    setuang == -1 ?
    Scaffold(
      body: Container(
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
    ):
     Scaffold(
      body: SafeArea(
          child: Container(
        height: 20000,
        padding: const EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0XFFF5F5F5)),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (tap == 0) {
                              tap = 1;
                            } else {
                              tap = 0;
                            }
                          });
                        },
                        child: Container(
                          child: const CircleAvatar(
                            backgroundColor: Color(0XFFF5F5F5),
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Limit Transaksi",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                  Text(
                    "Atur Limit Transaksi Harian",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Jumah nominal maksimal yang bisa kamu lakukan untuk transaksi melalui Uangin per harinya.",
                    style: TextStyle(
                        fontFamily: "OpenSans", color: Colors.grey),
                  )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Limit Transaksi Harian",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                          ),
                        ),
                        tap == 1
                            ? TextField(
                                enabled: true,
                                controller: controllerNominal,
                                decoration: InputDecoration(
                                  hintText: "Rp " + setuang.toString(),
                                  hintStyle: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "OpenSans",
                                  ),
                                ),
                              )
                            : TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                    hintText: limitTransaksi!.output.symbolOnLeft,
                                    hintStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "OpenSans",
                                        color: Colors.black)),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sisa Limit transaksi hari ini",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                            Text(
                              sisaUangFormatter!.output.symbolOnLeft,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: "OpenSans",
                                  color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              tap == 1
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          setuang = int.parse(controllerNominal.text.replaceAll('.', ''));
                          sisauang = int.parse(controllerNominal.text.replaceAll('.', ''));
                          tap = 0;
                        });
                        setState(() {
                          tap = 0;
                          controllerNominal.clear();
                        });
                        FirebaseFirestore firestore = FirebaseFirestore.instance;
                        CollectionReference users = firestore.collection("users");
                        users.doc(widget.user.data!.email).update({
                          'limit': setuang,
                          'sisalimit': setuang,
                        });
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0XFF5ADFB2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Simpan",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.transparent,
                    )
            ]),
      )),
    );
  }
}
