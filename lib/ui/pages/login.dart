import 'package:connections_inc/bloc/login/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';
import 'package:connections_inc/ui/widgets/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import '../constants.dart';

class Login extends StatelessWidget {
  final UserRepository _userRepository;

  Login({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.yellowAccent[700],
        body: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            userRepository: _userRepository,
          ),
          child: LoginForm(
            userRepository: _userRepository,
          ),
        ),
      ),
    );
  }
}
