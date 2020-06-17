
import 'package:covid19counter/model/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class JsonParsing extends StatelessWidget {

  List<Post> allPosts;

  JsonParsing({this.allPosts});

  var f = new NumberFormat("##,##,##,##,##,###");

  var firstCardSize;
  var fontsize;
  var fontsize2;
  var boxFontSize;

//  firstCardSize = MediaQuery.of(context).size.width * 0.02916;
//  fontsize = MediaQuery.of(context).size.width * 0.034028;
//  fontsize2 = MediaQuery.of(context).size.width * 0.04375 ;
//  boxFontSize = MediaQuery.of(context).size.width * 0.04375 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("District Data"),
        centerTitle: true,
        elevation: 15.5,
      ),
      body: SafeArea(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Container(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: allPosts.length,
                            itemBuilder: (context, int index) {
                              return Column(
                                children: <Widget>[
                                  Card(
                                    margin: EdgeInsets.all(5),
                                    color: Colors.white,
                                    elevation: 15,
                                    child: ExpansionTile(
                                      leading: Icon(Icons.arrow_right, color: Colors.redAccent,size: 40,),
                                      title: Text("${allPosts[index].state}",style: TextStyle(color: Colors.black,
                                        fontSize: fontsize2,fontWeight: FontWeight.bold,)),
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.redAccent
                                                ),
                                                child: Center(
                                                  child: Text("CONFIRMED", style: TextStyle(color: Colors.white, fontSize: firstCardSize),),
                                                ),
                                              ),
                                              //SizedBox(width: 10,),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Colors.blue[300]
                                                ),
                                                child: Center(
                                                  child: Text("ACTIVE", style: TextStyle(color: Colors.white, fontSize: firstCardSize),),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                  color: Colors.green[500],
                                                ),
                                                child: Center(
                                                  child: Text("RECOVERED", style: TextStyle(color: Colors.white, fontSize: firstCardSize),),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Colors.grey[700]
                                                ),
                                                child: Center(
                                                  child: Text("DECEASED", style: TextStyle(color: Colors.white, fontSize: firstCardSize),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: allPosts[index].districtData.length,
                                            itemBuilder:(context, int position)
                                            {
                                              return Container(
                                                  decoration: BoxDecoration(
                                                    //color: Colors.white,
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: InkWell(
                                                    child: Card(
                                                        elevation: 15,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: <Widget>[
                                                            Container(
                                                              width: MediaQuery.of(context).size.width/3,
                                                              padding: EdgeInsets.all(10),
                                                              child: Text("${allPosts[index].districtData[position].district}", style: TextStyle(color: Colors.black, fontSize: fontsize),),
                                                            ),
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: <Widget>[
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        color: Colors.redAccent
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(f.format(allPosts[index].districtData[position].confirmed), style: TextStyle(color: Colors.white, fontSize: fontsize),),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        color: Colors.blue[300]
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(f.format(allPosts[index].districtData[position].active), style: TextStyle(color: Colors.white, fontSize: fontsize),),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        color: Colors.green[500]
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(f.format(allPosts[index].districtData[position].recovered), style: TextStyle(color: Colors.white, fontSize: fontsize),),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        color: Colors.grey[700]
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(f.format(allPosts[index].districtData[position].deceased), style: TextStyle(color: Colors.white, fontSize: fontsize),),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                    ),
                                                    onTap: (){
                                                      return showDialog(
                                                          context: context,
                                                          builder: (context)
                                                          {
                                                            return AlertDialog(
                                                              title: Center(child: Text("${allPosts[index].districtData[position].district}",
                                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.5),)),
                                                              content: Container(
                                                                height: 100,
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: <Widget>[
                                                                    //SizedBox(height: 50,),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: <Widget>[
                                                                        Text("New Cases",style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: fontsize2)),
                                                                        Container(
                                                                            child: Center(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(13),
                                                                                  color: Colors.redAccent,
                                                                                ),
                                                                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                                                child: Center(
                                                                                  child: Text(f.format(allPosts[index].districtData[position].delta.confirm),
                                                                                    style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: boxFontSize),),
                                                                                ),
                                                                              ),
                                                                            )
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: <Widget>[
                                                                        Text("New Deaths",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic, fontSize: fontsize2),),
                                                                        Container(
                                                                            child: Center(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(13),
                                                                                  color: Colors.grey[700],
                                                                                ),
                                                                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                                                child: Center(
                                                                                  child: Text(f.format(allPosts[index].districtData[position].delta.dead),
                                                                                    style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic, fontSize: boxFontSize),),
                                                                                ),
                                                                              ),
                                                                            )
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: <Widget>[
                                                                        Text("New Recovered",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic, fontSize: fontsize2),),
                                                                        Container(
                                                                            child: Center(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(13),
                                                                                  color: Colors.green[500],
                                                                                ),
                                                                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                                                                child: Center(
                                                                                  child: Text(f.format(allPosts[index].districtData[position].delta.rec),
                                                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: boxFontSize),),
                                                                                ),
                                                                              ),
                                                                            )
                                                                        )
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                      );
                                                    },
                                                  )
                                              );
                                            }
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );

                            }),
                      )
            ),
          )
      ),
    );
  }
}
