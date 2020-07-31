import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.pinkAccent[400],
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height*110.0/780.0, 0.0, MediaQuery.of(context).size.height*20.0/780.0),
                  child: Center(
                  child: Text(
                    'Complete',
                    style:
                    TextStyle(fontSize: MediaQuery.of(context).size.height*60.0/780.0,
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    ),
                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height*175.0/780.0, 0.0, MediaQuery.of(context).size.height*20.0/780.0),
                  child:Center(
                  child: Text(
                    'your profile',
                    style:
                    TextStyle(fontSize: MediaQuery.of(context).size.height*60.0/780.0,
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*40.0/780.0),
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*50.0/780.0,
                  left: MediaQuery.of(context).size.width*20.0/360.0,
                  right: MediaQuery.of(context).size.width*20.0/360.0,
                  bottom: MediaQuery.of(context).size.height*111/780.0),
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
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'First  Name',
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                            fontFamily: 'Pacifico',
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pinkAccent[400]))),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                            fontFamily: 'Pacifico',
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pinkAccent[400]))),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
//                  TextField(
//                    decoration: InputDecoration(
//                        labelText: 'DD/MM/YYYY',
//                        labelStyle: TextStyle(
//                          fontSize: 20.0,
//                            fontFamily: 'Pacifico',
//                            //fontWeight: FontWeight.bold,
//                            color: Colors.grey),
//                        focusedBorder: UnderlineInputBorder(
//                            borderSide: BorderSide(color: Colors.pinkAccent[400]))),
//                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*95.0/780.0),
                    Container(
                      height: MediaQuery.of(context).size.height*40.0/780.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
//                      border: Border.all(
//                      color: Colors.black,
//                      style: BorderStyle.solid,
//                      width: 1.0),
                        color: Colors.pinkAccent[400],
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.pinkAccent,
                                  blurRadius: 3.5
                              )
                            ]
                        ),
                          child: InkWell(
                            onTap: () {
                               Navigator.of(context).pushNamed('/profile2');
                             },
                             child: Center(
                                child: Text('Continue',
                                 style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height*22.0/780.0,
                                   color: Colors.white,
                                   //fontWeight: FontWeight.bold,
                                    fontFamily: 'Pacifico')),
                             ),
                          ),
                     ),),
//                  Container(
//                      height: 40.0,
//                      child: Material(
//                        borderRadius: BorderRadius.circular(20.0),
//                        shadowColor: Colors.pinkAccent,
//                        color: Colors.pinkAccent[400],
//                        elevation: 7.0,
//                        child: GestureDetector(
//                          onTap: () {
//                            Navigator.of(context).pushNamed('/profile2');
//                          },
//                          child: Center(
//                            child: Text(
//                              'Continue',
//                              style: TextStyle(
//                                fontSize: 22.0,
//                                  color: Colors.white,
//                                  //fontWeight: FontWeight.bold,
//                                  fontFamily: 'Pacifico'),
//                            ),
//                          ),
//                        ),
//                      ),

//                  SizedBox(height: 20.0),
//                  Container(
//                    height: 40.0,
//                    color: Colors.transparent,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          border: Border.all(
//                              color: Colors.black,
//                             style: BorderStyle.solid,
//                             width: 1.0),
//                          color: Colors.transparent,
//                          borderRadius: BorderRadius.circular(20.0)),
//                      child: InkWell(
//                        onTap: () {
//                          Navigator.of(context).pop();
//                        },
//                        child:
//
//                        Center(
//                         child: Text('Go Back',
//                            style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                  fontFamily: 'Montserrat')),
//                        ),
//
//
//                      ),
//                    ),
//                  ),
                ],
              )),

        ]));
  }
}
