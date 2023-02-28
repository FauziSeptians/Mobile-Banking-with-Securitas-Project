import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uangin/classes/color_scheme.dart';
import 'package:uangin/pages/saham/sahamdetail.dart';


class SahamMorePage extends StatefulWidget {
  final AsyncSnapshot<User?> user;
  const SahamMorePage({super.key, required this.user});

  @override
  State<SahamMorePage> createState() => _SahamMorePageState();
}

class _SahamMorePageState extends State<SahamMorePage> {
  List<Map<String, String>> dataset = [
    
  ];

  List<Map<String, String>> _viewdata = [];
  List<Map<String, String>> view = [];
  int index = 0;

  void update_list(String value) {
    setState(() {
      _viewdata.clear();

      for (var element in dataset) {
        String bankName = element['bank']!.toLowerCase();

        if (bankName.contains(value.toLowerCase())) {
          _viewdata.add(element);
        }
      }

      if (value.isEmpty) {
        // _viewdata.addAll(dataset);
        _viewdata = [...dataset];
      }
      
    });
  }

  List<Map<String, dynamic>> _saham = [];
  List<Map<String, dynamic>> _saham2 = [];


  void fetchSaham () async{

    var response = await http.get(Uri.parse('https://api.goapi.id/v1/stock/idx/trending?api_key=cIeUpWfAHUjiVqQzovgXetbm5ZfoDq'));
    var response2 = await http.get(Uri.parse('https://api.goapi.id/v1/stock/idx/companies?api_key=cIeUpWfAHUjiVqQzovgXetbm5ZfoDq'));
    // log(response.body);

    if (jsonDecode(response.body)['data']['count'] < 40) {
      response = await http.get(Uri.parse('https://api.goapi.id/v1/stock/idx/top_gainer?api_key=cIeUpWfAHUjiVqQzovgXetbm5ZfoDq'));
    }
    //convert json to map
    var data = jsonDecode(response.body);

    // get all ticker from all index and assign to list
    var ticker = data['data']['results'].map((e) => e['ticker']).toList();

    for (var i = 0; i < 40; i++) {
      _saham2.add(data['data']['results'][i]);
    }

    log(_saham2.toString());
    

    var data2 = jsonDecode(response2.body);

    //filter data by ticker
    for (var i = 0; i < 40; i++) {
      var filteredData = data2['data']['results'].where((element) => element['ticker'] == ticker[i]).toList();
      // log(filteredData.toString());
      _saham.add(filteredData[0]);
      
    }
    // var filteredData = data2['data']['results'].where((element) => element['ticker'] == data['data']['results'][0]['ticker']).toList();

    // log(filteredData.toString());
    log(_saham.toString());
    
    setState(() {
      for (var i = 0; i < _saham.length; i++) {
        dataset.add(
          {
            'bank': _saham[i]['ticker'],
            'bankkepanjangan': _saham[i]['name'],
            'Hargasekarang': _saham2[i]['close'],
            'image': _saham[i]['logo'],
            'rugi': _saham2[i]['change'],
            'persen': _saham2[i]['percent']

          }
        );
        _viewdata.add(dataset[i]);
      }
    });
  }

  @override
  initState() {
    fetchSaham();
    
    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return 
    dataset.length > 0 ?
     Scaffold(
      body: ListView(
        children: [
          SafeArea(
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                     Row(
                      
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
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Saham',
                            style: TextStyle(
                              fontSize: 16,
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
                    const SizedBox(
                      height: 10,
                    ),
                    
                    
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        onChanged: (value) => update_list(value),
                        textAlignVertical: TextAlignVertical.center,
                        decoration:  const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10.0, bottom: 10, left: 15, right: 20),
                          filled: true,
                          fillColor: Color(0xffF0F0F0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))
                          ),
                          hintText: "Cari Saham...",
                          hintStyle: TextStyle(
                            color: Color(0XFF9E9E9E),
                            fontFamily: "OpenSans",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          // prefixIcon: ,
                          prefixIcon: Icon(Icons.search, color: UsedColor.primaryGreen,),
                          
                          // prefixIconColor: Color(0xff5D5D5D),

                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Kode Emiten",
                          style: TextStyle(
                              color: UsedColor.primaryGrey,
                              fontWeight: FontWeight.w500,
                              fontFamily: "OpenSans",
                              fontSize: 12),
                        ),
                        Text(
                          "Harga",
                          style: TextStyle(
                              color: UsedColor.primaryGrey,
                              fontWeight: FontWeight.w500,
                              fontFamily: "OpenSans",
                              fontSize: 12),
                        ),
                      ]),
                ),
                    Container(
                        height: 700,
                        // color: Colors.red,
                        child: ListView.builder(
                            itemCount: _viewdata.length + 3,
                            itemBuilder: ((context, index) => index < _viewdata.length ? InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Sahamdetail(dataSaham: {
                                    "saham": _viewdata[index]['bank'],
                                    "namadetail": _viewdata[index]['bankkepanjangan'],
                                    "open": _viewdata[index]['Hargasekarang'],
                                    "harga": _viewdata[index]['Hargasekarang'],
                                  }, user: widget.user,
                                  )));
                              
                              },
                              child: Container(
                                    margin: const EdgeInsets.only(left: 15, right: 15),
                                    height: 70,
                                    decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade100), bottom: BorderSide(color: Colors.grey.shade100))),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                              Image.network(_viewdata[index]['image']!, width: 50, height: 50),
                                              const SizedBox(width: 15),
                                              Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(_viewdata[index]['bank'].toString(), style: const TextStyle(color: UsedColor.primaryGreen, fontWeight: FontWeight.w500, fontSize: 15),),
                                                    const SizedBox(height: 3),
                                                    Container(
                                                      width: 160,
                                                      child: Text(_viewdata[index]['bankkepanjangan'].toString(), style: const TextStyle( color: UsedColor.primaryGrey, fontWeight: FontWeight.w500, fontSize: 11), )),
                                                  ]
                                              ),
                                          ]
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(_viewdata[index]['Hargasekarang']!, style: const TextStyle(color: Color(0xff3D3D3D),fontWeight: FontWeight.bold,fontSize: 15, fontFamily: "OpenSans"),),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  double.parse((_viewdata[index]['persen']).toString().substring(0, 4)) < 0  ?
                                                  Image.asset("assets/Icon/downTrendIcon.png", width: 10,)
                                                  :
                                                  Image.asset("assets/Icon/upTrendIcon.png", width: 10,),
                                                  const SizedBox(width: 5),
                                                  Text("${double.parse(_viewdata[index]['Hargasekarang']!).round()} (${(_viewdata[index]['persen']).toString().substring(0, 4)}%)",style: TextStyle(color: double.parse((_viewdata[index]['persen']).toString().substring(0, 4)) < 0 ? Colors.red: UsedColor.primaryGreen, fontSize: 11),),
                                                ],
                                              ),
                                            ],
                                          )
                                        ]
                                      )
                                  ),
                            ):
                                const SizedBox(height: 20)
                                )
                                
                                )
                                ),
                  ],
                ),
              )),
        ],
      ),
    ) :
    Scaffold(
      body: Center(
        child: Container(
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
      ),
    )
    ;
  }
}
