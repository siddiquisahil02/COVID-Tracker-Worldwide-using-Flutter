
import 'dart:ui';

import 'package:covid19counter/data/faqs.dart';
import 'package:covid19counter/model/AllCounInfo.dart';
import 'package:covid19counter/model/Post.dart';
import 'package:covid19counter/model/World.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Page2.dart';
import 'Page3.dart';

class Network {
  final String url;

  Network(this.url);

  Future<AllCon> loadPosts() async
  {
    final response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      return AllCon.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to get World");
    }
  }
}

class Network1 {
  final String url;

  Network1(this.url);

  Future<CountryList> loadPosts() async
  {
    final response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      return CountryList.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to get Countries");
    }
  }
}

class Network2 {
  final String url;

  Network2(this.url);

  Future<PostList> loadPosts() async
  {
    final response = await get(Uri.encodeFull(url));

    if(response.statusCode == 200)
    {
      return PostList.fromJson(json.decode(response.body));
    }
    else
    {
      throw Exception("Failed to get posts");
    }
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Post> overpost;

  Future<CountryList> data1;
  Future<PostList> data2;
  Future<AllCon> data3;

  @override
  void initState() {
    super.initState();
    Network2 network2 = Network2(
        "https://api.covid19india.org/v2/state_district_wise.json");
    data2 = network2.loadPosts();

    Network1 network1 = Network1(
        "https://corona.lmao.ninja/v2/countries?yesterday&sort");
    data1 = network1.loadPosts();

    Network network = Network("https://disease.sh/v2/all");
    data3 = network.loadPosts();
  }

  var fontsize=12.0;
  var boxFontSize=14.0;

  var f = new NumberFormat("##,##,##,##,###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("COVID-19 TRACKER"),
          centerTitle: true,
          elevation: 15,
          titleSpacing: 50,
          backgroundColor: Color.fromRGBO(30, 30, 30,1),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent,),
          child: SafeArea(
            child: Drawer(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
                      color: Colors.black.withOpacity(0.5)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      ListTile(
                        title: Text("All Country",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04375, fontWeight: FontWeight.bold,color: Colors.white),),
                        subtitle: Text("See data for all countries",style:TextStyle(fontSize: 13, color: Colors.white)),
                        leading: Icon(MdiIcons.earth, color: Colors.redAccent,size: MediaQuery.of(context).size.width * 0.085),
                        dense: true,
                        onTap:()
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)
                                  {
                                    return JsonWORLD(data: data1);
                                  }
                              )
                          );
                        },
                      ),
                      ListTile(
                        title: Text("District-Wise",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04375, fontWeight: FontWeight.bold,color: Colors.white),),
                        subtitle: Text("See numbers District-wise in your country",style:TextStyle(fontSize: 12,color: Colors.white),),
                        leading: Icon(MdiIcons.homeCityOutline, size: MediaQuery.of(context).size.width * 0.085,color: Colors.redAccent),
                        //dense: true,
                        onTap: ()
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)
                                  {
                                    return JsonParsing(allPosts: overpost);
                                  }
                              )
                          );
                        },
                      ),
                      ListTile(
                        dense: true,
                          title: Text("FAQs",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04375, fontWeight: FontWeight.bold,color: Colors.white),),
                          subtitle: Text("Frequently asked questions",style:TextStyle(fontSize: 12,color: Colors.white)),
                          leading: Icon(MdiIcons.frequentlyAskedQuestions, size: MediaQuery.of(context).size.width * 0.07291,color: Colors.redAccent),
                          onTap:()
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)
                                    {
                                      return FAQs();
                                    }
                                )
                            );
                          }
                      ),
                      ListTile(
                        title: Text("Myth Busters",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04375, fontWeight: FontWeight.bold,color: Colors.white),),
                        subtitle: Text("By WHO", style: TextStyle(color: Colors.white)),
                        leading: Icon(MdiIcons.accountQuestion, size: MediaQuery.of(context).size.width * 0.07291,color: Colors.redAccent),
                        onTap: ()
                        {
                          launch("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
                        },
                      ),
                      ListTile(
                        title: Text("Travel Precautions",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04375, fontWeight: FontWeight.bold,color: Colors.white),),
                        subtitle: Text("By WHO", style: TextStyle(color: Colors.white),),
                        leading: Icon(MdiIcons.trainCar, size: MediaQuery.of(context).size.width * 0.07291,color: Colors.redAccent),
                        onTap: ()
                        {
                          launch("https://www.who.int/news-room/q-a-detail/travel-precautions");
                        },
                      ),
                      ListTile(
                        title: Text("About",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04375, fontWeight: FontWeight.bold,color: Colors.white),),
                        leading: Icon(MdiIcons.information, size: MediaQuery.of(context).size.width * 0.07291,color: Colors.redAccent),
                        onTap: ()
                        {
                          return showAboutDialog(
                              context: context,
                              applicationIcon: Image(image: AssetImage('images/logo.png'),height: 80,width: 80,),
                              applicationVersion: '2.0.16',
                              applicationName: 'COVID-19 Tracker',
                              children:<Widget>[
                                Linkify(
                                  text: "This application maintains the record of number of COVID-19 cases in each country and in district of your"
                                      " country. This application is created by Sahil Hussain Siddiqui, a student of NIET, Gr.Noida.\n"
                                      "*DISCLAIMER - This data is not official data by it is pretty close to the actual numbers.*\n"
                                      "For source code, go check https://github.com/siddiquisahil02",
                                  onOpen: (link) async {
                                    if (await canLaunch(link.url)) {
                                      await launch(link.url);
                                    } else {
                                      throw 'Could not launch $link';
                                    }
                                  },
                                  style: TextStyle(color: Colors.black),
                                  linkStyle: TextStyle(color: Colors.blueAccent),
                                )
                              ]
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade400,
                  ),
                  child: Text("\" The best of our work comes out when you are pushed to the wall. The world is pushed to the wall right now. \"",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:MediaQuery.of(context).size.width*0.041320)
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 6),
                    child: Text("Worldwide",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  InkWell(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(30, 30, 30,1),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(0, 7),
                                blurRadius: 10
                            )]
                        ),
                        child: Text("All Countries",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)
                                {
                                  return JsonWORLD(data: data1);
                                }
                            )
                        );
                      }
                  ),
                ],
              ),
              Flexible(
                  flex: 5,
                  child: FutureBuilder(
                    future: data3,
                    builder: (context, AsyncSnapshot<AllCon> snapshot)
                    {
                      AllCon allshiz;
                      if(snapshot.hasData)
                      {
                        allshiz = snapshot.data;
                        return InkWell(
                          child: Card(
                            elevation: 25,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.blueGrey.shade100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Card(
                                        elevation: 15,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width*0.43751,
                                          padding: EdgeInsets.symmetric(vertical: 7),
                                          color: Colors.redAccent.shade200,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Total Confirmed Cases",
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12
                                                  )
                                              ),
                                              SizedBox(height: 3,),
                                              Text(f.format(allshiz.cases),
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 24
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 15,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width*0.43751,
                                          padding: EdgeInsets.symmetric(vertical: 7),
                                          color: Colors.lightBlueAccent,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Total Active Cases",
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12
                                                  )),
                                              SizedBox(height: 3,),
                                              Text(f.format(allshiz.active),
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 24
                                                  ))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Card(
                                        elevation: 15,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width*0.43751,
                                          padding: EdgeInsets.symmetric(vertical: 7),
                                          color: Colors.greenAccent.shade400,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Total Recovered Cases",
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12
                                                  )),
                                              SizedBox(height: 3,),
                                              Text(f.format(allshiz.recovered),
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 24
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 15,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 7),
                                          width: MediaQuery.of(context).size.width*0.43751,
                                          color: Colors.grey.shade600,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Total Deceased Cases",
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12
                                                  )
                                              ),
                                              SizedBox(height: 3,),
                                              Text(f.format(allshiz.deaths),
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 24
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: ()
                          {
                            return showDialog(
                                context: context,
                                builder: (context)
                                {
                                  fontsize = MediaQuery.of(context).size.width * 0.0291666717;
                                  boxFontSize = MediaQuery.of(context).size.width * 0.0340277837;
                                  return AlertDialog(
                                    title: Center(
                                      child: Text("WORLDWIDE"),
                                    ),
                                    content: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          //SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Confirmed Cases",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.cases),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Deaths",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.deaths),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Recovered",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.recovered),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Active",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.active),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Critical",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.critical),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Cases Per One Milion",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.casesPerOneMillion),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Deaths Per One Million",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.deathsPerOneMillion),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Population",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.population),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Affected Countries",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.affectedCountries),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Tests",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1,horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.tests),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Tests Per One Million",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[300],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.testsPerOneMillion),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Divider(thickness: 3,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("New Cases",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize)),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[400],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.todayCases),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("New Deaths",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[400],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.todayDeaths),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("New Recovered",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                              Container(
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(13),
                                                        color: Colors.red[400],
                                                      ),
                                                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                      child: Center(
                                                        child: Text(f.format(allshiz.todayRecovered),
                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                        );
                      }
                      else
                      {
                        return CircularProgressIndicator();
                      }
                    },
                  )
              ),
              Spacer(flex: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 6),
                    child: Text("Your Country",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  InkWell(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(30, 30, 30,1),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(0, 7),
                                blurRadius: 10
                            )]
                        ),
                        child: Text("District-wise",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)
                                {
                                  return JsonParsing(allPosts: overpost);
                                }
                            )
                        );
                      }
                  ),
                ],
              ),
              Flexible(
                //alignment: Alignment.center,
                //height: 100,
                  flex: 5,
                  child: cardShow()
              ),
              SizedBox(height: 20,)
            ],
          ),
        )
    );
  }

  Widget cardShow()
  {
    return InkWell(
      child: Card(
          elevation: 25,
          child: FutureBuilder(
              future: data2,
              builder: (context, AsyncSnapshot<PostList> dataShot)
              {
                if(dataShot.hasData)
                {
                  var totCases=0,totActive = 0, totRecover =0,totDeceased =0;
                  overpost = dataShot.data.posts;
                  for(int i=0;i<overpost.length;++i)
                  {
                    for(int j=0;j<overpost[i].districtData.length; ++j)
                    {
                      totCases = totCases + overpost[i].districtData[j].confirmed;
                      totActive = totActive + overpost[i].districtData[j].active;
                      totRecover = totRecover + overpost[i].districtData[j].recovered;
                      totDeceased = totDeceased + overpost[i].districtData[j].deceased;
                    }
                  }
                  return Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.blueGrey.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Card(
                              elevation: 15,
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.43751,
                                padding: EdgeInsets.symmetric(vertical: 7),
                                color: Colors.redAccent.shade200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Total Confirmed Cases",
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12
                                        )
                                    ),
                                    SizedBox(height: 3,),
                                    Text(f.format(totCases),
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 15,
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.43751,
                                padding: EdgeInsets.symmetric(vertical: 7),
                                color: Colors.lightBlueAccent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Total Active Cases",
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12
                                        )),
                                    SizedBox(height: 3,),
                                    Text(f.format(totActive),
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Card(
                              elevation: 15,
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.43751,
                                padding: EdgeInsets.symmetric(vertical: 7),
                                color: Colors.greenAccent.shade400,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Total Recovered Cases",
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12
                                        )),
                                    SizedBox(height: 3,),
                                    Text(f.format(totRecover),
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 15,
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.43751,
                                padding: EdgeInsets.symmetric(vertical: 7),
                                color: Colors.grey.shade600,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Total Deceased Cases",
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12
                                        )
                                    ),
                                    SizedBox(height: 3,),
                                    Text(f.format(totDeceased),
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24
                                        )
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
                else
                {
                  return CircularProgressIndicator();
                }
              }
          )
      ),
      onTap:()
      {
        return showDialog(
            context: context,
            builder: (context)
            {
              return AlertDialog(
                title: Center(
                  child: Text("INDIA"),
                ),
                content: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      //shrinkWrap: true,
                      itemCount: overpost.length,
                      itemBuilder: (context, int index)
                      {
                        var staCases=0,staActive=0,staRecover=0,staDead=0;
                        var nwCases=0,nwRecoverd=0,nwDead=0;
                        for(int k=0; k<overpost[index].districtData.length; ++k)
                        {
                          staCases = staCases + overpost[index].districtData[k].confirmed;
                          staActive = staActive + overpost[index].districtData[k].active;
                          staRecover = staRecover + overpost[index].districtData[k].recovered;
                          staDead =staDead + overpost[index].districtData[k].deceased;

                          nwCases = nwCases + overpost[index].districtData[k].delta.confirm;
                          nwRecoverd = nwRecoverd + overpost[index].districtData[k].delta.rec;
                          nwDead = nwDead + overpost[index].districtData[k].delta.dead;
                        }
                        return Card(
                          margin: EdgeInsets.all(5),
                          color: Colors.redAccent,
                          elevation: 15,
                          child: ExpansionTile(
                            title: Text(overpost[index].state,
                              style: TextStyle(color: Colors.white),),
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Confirmed Cases",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                        Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(13),
                                                  color: Colors.white,
                                                ),
                                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                child: Center(
                                                  child: Text(f.format(staCases),
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Active",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                        Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(13),
                                                  color: Colors.white,
                                                ),
                                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                child: Center(
                                                  child: Text(f.format(staActive),
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Recovered",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                        Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(13),
                                                  color: Colors.white,
                                                ),
                                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                child: Center(
                                                  child: Text(f.format(staRecover),
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Deceased",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                        Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(13),
                                                  color: Colors.white,
                                                ),
                                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                child: Center(
                                                  child: Text(f.format(staDead),
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Divider(thickness: 3,color: Colors.black54,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("New Cases",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                        Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(13),
                                                  color: Colors.white,
                                                ),
                                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                child: Center(
                                                  child: Text(f.format(nwCases),
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("New Recovered",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                        Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(13),
                                                  color: Colors.white,
                                                ),
                                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                child: Center(
                                                  child: Text(f.format(nwRecoverd),
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("New Deaths",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                        Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(13),
                                                  color: Colors.white,
                                                ),
                                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                child: Center(
                                                  child: Text(f.format(nwDead),
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ),
              );
            }
        );
      },
    );
  }
}

