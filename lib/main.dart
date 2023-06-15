import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clone_zap_on/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_clone_zap_on/data/repositories/auth_repository.dart';
import 'package:flutter_clone_zap_on/screens/Splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context)),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Splash(),
          ),
      ),
    );
  }
}

