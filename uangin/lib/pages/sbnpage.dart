import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';


class SBNPelajari extends StatefulWidget {
  const SBNPelajari({Key? key}) : super(key: key);

  @override
  State<SBNPelajari> createState() => _SBNWidgetState();
}

class _SBNWidgetState extends State<SBNPelajari> {
  List<List<String>> keuntunganSBN = [
    ["assets/Icon/SBN1Icon.png", "100% Aman", "Seorang investor tidak perlu mengkhawatirkan fluktuasi pasar karena produk investasi ini aman karena tidak bisa kamu perdagangkan di pasar sekunder sehingga tidak ada potensi capital loss atau kerugian."],
    ["assets/Icon/SBN2Icon.png", "Pajak Lebih Rendah", "Pajak dari produk SBN lebih rendah daripada pajak deposito. Produk SBN menetapkan pajak hanya 10 persen atas kupon yang kamu terima. Hal tersebut membuat penawaran SBN ini dapat memberikan imbal hasil yang lebih baik."],
    ["assets/Icon/SBN3Icon.png", "Imbal Hasil Menarik", "Investasi SBN juga menawarkan imbal hasil yang lebih menarik dari deposito karena pajak bunga deposito lebih tinggi daripada pajak bunga SBN. Hal ini membuat investor memperoleh keuntungan yang berlipat ganda."],
    ["assets/Icon/SBN4Icon.png", "Risiko Lebih Rendah", "Risiko investasi ini merujuk pada risiko yang relatif rendah karena pembayaran pokok dan kuponnya 100 persen mendapat jaminan negara. Selain itu, investasi ini hampir tidak memiliki risiko gagal bayar."],
    ["assets/Icon/SBN5Icon.png", "Kontribusi Negara", "Penerbitan SBN membuka peluang yang besar untuk kamu berkontribusi langsung dalam pembangunan negara dan peningkatan kesejahteraan masyarakat. Khususnya pemulihan perekonomian akibat pandemi Covid-19."],
  ];



  Widget sbndetail(int warna1, int warna2, String gambar, String judul1, String judul2, String konten) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(color: Color(warna1), borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(warna2),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: 344,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(children: [
                    Image.asset(
                      gambar,
                      width: 70,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          judul1,
                          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600, fontFamily: "OpenSans"),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          judul2,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              Container(
                // color: Colors.red,
                // alignment: Alignment.center,
                padding: const EdgeInsets.only(top:10, bottom: 10, left: 20, right: 20),
                width: 344,
                height: 150,
                child: Text(
                  konten,
                  // textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: "OpenSans", fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
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
                      'SBN',
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
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Apa itu SBN ?",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Color(0XFF5ADFB2),
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                      ),
                        
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "SBN adalah produk investasi yang diterbitkan dan dijamin oleh pemerintah Republik Indonesia untuk membiayai anggaran negara.",
                    style: TextStyle(color: Color(0XFF5D5D5D), fontFamily: "OpenSans", fontSize: 14),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Keuntungan membeli SBN",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Color(0XFF5ADFB2),
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                      ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                // controller: promoController,
                scrollDirection: Axis.horizontal,
                itemCount: keuntunganSBN.length,
                itemBuilder: ((context, index) => Container(
                      width: 305,
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff9D9D9D)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(keuntunganSBN[index][0], width: 50, height: 50,),
                              const SizedBox(width: 10,),
                              SizedBox(
                                width: 220,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(keuntunganSBN[index][1], style: const TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Color(0xff3D3D3D),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16
                                      ),),
                                    Text(keuntunganSBN[index][2], style: const TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Color(0xff3D3D3D),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12
                                      ),
                                      textAlign: TextAlign.justify,
                                      )
                                ],
                              ),
                              )
                            ],
                          )
                        ],
                      )
                    )),
                
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Jenis-Jenis Produk SBN",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Color(0XFF5ADFB2),
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                      ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              child: Column(
                children: [
                  sbndetail(
                      0XFF8962DB,
                      0XFF4F24AB,
                      "assets/Icon/Emiten/SUN_sbn.png",
                      "Surat Utang Negara",
                      "Savings Bond Ritel",
                      "\u2022 Tingkat imbal hasil : Mengambang dengan tingkat minimum\n\n \u2022 Waktu Pencarian : Dapat dicairkan lebih awal\n\n \u2022 Jangka waktu : 2 tahun\n\n \u2022 Minimal Pembelian Rp. 1.000.000"),
                  const SizedBox(
                    height: 15,
                  ),
                  sbndetail(
                      0XFF6DBFEE,
                      0XFF1E89C6,
                      "assets/Icon/Emiten/ST_sbn.png",
                      "Sukuk Tabungan",
                      "Surat Berharga Syariah Negara",
                      "\u2022 Tingkat imbal hasil : Mengambang dengan tingkat minimum\n\n \u2022 Waktu Pencarian : Dapat dicairkan lebih awal\n\n \u2022 Jangka waktu : 2 tahun\n\n \u2022Minimal Pembelian Rp. 1.000.000"),
                  const SizedBox(
                    height: 15,
                  ),
                  sbndetail(
                      0XFF77E2DC,
                      0XFF21D1C7,
                      "assets/Icon/Emiten/ORI_sbn.png",
                      "ORI",
                      "Obligasi Negara Ritel",
                      "\u2022 Tingkat imbal hasil : Tetap (fixed rate)\n\n \u2022 Waktu Pencarian : Sesuai jatuh tempo\n\n \u2022 Jangka waktu : 3 tahun\n\n \u2022 Minimal Pembelian Rp. 1.000.000"),
                  const SizedBox(
                    height: 15,
                  ),
                  sbndetail(
                      0Xff77DE94,
                      0Xff21D152,
                      "assets/Icon/Emiten/SR_sbn.png",
                      "Sukuk Ritel",
                      "Surat Berharga Syariah Negara",
                      "\u2022 Tingkat imbal hasil : Tetap (fixed rate)\n\n \u2022 Waktu Pencarian : Sesuai jatuh tempo\n\n \u2022 Jangka waktu : 3 tahun\n\n \u2022 Minimal Pembelian Rp. 1.000.000"),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          )

        ],
      ),

      
    );
  }

}