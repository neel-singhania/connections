import 'package:flutter/material.dart';
//import 'ui/Constants.dart';
class IntraExtra extends StatefulWidget {
  @override
  _IntraExtraState createState() => _IntraExtraState();
}

class _IntraExtraState extends State<IntraExtra> {
bool ischecked = false;
  Widget questions(String ques,String ans1,String ans2,String ans3) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      //rgin: EdgeInsets.only(left:10.0),
      //margin: EdgeInsets.only(left: 10.0,top:15.0,bottom: 25.0,right: 10.0),
      margin: EdgeInsets.only(bottom: 35.0),
      decoration: BoxDecoration(
        color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.white,
              padding: EdgeInsets.fromLTRB(15.0,15.0,15.0,15.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ques,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey,
//                      blurRadius: 12.0,
//                    )
//                  ]
              ),
            ),
            SizedBox(height: 5.0,),

            CheckboxListTile(
                title: Text(
                  ans1,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
                checkColor: Colors.white,
                activeColor: Colors.limeAccent,
                value: ischecked,
                onChanged: (bool value){
                  print(value);
                  setState(() {
                    ischecked=value;
                  });
                  print(value);
                },
              ),
//                Container(
//                  height: 40.0,
//                  child: Text(
//                    ans1,
//                    style: TextStyle(
//                      fontSize: 18.0,
//
//                    ),
//                  ),
//
//                )

            Container(
              //color: Colors.white,
              //padding: EdgeInsets.all(10.0),
              padding: EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
              //margin: EdgeInsets.only(right: 35.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ans2,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(20.0),
                  borderRadius: BorderRadius.circular(5.0),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    )
                  ]
              ),
            ),
            Container(
              //color: Colors.white,
              //padding: EdgeInsets.all(10.0),
              padding: EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
              //margin: EdgeInsets.only(right: 35.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ans3,
                style: TextStyle(
                  fontFamily: 'Calibri',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
 //                 borderRadius: BorderRadius.circular(20.0),
                  borderRadius: BorderRadius.circular(5.0),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    )
                  ]
              ),
            ),
          ],
        ),
      ),

    );

//      }
//    );
  }

  Widget questions2(String ques,String ans1,String ans2,String ans3) {
    return Container(
      padding: EdgeInsets.all(20.0),
      //margin: EdgeInsets.only(left:10.0),
//      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
          bottomLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.white,
              //padding: EdgeInsets.fromLTRB(5.0,35.0,30.0,0.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ques,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              decoration: BoxDecoration(
//                color: Colors.,
                borderRadius: BorderRadius.circular(20.0),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey,
//                      blurRadius: 12.0,
//                    )
//                  ]
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              //color: Colors.white,
//              padding: EdgeInsets.fromLTRB(0.0,5.0,5.0,5.0),
//              margin: EdgeInsets.only(left: 35.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ans1,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    )
                  ]
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              //color: Colors.white,
              //padding: EdgeInsets.all(10.0),
//              padding: EdgeInsets.fromLTRB(0.0,5.0,5.0,5.0),
//              margin: EdgeInsets.only(left: 35.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ans2,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(20.0),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),bottomLeft: Radius.circular(5.0)),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    )
                  ]
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              //color: Colors.white,
              padding: EdgeInsets.all(5.0),
//              padding: EdgeInsets.fromLTRB(0.0,5.0,5.0,5.0),
//              margin: EdgeInsets.only(left: 35.0),
              child: Center(
                child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ans3,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),),
              decoration: BoxDecoration(
                  color: Colors.white,
                  //                 borderRadius: BorderRadius.circular(20.0),
                  borderRadius: BorderRadius.circular(5.0),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    )
                  ]
              ),
            ),
          ],
        ),
      ),

    );

