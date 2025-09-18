import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stringcalculator/Pages/homepage.dart';

import 'Bloc/calculate_logic.dart';
import 'Bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final CalculateLogic repository = CalculateLogic();

    return MaterialApp(
      title: 'String Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (_) => CounterBloc(repository),
          child: const HomePage()),
    );
  }
}

