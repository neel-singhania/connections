import 'package:connections_inc/bloc/signup/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';
//import 'package:connections_inc/ui/constants.dart';
import 'package:connections_inc/ui/widgets/signUpForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  final UserRepository _userRepository;

  SignUp({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellowAccent[700],
        resizeToAvoidBottomPadding: false,
        body: BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(
            userRepository: _userRepository,
          ),
          child: SignUpForm(
            userRepository: _userRepository,
          ),
        ),
      ),
    );
  }
}
