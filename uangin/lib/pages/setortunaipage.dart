import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/pages/setortunaipinpage.dart';

class SetorTunaiPage extends StatefulWidget {
  final MoneyFormatter? parameterBerita;
  final String? namaKartu;
   
  const SetorTunaiPage({Key? key, this.parameterBerita, this.namaKartu}) : super(key: key);

  @override
  State<SetorTunaiPage> createState() => _SetorTunaiPageState(parameterBerita);
}


class _SetorTunaiPageState extends State<SetorTunaiPage> {
  _SetorTunaiPageState (MoneyFormatter? parameterBerita) : parameter = parameterBerita ?? MoneyFormatter(amount: 0);
  

  final MoneyFormatter? parameter;

  bool _hiddenBalance = false;

  
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
                      'Setor Tunai',
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
                  Text("Setoran tunai akan langsung masuk ke dalam Akun Uangin Kamu", style: TextStyle(color: UsedColor.primaryGrey, fontFamily: "OpenSans", fontSize: 16),)
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
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Tipe Transaksi", style: TextStyle(color: UsedColor.primaryGrey, fontSize: 16, fontFamily: "OpenSans", fontWeight: FontWeight.w600),),
                  Text("Setor Tunai", style: TextStyle(color: UsedColor.primaryGrey, fontFamily: "OpenSans", fontSize: 15, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Limit Setor Hari Ini Sisa", style: TextStyle(color: UsedColor.primaryGrey, fontSize: 16, fontFamily: "OpenSans", fontWeight: FontWeight.w600),),
                  Text("Rp 99.999.999,00", style: TextStyle(color: UsedColor.primaryGrey, fontFamily: "OpenSans", fontSize: 14, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ),

          
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SetorPinWidget()));
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
