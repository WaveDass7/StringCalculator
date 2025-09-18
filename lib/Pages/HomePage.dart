import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/counter_event.dart';
import '../Bloc/counter_state.dart';
import '../Bloc/counterbloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('String Calculator',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),),
            backgroundColor: Colors.white,
            centerTitle: false,
          ) ,
          body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black12


              ),

              child: Column(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 BlocBuilder<CounterBloc, CounterState>(
                   builder: (context, state) {
                     if (state is CounterResult) {
                       return Text("Result: ${state.sum}",
                           style: TextStyle(fontSize: 20));
                     } else if (state is CounterError) {
                       return Text(state.message,
                           style: TextStyle(fontSize: 16, color: Colors.red));
                     }
                     return Text("Enter numbers to calculate.");
                   },
                  ),
                  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                     controller: _controller,
                     style: const TextStyle(
                      color: Colors.black54,
                     ),
                     decoration: const InputDecoration(
                       labelText: "Enter numbers string",
                       labelStyle: TextStyle(
                         color: Colors.black54,
                       ),
                       hintText: "e.g. 1,2,3 or //;\n1;2",
                     ),
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                         foregroundColor: Colors.white,
                         shadowColor: Colors.black,
                         elevation: 5,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12),
                         ),
                       ),
                       onPressed: () {
                         bloc.add(CalculateSum(_controller.text));
                       },
                       child: const Text("Calculate"),
                     )
                   ],
                 )
               ],
              ),
            ),
          ),
     )
    );

  }
}