//      }
//    );
  }





  Widget question(String ques,String ans1,String ans2) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      //margin: EdgeInsets.only(left:10.0),
      margin: EdgeInsets.only(left: 10.0,top:15.0,bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.teal[400],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(80.0),
          topRight: Radius.circular(5.0),
          bottomLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.white,
              padding: EdgeInsets.fromLTRB(35.0,35.0,0.0,0.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ques,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey,
//                      blurRadius: 12.0,
//                    )
//                  ]
              ),
            ),
            SizedBox(height: 5.0,),
            Container(
              //color: Colors.white,
              padding: EdgeInsets.fromLTRB(5.0,5.0,0.0,5.0),
              margin: EdgeInsets.only(right: 35.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ans1,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15.0),bottomRight: Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    )
                  ]
              ),
            ),
            Container(
              //color: Colors.white,
              //padding: EdgeInsets.all(10.0),
              padding: EdgeInsets.fromLTRB(5.0,5.0,0.0,5.0),
              margin: EdgeInsets.only(right: 35.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ans2,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(20.0),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15.0),bottomRight: Radius.circular(5.0)),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    )
                  ]
              ),
            ),
//            Container(
//              //color: Colors.white,
//              //padding: EdgeInsets.all(10.0),
//              padding: EdgeInsets.fromLTRB(5.0,5.0,0.0,5.0),
//              margin: EdgeInsets.only(right: 35.0),
//              child: Text(
//                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
//                ans3,
//                style: TextStyle(
//                  fontFamily: 'Pacifico',
//                  fontSize: 20.0,
//                  color: Colors.black,
//                ),
//              ),
//              decoration: BoxDecoration(
//                  color: Colors.white,
//                  //                 borderRadius: BorderRadius.circular(20.0),
//                  borderRadius: BorderRadius.only(topRight: Radius.circular(15.0),bottomRight: Radius.circular(5.0)),
//
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey,
//                      blurRadius: 2.0,
//                    )
//                  ]
//              ),
//            ),
          ],
        ),
      ),

    );

//      }
//    );
  }

  Widget question2(String ques,String ans1,String ans2) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      //margin: EdgeInsets.only(left:10.0),
      margin: EdgeInsets.only(right: 10.0,top:15.0,bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.teal[400],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(80.0),
          bottomLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.white,
              padding: EdgeInsets.fromLTRB(5.0,35.0,30.0,0.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ques,
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey,
//                      blurRadius: 12.0,
//                    )
//                  ]
              ),
            ),
            SizedBox(height: 5.0,),
            Container(
              //color: Colors.white,
              padding: EdgeInsets.fromLTRB(5.0,5.0,0.0,5.0),
              margin: EdgeInsets.only(left: 35.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ans1,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.limeAccent[700],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),bottomLeft: Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    )
                  ]
              ),
            ),
            Container(
              //color: Colors.white,
              //padding: EdgeInsets.all(10.0),
              padding: EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
              margin: EdgeInsets.only(left: 35.0),
              child: Text(
                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
                ans2,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(20.0),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),bottomLeft: Radius.circular(5.0)),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    )
                  ]
              ),
            ),
//            Container(
//              //color: Colors.white,
//              //padding: EdgeInsets.all(10.0),
//              padding: EdgeInsets.fromLTRB(0.0,5.0,5.0,5.0),
//              margin: EdgeInsets.only(left: 35.0),
//              child: Text(
//                //'Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?',
//                ans3,
//                style: TextStyle(
//                  fontFamily: 'Pacifico',
//                  fontSize: 20.0,
//                  color: Colors.black,
//                ),
//              ),
//              decoration: BoxDecoration(
//                  color: Colors.white,
//                  //                 borderRadius: BorderRadius.circular(20.0),
//                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),bottomLeft: Radius.circular(5.0)),
//
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey,
//                      blurRadius: 2.0,
//                    )
//                  ]
//              ),
//            ),
          ],
        ),
      ),

    );

//      }
//    );
  }







  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
