import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Croassant',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Croassant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> croassantList = [];

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details){
          setState(() {
            croassantList.add(Croassant(details.globalPosition));
           }); 
        },
        child : Scaffold(body: croassantList.isEmpty 
          ? Center(child:Text("Tap for Croassant")) :
          Stack(
            children: croassantList
          ),
       ),
    );
  }
}



class Croassant extends StatelessWidget {
  var offset;
  Croassant(this.offset, {Key? key});
  @override

  Widget build(BuildContext context) {
    var size = 60.0;//Random().nextDouble() * (200 - 60) + 60;
    return Positioned(
      top: offset.dy - 10, 
      left:offset.dx - 10, 
      child: Transform.rotate(
        angle: Random().nextDouble() * (280 - 0) + 0 , 
        child: Center( child: Image.asset("assets/croassant.png",
          height: size, 
          width: size, 
        ),) 
      ), 
    );

  }

}
