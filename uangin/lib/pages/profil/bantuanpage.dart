import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';

class BantuanPage extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  final String nama;
  const BantuanPage({super.key, required this.user, required this.nama});

  @override
  State<BantuanPage> createState() => _BantuanPageState();
}



int tap = 0;
int count = 0;

class _BantuanPageState extends State<BantuanPage> {
  List<Map<String, String>> faq = [
    {
      "pertanyaan": "Apa itu Uangin",
      "jawaban": "Uangin merupakan aplikasi bank digital yang terintegrasi dengan Sekuritas milik Uangin sehingga kamu bisa menabung sekaligus membeli instrumen investasi pilihan mu disini."
    },
    {
      "pertanyaan": "Bagaimana cara transfer uang dari bank lain ke Uangin?",
      "jawaban":
          "1. Pilih Transfer antar Bank\n2. Pilih Uangin di daftar Bank Penerima, masukkan kode Uangin (501)\n3. Lanjut, masukkan nomor rekening Uangin kamu\n4. Masukkan nominal yang diinginkan\n5. Lanjutkan proses sampai selesai\n"
    },
    {
      "pertanyaan": "Siapa saja yang bisa jadi pegguna aplikasi Uangin",
      "jawaban":
          "Warga Negara Indonesia berusia minimal 17 tahun, mempunyai E-KTP, dan tidak memiliki kewajiban perpajakan di negara lain."
    },
    {
      "pertanyaan":
          "Apa saja dokumen yag perlu disiapkan untuk membuka rekening Uangin?",
      "jawaban":
          "Gak ribet, kamu cuma perlu siapin:\n-E-KTP\n-NPWP (opsional)\n\nPastikan kamu ada di ruangan terang karena tim Uangin akan melakukan video call untuk verifikasi datamu"
    },
    {
      "pertanyaan": "Apakah saya membuatkan rekening Uangin untuk orang lain?",
      "jawaban":
          "Sayangnya, tidak. Kamu tidak bisa bisa membuat akun perwakilan untuk anak atau orang lain yang masih belum memiliki E-KTP. Tiap Nomor Induk kependudukan (NIK) hanya bisa digunakan untuk satu akun."
    },
    {
      "pertanyaan":
          "E-KTP saya belum jadi, apakah masih bisa punya rekening Uangin?",
      "jawaban":
          "Tidak bisa, saat ini E-KTP adalah dokumen utama untuk verifikasi rekening Uangin.\nKalau E-KTP kamu sudah jadi, jangan lupa utuk segera buka rekening Uangin ya"
    },
    {
      "pertanyaan": "Apa itu Kode referral/kode voucher?",
      "jawaban":
          "Kode referral adalah kode unik yang dibuat khusus untukmu. Kode ini bisa kamu bagikan pada teman-temanmu yang ingin kamu referensikan untuk buka rekening Uangin\nKode voucher adalah kode dari Uangin yang bisa kamu gunakan jika ada penawaran spesial/promosi saat melakukan pembukaan rekening Uangin"
    },
    {
      "pertanyaan": "Apa fungsi password di Uangin",
      "jawaban":
          "Password berfungsi sebagai kunci untuk masuk ke aplikasi, terutam saat kamu tidak mengaktifkan biometrik."
    }
  ];
  String namaNasabah = "null";
  @override
  void initState() {
    setState(() {
      namaNasabah = widget.nama;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0XFFF5F5F5)),
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,
                      child: Text(
                        "Hai $namaNasabah, ada yang bisa kami bantu?",
                        style: const TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.clip,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Punya pertanyaan? Perlu jawaban? Kami ada buat kamu.",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 16,
                            overflow: TextOverflow.clip,
                            color: Colors.grey.shade400),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 40, right: 40, bottom: 20),
                          child: Column(
                            children: const [
                              Icon(Icons.email),
                              SizedBox(
                                height: 5,
                              ),
                              Text("E-mail", style: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 13,
                                overflow: TextOverflow.clip,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(color: Colors.grey.shade300),
                                right:
                                    BorderSide(color: Colors.grey.shade300))),
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 35, right: 35, bottom: 20),
                          child: Column(
                            children: [
                              const Icon(Icons.phone),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text("Telepon"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 40, right: 40, bottom: 20),
                          child: Column(
                            children: const [
                              Icon(Icons.chat),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Chat"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //PERTANYAAN
              Container(
                child: Column(
                  children: const [
                    SizedBox(
                      width: double.infinity,
                      child:  Text(
                        "Pertanyaan Populer",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans",
                          color: UsedColor.primaryGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               const SizedBox(
                height: 5,
              ),
              SizedBox(
                // height: 440,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: faq.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: (() {
                          setState(() {
                            if (tap == 0) {
                              tap = 1;
                            } else if (tap == 1) {
                              tap = 0;
                            }
                            count = index;
                           
                          });
                        }),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 20, top: 20),
                          decoration: BoxDecoration(
                            border: tap == 0
                                ? Border(
                                    bottom:
                                        BorderSide(color: Colors.grey.shade300))
                                : const Border(
                                    bottom:
                                        BorderSide(color: Colors.transparent)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 300,
                                child: Text(
                                  faq[index]['pertanyaan'].toString(),
                                  style: TextStyle(
                                      color: tap == 1 && count == index
                                          ? const Color(0XFF5ADFB2)
                                          : Colors.black,
                                      overflow: TextOverflow.clip,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              tap == 0
                                  ? const Icon(Icons.arrow_drop_down)
                                  : Icon(
                                      Icons.arrow_drop_up,
                                      color: tap == 1 && count == index
                                          ? const Color(0XFF5ADFB2)
                                          : Colors.black,
                                    )
                            ],
                          ),
                        ),
                      ),
                      tap == 1 && count == index
                          ? Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade300)),
                              ),

                              // color: Colors.red,
                              child: Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  width: double.infinity,
                                  child: Text(
                                    faq[index]['jawaban'].toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "OpenSans"),
                                  )),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0XFF5ADFB2),
                ),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const[
                            Text(
                              "Bantuan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans",
                                  fontSize: 15,
                                  ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Punya pertanyaan yang belum terjawab?",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                
                                fontSize: 12,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Coba tanya Help Centre kami",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                
                                fontSize: 12,
                                fontFamily: "OpenSans",
                              ),
                            )
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ]),
                ),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