//          appBar: PreferredSize(
//            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*75.0/780.0),
//            child: AppBar(
//              elevation: 0.0,
//              title: Text('Something About You',
//                style: TextStyle(
//                    fontFamily: 'Pacifico',
//                    fontSize: MediaQuery.of(context).size.height*35.0/780.0,
//                    color: Colors.white
//                ),
//              ),
//              centerTitle: true,
//              backgroundColor: Colors.lightBlueAccent[400],
//            ),
//          ),
          backgroundColor: Colors.blueGrey[600],
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/test1.png'),
                fit: BoxFit.fill
              )
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Something About You',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Pacifico',
                      color: Colors.white

                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    primary: true,
                    //padding: EdgeInsets.only(left: 15.0,right: 15.0),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            children: <Widget>[
                              question("Your Favorite Celebrity comes to your college as a chief guest for an event. At the event’s Q&A round, you have a question that you want to ask them, what do you do?",
                                "You cannot muster the strength step up to the podium and ask the question and hence let it Pass",
                                "You go to the podium and ask your question without thinking twice",
                             ),
                              questions2("You are in the 2nd week of your newly started college life, sitting with your newly formed group of 5 friends in the canteen, which friend would you be?",
                                "The one who is Leading the conversation and making people laugh throughout the process",
                                "The one who is a teensy bit fiddly and not feeling confident enough to speak",
                                "The one who Makes Jokes & talks occasionally, speaking when they are spoken to",
                              ),
                              question("You feel more like yourself, when you are……?",
                                "Alone, in a quiet room with your thoughts",
                                "A Café full of people, hustling and bustling ",
                              ),
                              question2("How do you generally tend to spend your weekends mostly",
                                "Binge Watching your favorite Netflix Show",
                                "Going out with your gang and celebrating your free time",
                             ),
                              questions("How easy do you find it to say no to anything trivial?",
                                "Very- I do it all the time when it’s required",
                                "Can’t say no to anything, I’m a FOMO person",
                                "Feel pressured to say yes, but mostly I do what I want to",
                              ),
                              questions2("How do you feel when all the eyes around you are on you?",
                                "I feel good, as I don’t mind all the attention being centered on me",
                                "I feel intimidated and in a position in which I’m not very comfortable",
                                "Depends. If I’m with my family & friends, it’s fine, but with strangers? NO",
                              ),
                              SizedBox(height: 500.0,),
//                              Container(
//                                height: MediaQuery.of(context).size.height*40.0/780.0,
//                                //color: Colors.pinkAccent[400],
//                                child: Container(
//                                  decoration: BoxDecoration(
//                                      color: Colors.pinkAccent[400],
//                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0),
//                                      boxShadow: [
//                                        BoxShadow(
//                                            color: Colors.pinkAccent,
//                                            blurRadius: 3.5
//                                        )
//                                      ]
//                                  ),
//
//                                  child: InkWell(
//                                    onTap: () {
//                                      Navigator.of(context).pushNamed('/testpage');
//                                    },
//                                    child:
//
//                                    Center(
//                                      child: Text('Continue',
//                                          style: TextStyle(
//                                            fontSize: MediaQuery.of(context).size.width*22.0/360.0,
//                                            color: Colors.white,
//                                            //fontWeight: FontWeight.bold,
//                                            fontFamily: 'Pacifico',
//                                          )
//
//                                      ),
//                                    ),
//
//
//                                  ),
//                                ),
//                              ),
                            ],

                          )
                        )
                      ),
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
                    ],
                  ),
                ),
//                Container(
//                  height: MediaQuery.of(context).size.height*40.0/780.0,
//                  //color: Colors.pinkAccent[400],
//                  child: Container(
//                    decoration: BoxDecoration(
//                        color: Colors.pinkAccent[400],
//                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0),
//                        boxShadow: [
//                          BoxShadow(
//                              color: Colors.pinkAccent,
//                              blurRadius: 3.5
//                          )
//                        ]
//                    ),
//
//                    child: InkWell(
//                      onTap: () {
//                        Navigator.of(context).pushNamed('/testpage');
//                      },
//                      child:
//
//                      Center(
//                        child: Text('Continue',
//                            style: TextStyle(
//                              fontSize: MediaQuery.of(context).size.width*22.0/360.0,
//                              color: Colors.white,
//                              //fontWeight: FontWeight.bold,
//                              fontFamily: 'Pacifico',
//                            )
//
//                        ),
//                      ),
//
//
//                    ),
//                  ),
//                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
