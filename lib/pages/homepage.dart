import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/counter_event.dart';
import '../Bloc/counter_state.dart';
import '../Bloc/counter_bloc.dart';

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
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('String Calculator',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
            backgroundColor: Colors.black,
            centerTitle: false,
          ) ,
          body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white12
              ),
              child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 BlocBuilder<CounterBloc, CounterState>(
                   builder: (context, state) {
                     if (state is CounterResult) {
                       return Text("${state.sum}",
                           style: const TextStyle(fontSize: 25,
                           color: Colors.white));
                     } else if (state is CounterError) {
                       return Text(state.message,
                           style: const TextStyle(fontSize: 16, color: Colors.red));
                     }
                     return const Text("Enter numbers to calculate.");
                   },
                  ),
                  Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: TextField(
                     controller: _controller,
                     style: const TextStyle(
                      color: Colors.white,
                     ),
                     decoration: const InputDecoration(
                       labelText: "Enter any string with number",
                       labelStyle: TextStyle(
                         color: Colors.white,
                       ),
                       hintText: "e.g. 1,2,3 ",
                       hintStyle: TextStyle(
                         color: Colors.white54
                       )
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
                     ),
                     const SizedBox(width: 20,),
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.red,
                         foregroundColor: Colors.white,
                         shadowColor: Colors.black,
                         elevation: 5,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12),
                         ),
                       ),
                       onPressed: () {
                        _controller.clear();
                        bloc.add(CalculateSum(_controller.text));
                       },
                       child: const Text("Clear"),
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
