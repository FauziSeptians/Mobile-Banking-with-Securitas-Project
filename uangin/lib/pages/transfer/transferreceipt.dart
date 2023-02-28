import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:math';
// import 'dart:html';
import 'package:http/http.dart';

import 'package:uangin/pages/transfer/transferpage.dart';

class TfReceiptPage extends StatefulWidget {
  const TfReceiptPage({super.key, required this.catatan, required this.contact, required this.nominal, required this.user, required this.kategori});

  final AsyncSnapshot<User?> user;
  final String? catatan;
  final Person contact;
  final String nominal;
  final String kategori;

  @override
  State<TfReceiptPage> createState() => _TfReceiptPageState();
}

class _TfReceiptPageState extends State<TfReceiptPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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

    if (widget.contact.bank == 'Uangin') {
      sendNotif();
      tambahSaldo();
      addHistory();
      updateKategori();
    }
    kurangSaldo();
    
    super.initState();
  }

  void updateKategori() async {
   
    firestore.collection('portofolio').doc(widget.user.data!.email).get().then((value) {
      dev.log(value.get('kategori').toString());
    
      List<dynamic> temp = value.get('kategori') as List<dynamic>;
      // temp.add(value.get('kategori')[0]);
      for (var i = 0; i < temp.length; i++) {
        if (temp[i]['kategori'] == widget.kategori) {
          temp[i]['terpakai'] = temp[i]['terpakai'] + int.parse(widget.nominal.replaceAll('.', ''));
        }
      }
      print(temp);
      firestore.collection('portofolio').doc('julsalim14@gmail.com').update({
        'kategori': temp
      });

    });
  }

  void kurangSaldo() async {
    int? saldo;
    var saldoAkhir = widget.nominal.replaceAll('.', '');
    saldoAkhir = saldoAkhir.replaceAll(',', '.');
    int saldoTransfer = double.parse(saldoAkhir).toInt();
    await firestore.collection("users").doc(widget.user.data!.email).get().then((value) => saldo = value.data()!["balance"].toInt());

    saldoTransfer = saldo! - saldoTransfer;
    await firestore.collection("users").doc(widget.user.data!.email).update({"balance": saldoTransfer});
    
  }

  void tambahSaldo() async{
    int? saldo;
    String saldoAkhir = widget.nominal.replaceAll('.', '');
    saldoAkhir = saldoAkhir.replaceAll(',', '.');
    int saldoTransfer = double.parse(saldoAkhir).toInt();
    print(saldoAkhir);
    await firestore.collection("users").doc(widget.contact.email).get().then((value) => saldo = value.data()!["balance"].toInt());

    saldoTransfer = saldo! + saldoTransfer;
    await firestore.collection("users").doc(widget.contact.email).update({"balance": saldoTransfer});
  }

  void sendNotif() async {
    var token;
    await firestore.collection("users").doc(widget.contact.email).get().then((value) => token = value.data()!["token"]);

    var namaPengirim;
    await firestore.collection("users").doc(widget.user.data!.email).get().then((value) {
      namaPengirim = '${value.data()!["firstName"]} ${value.data()!["lastName"]}';});
        
    var body = {
      "to": token,
      "priority": "high",
      "notification": {
        "title": "Dana Masuk dari $namaPengirim",
        "body": "Anda menerima dana sebesar Rp ${widget.nominal} dari $namaPengirim"
      }
    };

    var response = await post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader :'key=AAAAZhch8XA:APA91bFZNQBInWcjwlHAXItp5pUg2tAdwKpitMDxvBQMmFajW_H7Fa34JeT3CQtUZfXk4nRHXbIQWi-4ytNWAgHeT6qMIgfElBVEnlA169G-XFFtW6EQYtbRkAIXGJr24wQEp-Cexlup'
        },
            body: jsonEncode(body));
    
    print(response.body);
  }

  void addHistory () async{

    var namaPengirim;
    await firestore.collection("users").doc(widget.user.data!.email).get().then((value) {
      namaPengirim = '${value.data()!["firstName"]} ${value.data()!["lastName"]}';});

    String saldoAkhir = widget.nominal.replaceAll('.', '');
    saldoAkhir = saldoAkhir.replaceAll(',', '.');
    int saldoTransfer = double.parse(saldoAkhir).toInt();
    // await firestore.collection("mutasiRekening").doc(widget.user.data!.email).collection("dataMutasi").add({
    //   "bank" : widget.contact.bank,
    //   "biaya": saldoTransfer,
    //   "mode": "pengeluaran",
    //   "tanggal": DateFormat('yyyy-MM-dd HH:mm:SS').format(DateTime.now()),
    //   "tujuan": widget.contact.nama,
    //   "validasi": "Mutasi"
    // });

    // List<dynamic> temp = 
    //   [
    //     {
    //       "bank" : widget.contact.bank,
    //       "biaya": saldoTransfer,
    //       "mode": "pengeluaran",
    //       "tanggal": DateFormat('yyyy-MM-dd HH:mm:SS').format(DateTime.now()),
    //       "tujuan": widget.contact.nama,
    //       "validasi": "Mutasi"
    //     }
    //   ];

    // firestore.collection('mutasiRekening').doc(widget.user.data!.email).update({
    //   'dataMutasi': temp
    // });
    //add to collection in doc in collection
    // await firestore.collection("mutasiRekening").doc(widget.user.data!.email).collection("dataMutasi").add({
    //   "bank" : widget.contact.bank,
    //   "biaya": saldoTransfer,
    //   "mode": "pemasukan",
    //   "tanggal": DateFormat('yyyy-MM-dd HH:mm:SS').format(DateTime.now()),
    //   "tujuan": widget.contact.nama,
    //   "validasi": "Mutasi"
    // });
    firestore.collection('mutasiRekening').doc(widget.user.data!.email).get().then((value) {
      // dev.log(value.get('dataMutasi').toString());
      
    //   // firestore.collection('daftarRekening').doc('julsalim14@gmail.com').collection('daftarRekening3').add(value.get('daftarRekening3') as Map<String, dynamic>);

    //   //update firestore array
      List<dynamic> temp = value.get('dataMutasi') as List<dynamic>;
      temp.add({
          "bank" : widget.contact.bank,
          "biaya": saldoTransfer,
          "mode": "pengeluaran",
          "tanggal": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          "tujuan": widget.contact.nama,
          "validasi": "Mutasi"
        });
      // print(temp);
      firestore.collection('mutasiRekening').doc(widget.user.data!.email).update({
        'dataMutasi': temp
      });



    });

    firestore.collection('mutasiRekening').doc(widget.contact.email).get().then((value) {
      // dev.log(value.get('dataMutasi').toString());
      
      List<dynamic> temp = value.get('dataMutasi') as List<dynamic>;
      temp.add({
          "bank" : widget.contact.bank,
          "biaya": saldoTransfer,
          "mode": "pemasukan",
          "tanggal": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          "tujuan": namaPengirim,
          "validasi": "Mutasi"
        });
      // print(temp);
      firestore.collection('mutasiRekening').doc(widget.contact.email).update({
        'dataMutasi': temp
      });
    });

    firestore.collection('pengeluaran').doc(widget.user.data!.email).get().then((value) {
      dev.log(value.get('Februari').toString());
      
      Map<dynamic, dynamic> temp = value.get('Februari') as Map<dynamic, dynamic>;
      temp['pengeluaran'] = temp['pengeluaran'] + saldoTransfer;
      dev.log(temp.toString());

      firestore.collection('pengeluaran').doc(widget.user.data!.email).update({
        'Februari': temp
      });
    });

    firestore.collection('pengeluaran').doc(widget.contact.email).get().then((value) {
      dev.log(value.get('Februari').toString());
      
      Map<dynamic, dynamic> temp = value.get('Februari') as Map<dynamic, dynamic>;
      temp['pemasukan'] = temp['pemasukan'] + saldoTransfer;
      dev.log(temp.toString());

      firestore.collection('pengeluaran').doc(widget.contact.email).update({
        'Februari': temp
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgTransfer.png'),
            fit: BoxFit.cover,
            opacity: 0.3
          )
        ),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 5,
              pinned: true,
              shadowColor: Colors.transparent,
            ),
            
            const SliverToBoxAdapter(
              child: SizedBox(height: 30,)
            ),

            const SliverToBoxAdapter(
              child: Center(
                
                child: Text('Transaksi Berhasil', style: TextStyle(color: UsedColor.primaryGreen, fontSize: 25, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),
              )
            ),

            // SliverToBoxAdapter(
            //   child: Center(
                
            //     child: Text(DateFormat("dd MMMM yyyy HH:mm WIB", "id_ID").format(DateTime.now()), style: const TextStyle(color: UsedColor.primaryGrey, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
            //   )
            // ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 20,)
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 75),

                child: Image.asset('assets/setorTunaiImage.png',),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 476,
                width: 349,
                decoration: BoxDecoration(
                  color: UsedColor.primaryGreen,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text('Nominal Transfer', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    Text('Rp ${widget.nominal}', style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),
                    const SizedBox(height: 20,),
                    const Text('Rekening Tujuan', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    Text(widget.contact.nama!, style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),
                    Text('${widget.contact.bank} - ${widget.contact.norek!}', style: const TextStyle(color: Colors.white, fontSize: 13, fontFamily: "OpenSans", fontWeight: FontWeight.w600),),

                    const SizedBox(height: 20,),
                    const Text('Waktu Transaksi', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    Text(DateFormat("dd MMMM yyyy HH:mm WIB", "id_ID").format(DateTime.now()), style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700),),

                    const SizedBox(height: 20,),
                    const Text('Tipe Transaksi', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    const Text('Transfer Online', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700)),

                    const SizedBox(height: 20,),
                    const Text('No. Referensi', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    Text(noReferensi[0] + noReferensi[1] + noReferensi[2] + noReferensi[3] + noReferensi[4] + noReferensi[5] + noReferensi[6] + noReferensi[7] + noReferensi[8] + noReferensi[9] + noReferensi[10] + noReferensi[11] + noReferensi[12] + noReferensi[13] + noReferensi[14] + noReferensi[15], style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700)),

                    const SizedBox(height: 20,),
                    const Text('Catatan', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "OpenSans", fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    Text((widget.catatan == '') ? '-' : widget.catatan!, style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "OpenSans", fontWeight: FontWeight.w700)),

                  ],
                ),

                
              )
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),

            SliverToBoxAdapter(
              child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
        
        child: Material(
          color: UsedColor.primaryGreen,
          borderRadius: BorderRadius.circular(15),

          child: InkWell(
            onTap: () {
              int count = 0;
              Navigator.popUntil(context, (route) {return count++ == 4;});
              // Navigator.pop(context, true);
              
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
            )
            
          ],
        ),
      ),
      
    );
  }
}