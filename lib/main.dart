import 'package:cordova/app/app.dart';
import 'package:cordova/data/repositories/auth_repository/firebase_auth_repo.dart';
import 'package:cordova/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/pages/authentication/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(FirebaseAuthRepository()),
    ),
  ], child: const MyApp()));
}
