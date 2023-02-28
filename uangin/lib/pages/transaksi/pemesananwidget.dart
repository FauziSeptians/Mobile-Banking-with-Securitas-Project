import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WPemesanan extends StatefulWidget {
  List<Map<String, String>> temp;
  WPemesanan({super.key, required this.temp});

  @override
  State<WPemesanan> createState() => _WPemesananState(temp);
}

class _WPemesananState extends State<WPemesanan> {
  List<Map<String, String>> temp;
  _WPemesananState(this.temp);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: temp.length,
        itemBuilder: ((context, index) => Column(
              children: [
                Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Image.asset(
                                temp[index]['image'].toString(),
                                width: 50,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    temp[index]['nama'].toString(),
                                    style: TextStyle(
                                        color: Color(0XFF5ADFB2), fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    temp[index]['jenis'].toString(),
                                    style: TextStyle(
                                        color: Color(0XFF8D8D8D), fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Rp " + temp[index]['pembelian'].toString(),
                                style: TextStyle(
                                    color: Color(0XFF20E2A1), fontSize: 13),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              if (temp[index]['validasi'].toString() == '1')
                                Text(
                                  "Pembelian Berhasil",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 132, 247, 208),
                                      fontSize: 10),
                                )
                              else if (temp[index]['validasi'].toString() ==
                                  '0')
                                Text(
                                  "Pembelian Sedang Diproses",
                                  style: TextStyle(
                                      color: Color(0XFFE74E4E), fontSize: 10),
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0XFFFFEEC0),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 10, right: 10),
                                  child: Text(
                                    "Lihat Detail Pembelian",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            )),
      ),
    );
  }
}
