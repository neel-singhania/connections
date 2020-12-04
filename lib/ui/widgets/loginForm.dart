import 'package:connections_inc/bloc/authentication/authentication_bloc.dart';
import 'package:connections_inc/bloc/authentication/authentication_event.dart';
import 'package:connections_inc/bloc/login/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';
//import 'package:connections_inc/ui/constants.dart';
import 'package:connections_inc/ui/pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);

    super.initState();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
          email: _emailController.text, password: _passwordController.text),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Login Failed"),
                    Icon(Icons.error),
                  ],
                ),
              ),
            );
        }

        if (state.isSubmitting) {
          print("isSubmitting");
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(" Logging In..."),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }

        if (state.isSuccess) {
          print("Success");
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//            Container(
//              decoration: BoxDecoration(
//                color: Colors.yellowAccent[700]
//              ),
//            ),
                Container(
                  height: MediaQuery.of(context).size.height*15.0/780.0,
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
                        TextFormField(

                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                fontFamily: 'Pacifico',
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            hintText: 'email',
                            hintStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*14.0/780.0,
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
                            return state.isEmailValid ? null : null;
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password ',
                            labelStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                fontFamily: 'Pacifico',
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            hintText: 'Password ',
                            hintStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*14.0/780.0,
                                fontFamily: 'Pacifico',
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey),

//                            focusedBorder: UnderlineInputBorder(
//                                borderSide: BorderSide(color: Colors.yellowAccent[700])),
//                            enabledBorder: UnderlineInputBorder(
//                                borderSide: BorderSide(color: Colors.yellowAccent[700])),
                            focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellowAccent[700], width: 1),
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0),
                          ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0),
                            ),
                          ),
                          obscureText: true,
                          controller: _passwordController,
                          autocorrect: false,
                          autovalidate: true,
                          validator: (_){
                            return !state.isPasswordValid ? "Invalid Password" : null;
                          },
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
                          child: GestureDetector(
                            onTap: isLoginButtonEnabled(state)
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
                                child: Text('Login',
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context){
                                        return SignUp(userRepository: _userRepository,);
                                      }
                                    )
                                  );
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
            )
          );
        },
      ),
    );
  }
}
