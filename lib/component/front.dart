import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_game/component/front2.dart';
import 'package:lottie/lottie.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('flappy bird'),titleSpacing: 130,
        backgroundColor: Colors.cyan,),
        body:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [Center(
          child: Lottie.network('https://lottie.host/b5019dd5-2214-4d37-8caa-aeda9a47b695/kwrJRdO15o.json'),

        ),

    ElevatedButton(onPressed:
    (){Navigator.push(context,MaterialPageRoute(builder: (context)=>front2()),);},
         child:Text('start'),
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.cyan,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),

    ),
    elevation: 5
    )

    )],),

      ),)

    );
  }
}