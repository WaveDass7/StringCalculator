import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller =  TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          body:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             const Text("Calculated Output",
             style: TextStyle(
               color: Colors.green,
               fontSize: 20,
             ),),
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

                   },
                   child: const Text("Calculate"),
                 )
               ],
             )
           ],
          ),
     )
    );

  }
}
