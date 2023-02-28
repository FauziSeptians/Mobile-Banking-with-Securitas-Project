import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:uangin/pages/setortunaipinpage.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class SetorTunaiDetailPage extends StatefulWidget {
  
   
  const SetorTunaiDetailPage({Key? key}) : super(key: key);

  @override
  State<SetorTunaiDetailPage> createState() => _SetorTunaiDetailPageState();
}


class _SetorTunaiDetailPageState extends State<SetorTunaiDetailPage> {
  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

  Random random = Random();
  List<String> kodeTransaksi = [];
  List<String> noReferensi = ["1","7","3","6","8","9","3","4","0","2"];
  
  @override
  void initState() {
    for (var i = 0; i < 7; i++) {
      int rnd = random.nextInt(10);
      kodeTransaksi.add(rnd.toString());
    }
    for (var i = 9; i < 16; i++) {
      int rnd = random.nextInt(10);
      noReferensi.add(rnd.toString());
    }
    
    super.initState();
  }

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

          SliverToBoxAdapter(
            child: Center(
              
              child: Text(DateFormat("dd MMMM yyyy HH:mm WIB", "id_ID").format(DateTime.now()), style: const TextStyle(color: UsedColor.primaryGrey, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
            )
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 20,)
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),

              child: Image.asset('assets/setorTunaiImage.png'),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 296,
              width: 349,
              decoration: BoxDecoration(
                color: UsedColor.primaryGreen,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text('Nomor Virtual Kamu (1122 + No. HP)', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      const Text('1122 0852 8745 3452', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/Icon/copyIcon.png', width: 18,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text('Kode Transaksi Kamu', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Text(kodeTransaksi[0]+ kodeTransaksi[1] + kodeTransaksi[2] + kodeTransaksi[3] + kodeTransaksi[4] + kodeTransaksi[5] + kodeTransaksi[6], style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),

                  const SizedBox(height: 20,),
                  const Text('Batas Waktu', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Text(DateFormat("dd MMMM yyyy HH:mm WIB", "id_ID").format(DateTime.now().add(Duration(hours: 1))), style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),

                  const SizedBox(height: 20,),
                  const Text('No. Referensi', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Text(noReferensi[0] + noReferensi[1] + noReferensi[2] + noReferensi[3] + noReferensi[4] + noReferensi[5] + noReferensi[6] + noReferensi[7] + noReferensi[8] + noReferensi[9] + noReferensi[10] + noReferensi[11] + noReferensi[12] + noReferensi[13] + noReferensi[14] + noReferensi[15], style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700)),


                ],
              ),

              
            )
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
              int count = 0;
              Navigator.popUntil(context, (route) {return count++ == 2;});
              HapticFeedback.heavyImpact();
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text('Kembali ke Home', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),
              ),
            ),
          ),
        )
      ),
    );
  }
}
