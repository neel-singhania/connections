import 'package:flutter/material.dart';
import 'ouricon_icons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.yellowAccent[700],
        body:
//        Container(
//          decoration: BoxDecoration(
//              color: Colors.yellowAccent[700]
//          ),
//        ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Container(
//              decoration: BoxDecoration(
//                color: Colors.yellowAccent[700]
//              ),
//            ),
            Container(
              height: MediaQuery.of(context).size.height*50.0/780.0,
              decoration: BoxDecoration(
                color: Colors.yellowAccent[700],
              ),
            ),
            Container(
              child: Stack(

                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent[700]
                    ),
                  ),

                  Center(

//                    child: Icon(
//                    Ouricon.connections_inc_,
//                    color: Colors.grey[850],
//                    size: 150.0,
//                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*150/780.0,
                    decoration : BoxDecoration(
                      //color: Colors.yellowAccent[700],
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/logo-wobg.png'
                        ),
                        fit: BoxFit.fitHeight
                      )
                    )
                  ),

                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(0.0
                        , MediaQuery.of(context).size.height*120.0/780.0,
                        0.0,
                        0.0),
                    child: Center(
                    child: Text('Connections',
                        style: TextStyle(
                          color: Colors.brown[700],
                            fontSize: MediaQuery.of(context).size.height*60.0/780.0,
                        fontFamily: 'Pacifico',
                        ))),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height*180.0/780.0, 0.0, 0.0),
                    child: Center(
                      child:Text('Inc.',
                        style: TextStyle(
                          color: Colors.brown[700],
                          fontSize: MediaQuery.of(context).size.height*60.0/780.0,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*45.0/780.0,
                    left: MediaQuery.of(context).size.width*20.0/360.0,
                    right: MediaQuery.of(context).size.width*20.0/360.0,
                    bottom: MediaQuery.of(context).size.height*10.0/780.0),
                //margin: EdgeInsets.only(left:10.0,right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[700],
                            blurRadius: 7.0
                    )
                  ]
                ),

                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                              fontFamily: 'Pacifico',
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellowAccent[700]))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                              fontFamily: 'Pacifico',
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellowAccent[700]))),
                      obscureText: true,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*5.0/780.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*15.0/780.0, left: MediaQuery.of(context).size.width*20.0/360.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height*18.0/780.0,
                              color: Colors.yellowAccent[700],
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Pacifico',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*65.0/780.0),
                    Container(
                      height: MediaQuery.of(context).size.height*40.0/780.0,
                      //color: Colors.pinkAccent[400],
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.yellowAccent[700],
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.yellow[400],
                                  blurRadius: 3.5
                              )
                            ]
                        ),

                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/profile1');
                          },
                          child:

                          Center(
                            child: Text('Login',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height*22.0/780.0,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Pacifico',
                                    color: Colors.brown[700]
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
//                            border: Border.all(
//                                color: Colors.black,
//                                style: BorderStyle.solid,
//                                width: 1.0),
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child:
                              ImageIcon(AssetImage('assets/facebook.png')),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*10.0/360.0),
                            Center(
                              child: Text('Log in with facebook',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                      //fontWeight: FontWeight.bold,
                                      fontFamily: 'Pacifico')),
                            )
                          ],
                        ),
                      ),

                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*15.0/780.0),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Text(
                            'New to Connections Inc. ?',
                            style: TextStyle(fontFamily: 'Pacifico'),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*5.0/360.0),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.yellowAccent[700],
                                  fontFamily: 'Pacifico',
                                  //fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ),
//                    Container(
//                      height: 34.0,
//                    )
                  ],
                )),
            //SizedBox(height: 15.0),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  'New to Connections Inc. ?',
//                  style: TextStyle(fontFamily: 'Pacifico'),
//                ),
//                SizedBox(width: 5.0),
//                InkWell(
//                  onTap: () {
//                    Navigator.of(context).pushNamed('/signup');
//                  },
//                  child: Text(
//                    'Register',
//                    style: TextStyle(
//                        color: Colors.yellowAccent[700],
//                        fontFamily: 'Pacifico',
//                        //fontWeight: FontWeight.bold,
//                        decoration: TextDecoration.underline),
//                  ),
//                )
//              ],
//            )
          ],
        ));
  }
}
