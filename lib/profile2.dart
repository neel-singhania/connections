import 'package:flutter/material.dart';
import 'dart:ui';
class Profile2Page extends StatefulWidget {
  @override
  _Profile2PageState createState() => _Profile2PageState();
}

class _Profile2PageState extends State<Profile2Page> {
  bool isSelectedf = false;
  bool isSelectedm = false;
  bool isSelectedo = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //isSelected = false;
      backgroundColor: Colors.pinkAccent[400],
        resizeToAvoidBottomPadding: false,
        body:Container(
//            decoration: BoxDecoration(
//              gradient: LinearGradient(
//                begin: Alignment.topLeft,
//                end: Alignment.bottomRight,
//                colors: [Colors.pink[300],Colors.indigo[300]],
//              ),
//            ),
         child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[

                Container(

                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height*100.0/780.0, 0.0, 0.0),
                        child:Center(
                          child: Text(
                          'Select Your',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height*60.0/780.0,
                              fontFamily: 'Pacifico',
                    ),
                  ),
                ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0,
                            MediaQuery.of(context).size.height*170.0/780.0,
                            MediaQuery.of(context).size.width*10.0/360.0,
                            MediaQuery.of(context).size.height*30.0/780.0),
                        child:Center(
                          child: Text(
                            'Gender',
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height*60.0/780.0,
                                fontFamily: 'Pacifico'
                            ),
                          ),
                        ),
                      ),
              ],
            ),
    ),

              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*20.0/780.0),

                 padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*80.0/780.0,
                     left: MediaQuery.of(context).size.width*20.0/360.0,
                     right: MediaQuery.of(context).size.width*20.0/360.0,
                     bottom: MediaQuery.of(context).size.height*65/780.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[700],
                            blurRadius: 9.0
                        )
                      ]
                  ),
                 child: Column(
                    children: <Widget>[


                    Container(
                    //var setColor = color: Colors.tranparent;
                      height: MediaQuery.of(context).size.height*40.0/780.0,
                      color: Colors.transparent,
                      child: Container(
                        //duration: Duration(seconds: 0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color : isSelectedf?Colors.white:Colors.black,
                              style: BorderStyle.solid,
                              width: 2.0),
                          color: isSelectedf?Colors.pinkAccent[400]:Colors.white,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0)),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelectedf = ! isSelectedf;
                            isSelectedm = false;
                            isSelectedo = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child:
                              ImageIcon(AssetImage('assets/female.png'),
                                color: isSelectedf?Colors.white:Colors.black,
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*10.0/360),
                            Center(
                              child: Text('Female',
                                  style: TextStyle(
                                      color: isSelectedf?Colors.white:Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*22.0/780.0,
                                      //fontWeight: FontWeight.bold,
                                      fontFamily: 'Pacifico')),
                            )
                          ],
                        ),


                      ),
                      //transform: ,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                  Container(
                    height: MediaQuery.of(context).size.height*40.0/780.0,
                    color: Colors.transparent,
                   // color: isSelected?Colors.pinkAccent[400]:Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isSelectedm?Colors.white:Colors.black,
                              style: BorderStyle.solid,
                              width: 2.0),
                          color: isSelectedm?Colors.pinkAccent[400]:Colors.transparent,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0)),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelectedm = ! isSelectedm;
                            isSelectedo = false;
                            isSelectedf = false;
                          });
                        },


                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child:
                            ImageIcon(AssetImage('assets/male.png'),
                            color: isSelectedm?Colors.white:Colors.black,
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*10.0/360.0),
                          Center(
                            child: Text('Male',
                                style: TextStyle(
                                    color: isSelectedm?Colors.white:Colors.black,
                                    fontSize: MediaQuery.of(context).size.width*22.0/360.0,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Pacifico')),
                          )
                        ],
                      ),


                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                  Container(
                    height: MediaQuery.of(context).size.height*40.0/780.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isSelectedo?Colors.white:Colors.black,
                              style: BorderStyle.solid,
                              width: 2.0),
                          color: isSelectedo?Colors.pinkAccent[400]:Colors.transparent,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0)),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelectedo = ! isSelectedo;
                            isSelectedf = false;
                            isSelectedm = false;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child:
                              ImageIcon(
                                  AssetImage('assets/trans.png'),
                              color: isSelectedo?Colors.white:Colors.black,
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*10.0/360.0),
                            Center(
                              child: Text('Other',
                                  style: TextStyle(
                                      color: isSelectedo?Colors.white:Colors.black,
                                      fontSize: MediaQuery.of(context).size.height*22.0/780.0,
                                      //fontWeight: FontWeight.bold,
                                      fontFamily: 'Pacifico')),
                            )
                          ],
                        ),


                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*80.0/780.0),
                    Container(
                        height: MediaQuery.of(context).size.height*40.0/780.0,
                      //color: Colors.pinkAccent[400],
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent[400],
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.pinkAccent,
                                  blurRadius: 3.5
                              )
                            ]
                        ),

                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/testpage');
                          },
                          child:

                          Center(
                            child: Text('Continue',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width*22.0/360.0,
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico',
                                )

                            ),
                          ),


                        ),
                      ),
                        ),
                  SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                  Container(
                    height: MediaQuery.of(context).size.height*40.0/780.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child:

                        Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*20.0/360.0,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Pacifico',
                              )
                          ),
                        ),


                      ),
                    ),
                  ),


                ],
              )),
          // SizedBox(height: 15.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       'New to Spotify?',
          //       style: TextStyle(
          //         fontFamily: 'Montserrat',
          //       ),
          //     ),
          //     SizedBox(width: 5.0),
          //     InkWell(
          //       child: Text('Register',
          //           style: TextStyle(
          //               color: Colors.green,
          //               fontFamily: 'Montserrat',
          //               fontWeight: FontWeight.bold,
          //               decoration: TextDecoration.underline)),
          //     )
          //   ],
          // )
        ])));
  }
}
