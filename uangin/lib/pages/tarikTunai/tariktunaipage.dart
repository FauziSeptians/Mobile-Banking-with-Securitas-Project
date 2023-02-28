import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/pages/setortunaipinpage.dart';
import 'package:uangin/pages/tarikTunai/tariktunaipinpage.dart';

class TarikTunaiPage extends StatefulWidget {
  final MoneyFormatter? parameterBerita;
  final String? namaKartu;
  final AsyncSnapshot<User?> user;
   
  const TarikTunaiPage({Key? key, this.parameterBerita, this.namaKartu, required this.user}) : super(key: key);

  @override
  State<TarikTunaiPage> createState() => _TarikTunaiPageState(parameterBerita);
}


class _TarikTunaiPageState extends State<TarikTunaiPage> {
  _TarikTunaiPageState (MoneyFormatter? parameterBerita) : parameter = parameterBerita ?? MoneyFormatter(amount: 0);
  

  final MoneyFormatter? parameter;

  bool _hiddenBalance = false;

  MoneyMaskedTextController nominal = MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '' , precision: 0, initialValue: 0);

  int nom = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 5,
            pinned: true,
            shadowColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Row(
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
                      'Tarik Tunai',
                      style: TextStyle(
                        fontSize: 20,
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
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Konfirmasi", style: TextStyle(color: UsedColor.primaryGreen, fontSize: 20, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),
                  Text("Tarik tunai dapat dilakukan di ATM terdekat", style: TextStyle(color: UsedColor.primaryGrey, fontFamily: "OpenSans", fontSize: 16),)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(bottom: 20),
                color: Colors.white,
                // color: Colors.amber,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 154,
                        width: 291,
                        margin: const EdgeInsets.only(top: 60),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Image.asset('assets/cardBg2.png')
                      ),
                      Container(
                        height: 173,
                        width: 326,
                        margin: const EdgeInsets.only(top: 25),
                        
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Image.asset('assets/cardBg1.png')
                      ),
                      Container(
                        height: 210,
                        width: 349,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Image.asset('assets/cardBgPrimary.png')
                      ),
                      SizedBox(
                        width: 300,
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Saldo', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 15),),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 220,
                                  
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                
                                    children: [
                                    Text(!_hiddenBalance?parameter!.output.symbolOnLeft:"Rp *********", style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, color: Colors.white, fontSize: 23),),
                                    Text(!_hiddenBalance?'00':"", style: const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, color: Colors.white, fontSize: 15),),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _hiddenBalance = !_hiddenBalance;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10, bottom: 10),
                                        child: Image.asset(!_hiddenBalance?'assets/Icon/eyeHide.png':'assets/Icon/eyeShow.png', width: 18,),
                                      ),
                                    ),
                                  ],),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  const Text('**** **** **** 2018', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset('assets/Icon/copyIcon.png', width: 18,),
                                ],),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text('Pemegang Kartu', style: TextStyle(fontFamily: 'OpenSans', fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),),
                                Text(widget.namaKartu!, style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),)
                              ]
                            ),
                            Column(
                              
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.asset('assets/Icon/chipIcon.png', width: 44,),
                                const SizedBox(
                                  height: 50,
                                ),
                                Image.asset('assets/Icon/mastercard.png', width: 44,),
                              ]
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: const Text("Nominal (kelipatan 50.000)", style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 14,
                  color: Color(0xff8B8B8B),
                  fontWeight: FontWeight.w600
                ),
              ),          
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
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
                              nom = 0;
                              // initial = true;
                              value = value.replaceAll('.', '');
                              value = value.replaceAll(',', '.');
                              if (double.parse(value)  < 10000) {
                                setState(() {
                                  // isCanTransfer = false;
                                  // warningMinimum = 'Transaksi minimal Rp 10.000';
                                });
                              }
                              else {
                                setState(() {
                                  // warningMinimum = '';
                                  // isCanTransfer = true;
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
                      color: false ? const Color(0xffFF0000):const Color(0xffD9D9D9),
                    ),
                    
                  ],
                ),
              ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  SizedBox(
                    // alignment: Alignment.center,
                    width: 77,
                    height: 30,
                    child: 
                      TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: nom == 1 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Color(0xffD9D9D9)))
                      ),
                        onPressed: () {
                          setState(() {
                            nom = 1;
                            nominal.value = TextEditingValue(text: "100000") ;
                          });
                        },
                        child: Text(
                          '100.000',
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 13,
                            color: nom == 1 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                          ),
                        ),
                      ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    width: 77,
                    height: 30,
                    child: 
                      TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: nom == 2 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Color(0xffD9D9D9)))
                      ),
                        onPressed: () {
                          setState(() {
                            nom = 2;
                            nominal.value = TextEditingValue(text: "200000") ;
                          });
                        },
                        child: Text(
                          '200.000',
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 13,
                            color: nom == 2 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                          ),
                        ),
                      ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    width: 77,
                    height: 30,
                    child: 
                      TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: nom == 3 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Color(0xffD9D9D9)))
                      ),
                        onPressed: () {
                          setState(() {
                            nom = 3;
                            nominal.value = TextEditingValue(text: "250000") ;
                          });
                        },
                        child: Text(
                          '250.000',
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 13,
                            color: nom == 3 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                          ),
                        ),
                      ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    width: 70,
                    height: 30,
                    child: 
                      TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: nom == 4 ? const Color(0xffF0F0F0) : const Color.fromARGB(0, 255, 193, 7),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Color(0xffD9D9D9)))
                      ),
                        onPressed: () {
                          setState(() {
                            nom = 4;
                            nominal.value = TextEditingValue(text: "500000") ;
                          });
                        },
                        child: Text(
                          '500.000',
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 13,
                            color: nom == 4 ? const Color(0xff20E2A0) : const Color(0xff8D8D8D),
                          ),
                        ),
                      ),
                  ),

                ],
              )
            ),
          ),

          SliverToBoxAdapter(child: const SizedBox(height: 170,)),
      
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 25, right: 25),
              height: 60,
              
              child: const Text(
                'Pastikan mesin ATM mendukung penarikan dengan nominal 50.000 atau 100.000',
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 12,
                  color: Color(0xff8D8D8D),
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )

          
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
        
        child: Material(
          color: UsedColor.primaryGreen,
          borderRadius: BorderRadius.circular(15),

          child: InkWell(
            onTap: () {
              print('w');
              Navigator.push(context, MaterialPageRoute(builder: (context) => TarikTunaiPinPage(user: widget.user, nominal: nominal.text,)));
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text('Lanjut', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),
              ),
            ),
          ),
        )
      ),
    );
  }
}
