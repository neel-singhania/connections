import 'package:flutter/material.dart';




class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellowAccent[700],
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height*120.0/780.0, 0.0, MediaQuery.of(context).size.height*30.0/780.0),
                  child: Center(
                    child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.brown[700],
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
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*45.0/780.0,
                  left: MediaQuery.of(context).size.width*20.0/360.0,
                  right: MediaQuery.of(context).size.width*20.0/360.0,
                  bottom: MediaQuery.of(context).size.height*59/780.0),
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*40.0/780.0),
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
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellowAccent[700]))),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Password ',
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                            fontFamily: 'Pacifico',
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellowAccent[700]))),
                    obscureText: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Confirm Password ',
                        labelStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                            fontFamily: 'Pacifico',
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellowAccent[700]))),
                    obscureText: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*85.0/780.0),

                  Container(
                    height: MediaQuery.of(context).size.height*40.0/780.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
//                          border: Border.all(
//                              color: Colors.black,
//                              style: BorderStyle.solid,
//                              width: 1.0),
                          color: Colors.yellowAccent[700],
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.yellow[400],
                                blurRadius: 3.5
                            )
                          ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/profile1');
                        },
                        child:

                        Center(
                          child: Text('Continue',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*22.0/780.0,
                                color: Colors.brown[700],
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico')),
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
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child:

                        Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico')),
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
          //       'New to Mate Up?',
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
        ]));
  }
}
