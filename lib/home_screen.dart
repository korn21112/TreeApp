import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_tree/detail_screen.dart';
import 'package:test_tree/plant.dart';
import 'package:test_tree/item_card.dart';

import 'dart:convert';

//import 'package:flutter_http_app/nessages_dogs_dao.dart';
import 'package:http/http.dart' as Http;

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    DogService.randomDog();
    ExchangerateService.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      // appBar: AppBar(
      //   title: Text(
      //     'Hydroponic Monitor',
      //     style: TextStyle(
      //        color: Colors.black54
      //     ),
      //   ),
      //   backgroundColor: Colors.grey[50],
      // ),
      body: SafeArea(
          child: Container(
        alignment: Alignment.topLeft,
        child: Stack(
          children: [
            Container(
              color: Colors.grey[200],
              height: 230,
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hydroponic Monitor',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'monitor the growth of your hydroponic plants',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 380,
                            ),
                            Container(
                              height: 100,
                              width: 350,
                              color: Colors.white,
                              padding: EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'ROOM TEMP',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text('29C')
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'SUNLIGHT',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text('14%')
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'HUMIDITY',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text('30%')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                                height: 300,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 100,
                                      offset: Offset(
                                          0, 30), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:
                                GestureDetector(
                                  onTap: () {setState(() {});},
                                  child: FutureBuilder(
                                      future: DogService.randomDog(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          MessageDogsDao msg = snapshot.data;
                                          print("snap = "+msg.message);
                                          return Image.network(msg.message,width: 300,height: 200,);
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      }),
                                )
                                // PageView.builder(
                                //   itemCount: plants.length,
                                //   itemBuilder: (context, index) => ItemCard(
                                //     plant: plants[index],
                                //     press: ()=>Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => DetailScreen(
                                //             plant: plants[index]
                                //           )
                                //       ),
                                //     ),
                                //   )
                                // )
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: 350,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 100,
                                    offset: Offset(
                                        0, 30), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  FutureBuilder(
                                      future: ExchangerateService.create(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          Autogenerated exchange = snapshot.data;
                                          print("snap = "+exchange.date);
                                          return Text(exchange.date);
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      }),
                                  //Text('Greenhouse #1'),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Container(
                                    color: Colors.grey[100],
                                    child: FlatButton(
                                        onPressed: null,
                                        child: Text(
                                          '7Plants',
                                          style:
                                              TextStyle(color: Colors.black54),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class DogService {
  static Future<MessageDogsDao> randomDog() async {
    var url = "https://dog.ceo/api/breeds/image/random";
    var response = await Http.get(url);
    Map map = json.decode(response.body);
    MessageDogsDao msg = MessageDogsDao.fromJson(map);
    print("URL image = " + msg?.message);
    return msg;
  }
}

class MessageDogsDao {
  String status;
  String message;

  MessageDogsDao({this.status, this.message});

  MessageDogsDao.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class ExchangerateService{
  static Future<Autogenerated>create() async{
    var url = "https://api.exchangeratesapi.io/latest";
    var response = await Http.get(url);
    Map map = json.decode(response.body);
    Autogenerated exchange =  Autogenerated.fromJson(map);
    print("Response status exchage rate: "+ exchange.rates.aUD.toString());
  }
}

class Autogenerated {
  Rates rates;
  String base;
  String date;

  Autogenerated({this.rates, this.base, this.date});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
    base = json['base'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rates != null) {
      data['rates'] = this.rates.toJson();
    }
    data['base'] = this.base;
    data['date'] = this.date;
    return data;
  }
}

class Rates {
  double cAD;
  double hKD;
  double iSK;
  double pHP;
  double dKK;
  double hUF;
  double cZK;
  double aUD;
  double rON;
  double sEK;
  double iDR;
  double iNR;
  double bRL;
  double rUB;
  double hRK;
  double jPY;
  double tHB;
  double cHF;
  double sGD;
  double pLN;
  double bGN;
  double tRY;
  double cNY;
  double nOK;
  double nZD;
  double zAR;
  double uSD;
  double mXN;
  double iLS;
  double gBP;
  double kRW;
  double mYR;

  Rates(
      {this.cAD,
        this.hKD,
        this.iSK,
        this.pHP,
        this.dKK,
        this.hUF,
        this.cZK,
        this.aUD,
        this.rON,
        this.sEK,
        this.iDR,
        this.iNR,
        this.bRL,
        this.rUB,
        this.hRK,
        this.jPY,
        this.tHB,
        this.cHF,
        this.sGD,
        this.pLN,
        this.bGN,
        this.tRY,
        this.cNY,
        this.nOK,
        this.nZD,
        this.zAR,
        this.uSD,
        this.mXN,
        this.iLS,
        this.gBP,
        this.kRW,
        this.mYR});

  Rates.fromJson(Map<String, dynamic> json) {
    cAD = json['CAD'];
    hKD = json['HKD'];
    iSK = json['ISK'];
    pHP = json['PHP'];
    dKK = json['DKK'];
    hUF = json['HUF'];
    cZK = json['CZK'];
    aUD = json['AUD'];
    rON = json['RON'];
    sEK = json['SEK'];
    iDR = json['IDR'];
    iNR = json['INR'];
    bRL = json['BRL'];
    rUB = json['RUB'];
    hRK = json['HRK'];
    jPY = json['JPY'];
    tHB = json['THB'];
    cHF = json['CHF'];
    sGD = json['SGD'];
    pLN = json['PLN'];
    bGN = json['BGN'];
    tRY = json['TRY'];
    cNY = json['CNY'];
    nOK = json['NOK'];
    nZD = json['NZD'];
    zAR = json['ZAR'];
    uSD = json['USD'];
    mXN = json['MXN'];
    iLS = json['ILS'];
    gBP = json['GBP'];
    kRW = json['KRW'];
    mYR = json['MYR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CAD'] = this.cAD;
    data['HKD'] = this.hKD;
    data['ISK'] = this.iSK;
    data['PHP'] = this.pHP;
    data['DKK'] = this.dKK;
    data['HUF'] = this.hUF;
    data['CZK'] = this.cZK;
    data['AUD'] = this.aUD;
    data['RON'] = this.rON;
    data['SEK'] = this.sEK;
    data['IDR'] = this.iDR;
    data['INR'] = this.iNR;
    data['BRL'] = this.bRL;
    data['RUB'] = this.rUB;
    data['HRK'] = this.hRK;
    data['JPY'] = this.jPY;
    data['THB'] = this.tHB;
    data['CHF'] = this.cHF;
    data['SGD'] = this.sGD;
    data['PLN'] = this.pLN;
    data['BGN'] = this.bGN;
    data['TRY'] = this.tRY;
    data['CNY'] = this.cNY;
    data['NOK'] = this.nOK;
    data['NZD'] = this.nZD;
    data['ZAR'] = this.zAR;
    data['USD'] = this.uSD;
    data['MXN'] = this.mXN;
    data['ILS'] = this.iLS;
    data['GBP'] = this.gBP;
    data['KRW'] = this.kRW;
    data['MYR'] = this.mYR;
    return data;
  }
}