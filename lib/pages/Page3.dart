
import 'package:covid19counter/model/World.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JsonWORLD extends StatelessWidget {

  Future<CountryList> data;

  JsonWORLD({this.data});

  var fontsize;
  var boxFontSize;

  var f = new NumberFormat("##,##,##,##,###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL COUNTRIES", style: TextStyle(
          fontWeight: FontWeight.bold, letterSpacing: 1,
        ),),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        elevation: 15,
      ),
      body: SafeArea(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: data,
                  builder: (context, AsyncSnapshot<CountryList> snapshot)
                  {
                    List<Country> allcon;
                    if(snapshot.hasData)
                    {
                      fontsize = MediaQuery.of(context).size.width * 0.0388896;
                      boxFontSize = MediaQuery.of(context).size.width * 0.0388896;

                      allcon=snapshot.data.post;
                      for(int i=0;i<allcon.length;++i)
                      {
                        if(allcon[i].continent == "")
                        {
                          allcon.removeAt(i);
                        }
                      }
                      return Container(
                        child: GridView.count(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 15,
                          crossAxisCount: 3,
                          children: List.generate(allcon.length, (index){
                            return InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height/3 ,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      //child: Expanded(
                                      child:  Card(
                                        elevation: 15,
                                        child: Container(
                                          child: Image.network(allcon[index].countryInfo.flag, height: 60,width: 100, fit: BoxFit.fill,
                                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadgingProgress)
                                            {
                                              if(loadgingProgress == null) return child;
                                              return Center(
                                                child:  CircularProgressIndicator(
                                                  value: loadgingProgress.expectedTotalBytes != null
                                                      ? loadgingProgress.cumulativeBytesLoaded /
                                                      loadgingProgress.expectedTotalBytes
                                                      : null,
                                                ),
                                              );
                                            },),
                                        ),
                                        //),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Expanded(
                                        child: Center(
                                          child: Text(allcon[index].countryName, style: TextStyle(color:Colors.black,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                              onTap:(){
                                return showDialog(
                                    context: context,
                                    builder: (context)
                                    {
                                      return AlertDialog(
                                        title: Center(
                                          child: Text(allcon[index].countryName, style: TextStyle(color: Colors.black,
                                              fontWeight: FontWeight.bold),),
                                        ),
                                        content: Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Center(
                                                    child: Image.network(allcon[index].countryInfo.flag,height: 70,)
                                                ),
                                                SizedBox(height: 10,),
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
                                                              child: Text(f.format(allcon[index].cases),
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
                                                              child: Text(f.format(allcon[index].deaths),
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
                                                              child: Text(f.format(allcon[index].recovered),
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
                                                              child: Text(f.format(allcon[index].active),
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
                                                              child: Text(f.format(allcon[index].critical),
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
                                                              child: Text(f.format(allcon[index].casePerOneMillion),
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
                                                              child: Text(f.format(allcon[index].deathsPerOneMillion),
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
                                                              child: Text(f.format(allcon[index].population),
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
                                                    Text("Continent",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontsize),),
                                                    Container(
                                                        child: Center(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(13),
                                                              color: Colors.red[300],
                                                            ),
                                                            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                            child: Center(
                                                              child: Text(allcon[index].continent,
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
                                                              child: Text(f.format(allcon[index].tests),
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
                                                              child: Text(f.format(allcon[index].todayCases),
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
                                                              child: Text(f.format(allcon[index].todayDeaths),
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
                                                              child: Text(f.format(allcon[index].todayRecovered),
                                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                            ),
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                        ),
                                      );
                                    }
                                );
                              },
                            );
                          }),
                        ),
                      );
                    }
                    else
                    {
                      return CircularProgressIndicator();
                    }
                  }
              ),
            ),
          )
      ),
    );
  }
}