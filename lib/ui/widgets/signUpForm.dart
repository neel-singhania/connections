import 'package:firebase_auth/firebase_auth.dart';
import 'package:connections_inc/bloc/authentication/authentication_bloc.dart';
import 'package:connections_inc/bloc/authentication/authentication_event.dart';
import 'package:connections_inc/bloc/signup/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import '../constants.dart';

class SignUpForm extends StatefulWidget {
  final UserRepository _userRepository;

  SignUpForm({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

//  Future<bool> phoneVerify(String phone, BuildContext context) async{
//    FirebaseAuth _auth = FirebaseAuth.instance;
//
//    _auth.verifyPhoneNumber(
//        phoneNumber: phone,
//        timeout: Duration(seconds: 120),
//        verificationCompleted: (AuthCredential credential) async{
//          AuthResult result = await _auth.signInWithCredential(credential);
//
//          FirebaseUser user= result.user;
//
//        },
//        verificationFailed: null,
//        codeSent: null,
//        codeAutoRetrievalTimeout: null)
//  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final TextEditingController _numberController = TextEditingController();

  SignUpBloc _signUpBloc;
  //UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty ;

  bool isSignUpButtonEnabled(SignUpState state) {
    return isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
     _signUpBloc= BlocProvider.of<SignUpBloc>(context);

    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);


    super.initState();
  }

  void _onFormSubmitted() {
    _signUpBloc.add(
      SignUpWithCredentialsPressed(
          email: _emailController.text, password: _passwordController.text,)
    );
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (BuildContext context, SignUpState state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Sign Up Failed"),
                    Icon(Icons.error),
                  ],
                ),
              ),
            );
        }
        if (state.isSubmitting) {
          print("isSubmitting");
          Scaffold.of(context)
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Signing up..."),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          print("Success");
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          0.0,
                          MediaQuery.of(context).size.height*120.0/780.0,
                          0.0,
                          MediaQuery.of(context).size.height*30.0/780.0),
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
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                fontFamily: 'Pacifico',
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            hintText: 'EMAIL',
                            hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                              fontFamily: 'Pacifico',
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellowAccent[700])),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellowAccent[700])),
                        ),
                        controller: _emailController,
                        autovalidate: true,
                        validator: (_){
                          return !state.isEmailValid ? "Invalid Email" : null;
                        },
                      ),
//                      SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
//                      TextFormField(
//                        decoration: InputDecoration(
//                          labelText: 'Phone number',
//                          labelStyle: TextStyle(
//                              fontSize: MediaQuery.of(context).size.height*20.0/780.0,
//                              fontFamily: 'Pacifico',
//                              //fontWeight: FontWeight.bold,
//                              color: Colors.grey),
//                          hintText: 'Phone number',
//                          hintStyle: TextStyle(
//                              fontSize: MediaQuery.of(context).size.height*20.0/780.0,
//                              fontFamily: 'Pacifico',
//                              //fontWeight: FontWeight.bold,
//                              color: Colors.grey),
//                          focusedBorder: UnderlineInputBorder(
//                              borderSide: BorderSide(color: Colors.yellowAccent[700])),
//                          enabledBorder: UnderlineInputBorder(
//                              borderSide: BorderSide(color: Colors.yellowAccent[700])),
//                        ),
//                        controller: _numberController,
//                        autovalidate: true,
//                        validator: (_){
//                          return !state.isNumberValid ? "Invalid Phone Number" : null;
//                        },
//                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password ',
                            labelStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                fontFamily: 'Pacifico',
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellowAccent[700])),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellowAccent[700])),
                        ),
                        obscureText: true,
                        controller: _passwordController,
                        autocorrect: false,
                        autovalidate: true,
                        validator: (_){
                          return !state.isPasswordValid ? "Invalid Password" : null;
                        },
                      ),
                      //SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
//                      TextField(
//                        decoration: InputDecoration(
//                            labelText: 'Confirm Password ',
//                            labelStyle: TextStyle(
//                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
//                                fontFamily: 'Pacifico',
//                                //fontWeight: FontWeight.bold,
//                                color: Colors.grey),
//                            focusedBorder: UnderlineInputBorder(
//                                borderSide: BorderSide(color: Colors.yellowAccent[700]))),
//                        obscureText: true,
//                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*85.0/780.0),

                      GestureDetector(
                        onTap: isSignUpButtonEnabled(state)
                            ? _onFormSubmitted
                            : null,
                        child: Container(
                          height: MediaQuery.of(context).size.height*40.0/780.0,
                          //color: Colors.transparent,
                          decoration: BoxDecoration(
                              color: Colors.yellowAccent[700],
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.yellow[400],
                                    blurRadius: 3.5
                                )
                              ],
                            ),

                              child: Center(
                                child: Text('Signup',
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height*22.0/780.0,
                                        color: Colors.brown[700],
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: 'Pacifico')),
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
            ])
          );
        },
      ),
    );
  }

  void _onEmailChanged() {
    _signUpBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _signUpBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

//  void _onNumberChanged() {
//    _signUpBloc.add(
//      NumberChanged(number: _numberController.text),
//    );
//  }
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }
}
