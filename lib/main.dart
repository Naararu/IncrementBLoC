import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la20_bloc/bloc/appBloc.dart';
import 'package:la20_bloc/page/halamanpage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appbloc(),
      child: MaterialApp(
        title: 'Flutter BLOC Increment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HalamanPage(),
      ),
    );
  }
}