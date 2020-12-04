import 'package:connections_inc/bloc/authentication/authentication_bloc.dart';
import 'package:connections_inc/bloc/blocDelegate.dart';
import 'package:connections_inc/repository/userRepository.dart';
import 'package:connections_inc/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication/authentication_event.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  final UserRepository _userRepository = UserRepository();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: _userRepository)
        ..add(AppStarted()),
      child: Home(userRepository: _userRepository,)));
}
