import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color.fromARGB(255, 226, 15, 15), // Red color with full opacity
            ),
          ),
            onPressed: () {
           
            },
            child: Text('Button',style: TextStyle(
              color: Colors.white
            ),),
          ),
          Column(
            children: [
              Text('data'),
              Text('data'),
            ],
          ),
          Column(
            children: [
              Text('data'),
              Text('data'),
            ],
          )
        ],
      ),
    );
  }
}
