
import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';


class SyaratDanKetentuan extends StatefulWidget {
  const SyaratDanKetentuan({super.key});

  @override
  State<SyaratDanKetentuan> createState() => _SyaratDanKetentuanState();
}


class _SyaratDanKetentuanState extends State<SyaratDanKetentuan> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
             Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0XFFF5F5F5)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
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
                    const SizedBox(
                      width: 60,
                    ),
                    const Text(
                      "Syarat dan Ketentuan",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
                    ),
                  ],            
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                // color: Colors.red,
                width: 1000,
                height: MediaQuery.of(context).size.height - 106,
                child: ListView(
                  
                  children: [
                    Container(
                      // color: Colors.Uangine,
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      child: const Text("SYARAT DAN KETENTUAN PENGGUNAAN UANGIN PT BANK DWIDAYA BERSATU PADU (“Syarat dan Ketentuan”)",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.Uangine,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: const Text("A. DEFINISI",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 106, 106, 106)
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("1.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Uangin adalah aplikasi mobile/layanan perbankan elektronik PT BANK DIGITAL BCA (“Uangin”) yang dapat diunduh (download) oleh Nasabah dari media distribusi aplikasi/software resmi yang ditunjuk Uangin. Uangin dapat diakses secara langsung oleh Nasabah melalui gawai (gadget).",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("2.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("PIN (Personal Identification Number) adalah nomor identifikasi pribadi bagi Nasabah yang menggunakan Uangin. Nasabah dapat menggunakan PIN untuk melakukan transaksi finansial pada Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("3.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Face Recognition adalah metode verifikasi dengan menggunakan capturewajah Nasabah sebagai proteksi berjenjang saat Nasabah melakukan pembukaan rekening melalui Uangin, reset PIN dan/atau Password, dan untuk keperluan lainnya sesuai dengan ketentuan yang berlaku di Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("4.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Password adalah kombinasi deretan huruf dan angka (alfanumerik) yang dibuat Nasabah pada saat pembukaan rekening Uangin dan digunakan sebagai salah satu kode keamanan untuk mengakses Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("5.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Kode Transaksi adalah suatu kode yang dihasilkan oleh Uangin untuk melakukan transaksi tarik tunai di ATM PT Bank Dwidaya Bersatu Padu tanpa menggunakan kartu.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("6.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("SMS (Short Message Service) adalah layanan penyampaian pesan singkat dalam bentuk teks dan/atau angka yang dapat diterima dan/atau dikirimkan melalui handphone.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("7.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("OTP (One Time Password) adalah kode yang diterima oleh Nasabah sebagai sarana verifikasi identitas diri Nasabah melalui SMS ke nomor handphone yang digunakan saat proses registrasi, login, dan perubahan nomor handphone. OTP hanya berlaku sekali dalam jangka waktu tertentu.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("8.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Operator Seluler adalah perusahaan yang menyediakan layanan jaringan telepon seluler.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("9.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah adalah pemilik rekening perorangan dalam bentuk tabungan di Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("10.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Login Fingerprint (One Touch) atau Face ID adalah suatu metode yang dapat digunakan Nasabah yang menggunakan gawai (gadget) yang memiliki fitur biometric scanner untuk mengakses Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("11.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Quick Response Code atau QR Code adalah kode dua dimensi yang terdiri atas penanda tiga pola persegi pada sudut kiri bawah, sudut kiri atas, dan sudut kanan atas, memiliki modul hitam berupa persegi titik atau piksel,dan memiliki kemampuan menyimpan data alfanumerik, karakter, dan simbol.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("12.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("QR Code untuk Pembayaran atau QR Code Pembayaran adalah QR Code yang digunakan untuk memfasilitasi transaksi pembayaran nirsentuh melalui pemindaian.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("13.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Standar Nasional QR Code Pembayaran (Quick Response Code Indonesian Standard) atau QRIS adalah standar QR Code Pembayaran yang ditetapkan oleh Bank Indonesia untuk digunakan dalam memfasilitasi transaksi pembayaran di Negara Kesatuan Republik Indonesia.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("14.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Transaksi QRIS adalah transaksi pembayaran yang difasilitasi dengan QR Code Pembayaran berdasarkan QRIS.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("15.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("UanginAccount adalah rekening utama dalam bentuk tabungan yang dapat dibuka oleh Nasabah secara mandiri melalui aplikasi Uangin, setelah mendapatkan persetujuan dari Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("16.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("UanginSaving adalah rekening tambahan dalam bentuk tabungan di mana Nasabah dapat melakukan transfer dana dari dan ke rekening utama untuk tujuan tertentu dan tanpa terikat jangka waktu tertentu.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("17.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Dormant adalah kondisi rekening simpanan Nasabah yang tidak memiliki aktivitas transaksi (tidak termasuk pengkreditan bunga simpanan, pendebetan pajak atas bunga simpanan, meterai, dan biaya-biaya) selama 6(enam) bulan secara berturut-turut atau dalam periode tertentu yang ditentukan Uangin dari waktu kewaktu yang akan diberitahukan oleh Uangin dalam bentuk dan melalui media/sarana yang tersedia pada Uangin sesuai ketentuan hukum yang berlaku.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("18",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Kartu ATM/Debit adalah kartu yang diterbitkan oleh Uangin, baik dalam bentuk kartu secara fisik maupun dalam bentuk kartu virtual, atas permohonan nasabah dan terhubung dengan UanginAccount dan/atau rekening lainnya yang ditetapkan oleh Uangin dari waktu ke waktu, yang mempunyai fungsi sebagai alat pembayaran dan/atau fungsi lainnya yang ditentukan oleh Uangin, baik melalui ATM dan/atau sarana lain yang ditentukan oleh Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("19.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Mitra adalah suatu badan hukum atau badan usaha atau entitas lainnya yang bekerja sama dengan Uangin, yang menjalankan usahanya dengan memanfaatkan platform teknologi informasi untuk menawarkan dan/atau menjual barang dan/atau jasa dari Mitra dan/atau Merchant.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("20",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Merchant adalah orang-perorangan atau badan hukum atau badan usaha atau entitas lainnya, yang menawarkan dan/atau menjual suatu barang, baik yang berwujud maupun yang tidak berwujud, dan/atau jasa.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        // B. KETENTUAN UMUM
                        Container(
                          // color: Colors.Uangine,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: const Text("B. KETENTUAN UMUM",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 106, 106, 106)
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("1.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah merupakan perorangan dan Warga Negara Indonesia (“WNI”) yang telah memiliki Kartu Tanda Penduduk elektronik (KTP-el) sesuai ketentuan hukum yang berlaku di Negara Kesatuan Republik Indonesia. Untuk dapat menggunakan Uangin, Nasabah harus memiliki SIM Card Operator Seluler.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("2.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah dapat mengunduh E-statement bulan sebelumnya pada minggu pertama bulan berikutnya melalui Uangin. E-statement merupakan media/sarana penyampaian informasi atas portfolio dan mutasi rekening nasabah.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("3.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah wajib melakukan perubahan data secara berkala atau apabila terdapat perubahan data Nasabah melalui Uangin. Perubahan data Nasabah tidak dapat dilakukan sepanjang rekening Nasabah berstatus Dormant, kecuali rekening tersebut telah dilakukan pengaktifan kembali.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("4.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah dengan ini memahami segala risiko yang mungkin timbul akibat kelalaian Nasabah memperbaharui data Nasabah, termasuk namun tidak terbatas pada risiko kerugian baik finansial maupun nonfinansial yang mungkin terjadi dan dengan ini membebaskan Uangin dari segala gugatan/tuntutan dari pihak manapun.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("5.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Dalam hal Nasabah di kemudian hari akan melakukan perubahan terhadap persetujuan kepada Uangin terkait pemberian informasi dan/atau data Nasabah kepada Mitra atau pihak lain yang bekerja sama dengan Uangin dalam rangka kegiatan promosi atau untuk tujuan komersial lainnya dan/atau terkait penawaran produk/layanan Uangin dan/atau produk/layanan dari Mitra atau pihak lain yang bekerja sama dengan Uangin, maka Nasabah dapat menghubungi nomor haloUangin 1500668 untuk mengubah pemberian persetujuan Nasabah tersebut dan/atau melakukan perubahan pilihan sarana komunikasi pribadi yang akan digunakan untuk penawaran produk/layanan tersebut.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("6.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah tidak dapat melakukan transaksi pengiriman atau penerimaan uang dalam bentuk valuta asing melalui Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("7.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Selama Nasabah masih memiliki kewajiban kepada Uangin, baik berupa pinjaman uang, bunga, provisi, meterai, atau biaya-biaya atau kewajiban yang timbul berdasarkan apa pun juga, Nasabah dengan ini memberikan kuasa dan persetujuan kepada Uangin untuk mencairkan deposito dan/atau simpanan Nasabah lainnya yang ada pada Uangin dan mendebit rekening (-rekening) Nasabah yang ada pada Uangin untuk pembayaran kewajiban Nasabah kepada Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("8.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Uangin berhak dan sepanjang perlu, dengan ini diberi kuasa oleh Nasabah untuk melakukan pemblokiran terhadap sebagian atau seluruh dana Nasabah pada rekening UanginAccount, mencairkan deposito dan/atau simpanan Nasabah lainnya pada Uangin dan/atau mendebit UanginAccount dan/atau rekening (- rekening) Nasabah pada Uangin dan menggunakannya untuk pembayaran kembali atas setiap jumlah uang yang setiap waktu terutang kepada Uangin. Segala akibat yang timbul dari pencairan deposito dan/atau simpanan Nasabah pada Uangin dan/atau pendebitan UanginAccount dan/atau rekening-rekening Nasabah pada Uangin berdasarkan kuasa dari Nasabah tersebut menjadi tanggung jawab Nasabah sepenuhnya.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("9.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Dalam hal terdapat kendala transaksi yang menyebabkan kesalahan pendebitan dan/atau penkreditan terhadap rekening Nasabah. Nasabah dengan ini memberikan pesetujuan dan kuasa kepada Uangin untuk melakukan koreksi atas saldo pada rekening Nasabah termasuk namun tidak terbatas pada melakukan pendebitan terhadap rekening UanginAccount dan/atau rekening-rekening Nasabah pada Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("10.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah harus menghubungi Operator Seluler yang bersangkutan untuk penanganan masalah yang berkaitan dengan SIM Card, jaringan Operator Seluler, jaringan internet pada handphone, tagihan penggunaan dari Operator Seluler, biaya SMS, dan value added service Operator Seluler.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("11.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Data Nasabah pada Uangin akan disimpan Uangin sesuai ketentuan retensi yang berlaku di Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("12.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah dengan ini menyatakan bahwa semua catatan, hasil print out, rekaman, sarana komunikasi, atau bukti lainnya dalam bentuk apa pun yang ada di Uangin saat proses verifikasi dan atas transaksi perbankan elektronik yang dilakukan oleh Nasabah merupakan alat bukti yang sah dan mengikat Nasabah, kecuali dapat dibuktikan sebaliknya. Data terkait transaksi perbankan elektronik yang dilakukan oleh Nasabah akan disimpan Uangin sesuai ketentuan yang berlaku.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("13.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Apabila Nasabah meninggal dunia, Uangin berhak meminta dokumen-dokumen keahliwarisan yang dipersyaratkan oleh Uangin, termasuk namun tidak terbatas pada akta/surat kematian, akta/surat keterangan hak waris, akta wasiat, KTP/identitas ahli waris dan bukti-bukti lain yang diperlukan untuk mengetahui ahli waris yang berhak, sebagai dasar pencairan saldo rekening yang ada pada Uangin kepada ahli waris yang ditentukan dalam dokumen keahliwarisan. Dengan melakukan pencairan saldo rekening yang ada pada Uangin milik Nasabah yang telah meninggal dunia kepada ahli waris atau kuasanya yang berhak sesuai dengan dokumen keahliwarisan, maka Uangin dibebaskan dari seluruh tanggung jawab berkaitan dengan UanginAccount milik Nasabah.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("14.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah dengan ini menyatakan bahwa spesimen tanda tangan Nasabah adalah tanda tangan sebagaimana tercantum pada KTP-e Nasabah yang direkam (capture) dan diunggah (upload) oleh Nasabah pada sistem/platform/aplikasi Uangin milik Uangin (“Spesimen”).",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("15.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Dalam rangka pemeliharaan dan/atau pembaharuan sistem untuk menjaga dan/atau meningkatan kualitas layanan penggunaan Uangin, Uangin berhak untuk menghentikan layanan penggunaan Uangin untuk sementara waktu dengan pemberitahuan terlebih dahulu kepada Nasabah dan Nasabah memahami segala akibat dari penghentian layanan tersebut, termasuk namun tidak terbatas pada akibat tidak dapat dilakukannya transaksi perbankan melalui Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("16.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Uangin berhak untuk mengubah ketentuan-ketentuan terkait UanginAccount, UanginSaving, UanginGether, UanginInvest, dan UanginDeposit yang akan diberitahukan oleh Uangin dalam bentuk dan melalui media/sarana yang tersedia pada Uangin sesuai ketentuan hukum yang berlaku.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          // color: Colors.Uangine,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: const Text("C. KETENTUAN PENGGUNAAN Uangin",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 106, 106, 106)
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("1.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah dapat menggunakan Uangin untuk mendapatkan informasi mengenai Uangin dan/atau melakukan transaksi perbankan yang telah disediakan oleh Uangin yang akan diberitahukan oleh Uangin dalam bentuk dan melalui media/sarana yang tersedia pada Uangin sesuai ketentuan hukum yang berlaku.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("2.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Perintah/instruksi yang diberikan oleh Nasabah melalui Uangin hanya dapat dilakukan dengan menggunakan nomor handphone Nasabah yang telah terdaftar.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("3.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah wajib memastikan ketersediaan dana pada rekening Nasabah sebelum melakukan transaksi melalui Uangin. Nasabah harus mengisi semua data yang dibutuhkan untuk setiap transaksi secara benar dan lengkap.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("4.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Sebagai tanda persetujuan, Nasabah wajib memasukkan PIN untuk melakukan transaksi finansial dan transaksi lainnya yang ditentukan oleh Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("5.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah wajib melakukan permintaan Kode Transaksi melalui Uangin sebelum Nasabah melakukan transaksi tarik tunai tanpa kartu di ATM BCA. Kode Transaksi tersebut hanya dapat digunakan oleh Nasabah selama jangka waktu tertentu yang akan diberitahukan oleh Uangin melalui Uangin. Segala akibat yang timbul karena penggunaan Kode Transaksi menjadi tanggung jawab Nasabah sepenuhnya. Nasabah dengan ini memberikan persetujuan kepada Uangin untuk memberikan data dan/atau informasi termasuk namun tidak terbatas pada data pribadi Nasabah kepada BCA dalam rangka pemenuhan ketentuan hukum yang berlaku antara lain ketentuan hukum yang mengatur mengenai anti pencucian uang dan pencegahan pendanaan terorisme.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("6.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Setiap instruksi dari Nasabah yang tersimpan pada sistem dan/atau pusat data Uangin merupakan data yang benar dan mengikat Nasabah, serta merupakan bukti yang sah atas instruksi dari Nasabah kepada Uangin untuk melakukan transaksi yang dimaksud, kecuali Nasabah dapat membuktikan sebaliknya.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("7.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Uangin menerima dan menjalankan setiap instruksi dari Nasabah sebagai instruksi yang sah berdasarkan penggunaan nomor handphone dan PIN dan/atau Kode Transaksi. Uangin tidak mempunyai kewajiban untuk meneliti atau menyelidiki keaslian maupun keabsahan atau kewenangan pengguna nomor handphone dan PIN dan/atau Kode Transaksi atau menilai maupun membuktikan ketepatan maupun kelengkapan instruksi dimaksud. Oleh karena itu, instruksi tersebut adalah sah dan mengikat Nasabah secara hukum, kecuali Nasabah dapat membuktikan sebaliknya.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("8.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Segala transaksi yang telah diinstruksikan oleh Nasabah kepada Uangin tidak dapat dibatalkan dengan alasan apapun.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("9.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah wajib melakukan peningkatan versi (upgrade) Uangin atas permintaan Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("10.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Kelalaian Nasabah dalam melakukan peningkatan versi (upgrade) Uangin mengakibatkan Nasabah tidak dapat menggunakan Uangin atau hanya dapat mengakses fitur tertentu pada Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("11.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Untuk setiap instruksi dari Nasabah atas transaksi finansial yang berhasil dilakukan oleh Uangin, Nasabah akan mendapatkan bukti transaksi yang akan tersimpan di aplikasi Uangin sebagai bukti bahwa transaksi tersebut telah dijalankan oleh Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("12.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Uangin berhak untuk tidak melaksanakan instruksi dari Nasabah, jika saldo rekening Nasabah di Uangin tidak mencukupi untuk melakukan transaksi yang bersangkutan atau rekening Nasabah diblokir.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("13.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah wajib dan bertanggung jawab untuk memastikan ketepatan dan kelengkapan instruksi transaksi melalui Uangin yang dikirim kepada Uangin. Uangin tidak bertanggung jawab terhadap segala akibat apapun yang timbul karena ketidaklengkapan, ketidakjelasan data, atau ketidaktepatan instruksi dari Nasabah.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("14.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Catatan, tape/cartridge, hasil print out komputer, Salinan, atau bentuk penyimpanan informasi atau data lain yang terdapat pada Uangin merupakan alat bukti yang sah dan mengikat atas instruksi dari Nasabah yang dijalankan oleh Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("15.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Nasabah menyetujui dan mengakui keabsahan, kebenaran, atau keaslian bukti instruksi dan komunikasi yang dikirim secara elektronik oleh Uangin, termasuk dokumen dalam bentuk catatan komputer atau bukti transaksi yang dijalankan oleh Uangin, salinan, atau bentuk penyimpanan informasi yang lain yang terdapat pada Uangin. Semua sarana dan/atau dokumen tersebut merupakan satu-satunya alat bukti yang sah dan mengikat atas transaksi-transaksi perbankan yang dilakukan oleh Nasabah melalui Uangin, kecuali Nasabah dapat membuktikan sebaliknya.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("16.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Dengan melakukan transaksi melalui Uangin, Nasabah mengakui semua komunikasi dan instruksi dari Nasabah yang diterima Uangin akan diperlakukan sebagai alat bukti yang sah meskipun dokumen tidak dibuat secara tertulis dan/atau dokumen tidak ditandatangani oleh Nasabah dan Uangin.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("17.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Uangin berhak untuk menentukan dan mengubah besarnya limit untuk suatu transaksi yang akan diberitahukan oleh Uangin dalam bentuk dan melalui media/sarana yang tersedia pada Uangin sesuai dengan ketentuan hukum yang berlaku.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("18.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Operator Seluler berhak mengenakan biaya, antara lain namun tidak terbatas untuk biaya pengiriman SMS kepada Nasabah untuk setiap transaksi, baik yang berhasil maupun yang tidak berhasil dilakukan.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          // color: Colors.amberAccent,
                          width: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("19.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 320,
                                child: Text("Saat Nasabah melakukan transaksi QRIS, Nasabah wajib memastikan kebenaran nama merchant dan nominal transaksi QRIS. Nasabah bertanggung jawab sepenuhnya atas segala akibat yang timbul sehubungan dengan transaksi QRIS yang dilakukan Nasabah, termasuk namun tidak terbatas kerugian yang timbul karena kelalaian Nasabah dalam memastikan kebenaran nama merchant dan nominal transaksi pembayaran.",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    color: UsedColor.primaryGrey
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                      
                      ],
                    ),


                  ],
                ),
              ),
              
              
            ],
          ),
        ),
      );
  }
}