import 'package:flutter/material.dart';
import 'package:uangin/classes/color_scheme.dart';

class NewsPage extends StatefulWidget {
  final List<String>? parameterBerita;
  const NewsPage({Key? key, this.parameterBerita}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState(parameterBerita);
}


class _NewsPageState extends State<NewsPage> {
  _NewsPageState (List<String>? parameterBerita) : parameter = parameterBerita ?? [];
  

  final List<String> parameter;

  List<String> berita = [
    "Menurut polling yang diadakan oleh New Harris melalui sebuah aplikasi bernama Stash, hampir 80% generasi milenial tidak melakukan kegiatan investasi di pasar saham loh, Sobat Sikapi! Kenapa begitu? Hal ini dikarenakan 34% anak muda mengatakan sulitnya memahami cara kerja investasi saham.",
    "Pertama, kapan waktu yang tepat untuk membeli saham? Nah, terkait waktu yang tepat ini sebenarnya bisa dilihat dari dua hal yaitu berdasarkan analisis fundamental dan teknikal, Sobat Sikapi. Analisis fundamental itu mengacu pada analisa melalui pendekatan kondisi ekonomi, politik, atau bahkan melihat tren perkembangan usaha yang ada. Analisis ini salah satunya bisa dilihat dari laporan keuangan, Sobat Sikapi.",
    "Sementara analisa teknikal, merupakan analisa saham melalui pendekatan pergerakan saham itu sendiri pada suatu rentang waktu, termasuk didalamnya adalah harga dan fluktuasinya, serta informasi mengenai titik tertinggi dan terendah dari suatu saham. Perlu diingat ya Sobat Sikapi, harga disini bukan semata-mata harga yang murah ya, tapi harga saham dari perusahaan yang pantas untuk dibeli."
  ];
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
                      'Artikel',
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(parameter[0], style: const TextStyle(color: UsedColor.primaryGreen, fontSize: 17, fontWeight: FontWeight.w700, fontFamily: "OpenSans"),),
                  const SizedBox(height: 10,),
                  const Text("January 04, 2023", style:  TextStyle(color: UsedColor.primaryGrey, fontSize: 15, fontWeight: FontWeight.w600, fontFamily: "OpenSans"),),

                  const SizedBox(height: 20,),
                  Image.asset(parameter[1]),

                  const SizedBox(height: 20,),
                  Text(berita[0], style: const TextStyle(color: Color(0xff3D3D3D), fontSize: 15, fontWeight: FontWeight.w500, fontFamily: "OpenSans"), textAlign: TextAlign.justify,),
                  const SizedBox(height: 20),
                  Text(berita[1], style: const TextStyle(color: Color(0xff3D3D3D), fontSize: 15, fontWeight: FontWeight.w500, fontFamily: "OpenSans"), textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text(berita[2], style: const TextStyle(color: Color(0xff3D3D3D), fontSize: 15, fontWeight: FontWeight.w500, fontFamily: "OpenSans"), textAlign: TextAlign.justify),
                  const SizedBox(height: 30),
                  const Text("Tags: Investasi 2023, Stategi memulai investasi Saham, Strategi Investasi, Investasi Saham", style: TextStyle(color: UsedColor.primaryGrey, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: "OpenSans"), textAlign: TextAlign.justify,),
                  const SizedBox(height: 10,),
                  Row(
                    children: const[
                      Icon(Icons.favorite, color: UsedColor.primaryGrey, size: 20),
                      SizedBox(width: 4,),
                      Text("9 Likes", style: TextStyle(color: UsedColor.primaryGrey, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: "OpenSans", fontStyle: FontStyle.italic), textAlign: TextAlign.justify,),
                      SizedBox(width: 20,),
                      Icon(Icons.share, color: UsedColor.primaryGrey, size: 18),
                      SizedBox(width: 4,),
                      Text("Share", style: TextStyle(color: UsedColor.primaryGrey, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: "OpenSans", fontStyle: FontStyle.italic), textAlign: TextAlign.justify,),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Artikel Lainnya', style: TextStyle(color: UsedColor.primaryGreen, fontSize: 17, fontWeight: FontWeight.w700, fontFamily: "OpenSans"),),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(border: Border(top: BorderSide(color:Colors.grey.shade100), bottom: BorderSide(color:Colors.grey.shade100))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Kenali Sejarahnya dan Yakin Berinvestasi di Pasar Modal Indonesia', style: TextStyle(color: Color(0xff3D3D3D), fontSize: 15, fontWeight: FontWeight.w600, fontFamily: "OpenSans"),),
                              const SizedBox(height: 7,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const[
                                  Text('Baca Selengkapnya', style: TextStyle(color: UsedColor.primaryGreen, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: "OpenSans"),),
                                  SizedBox(width: 5,),
                                  Icon(Icons.arrow_forward, color: UsedColor.primaryGreen, size: 13),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(border: Border( bottom: BorderSide(color:Colors.grey.shade100))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Kenali Sejarahnya dan Yakin Berinvestasi di Pasar Modal Indonesia', style: TextStyle(color: Color(0xff3D3D3D), fontSize: 15, fontWeight: FontWeight.w600, fontFamily: "OpenSans"),),
                              const SizedBox(height: 7,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const[
                                  Text('Baca Selengkapnya', style: TextStyle(color: UsedColor.primaryGreen, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: "OpenSans"),),
                                  SizedBox(width: 5,),
                                  Icon(Icons.arrow_forward, color: UsedColor.primaryGreen, size: 13),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),

                ],
              )
            ),
          )
        ],
      ),
    );
  }
}