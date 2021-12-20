import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class MyScratchCardViewScreen extends StatefulWidget {
  @override
  _MyScratchCardViewScreenState createState() => _MyScratchCardViewScreenState();
}

class _MyScratchCardViewScreenState extends State<MyScratchCardViewScreen> {

  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter Scratch Card View Sample')),
        body: Container(
          alignment: Alignment.center,
          child: FlatButton(
            onPressed: (){
              scratchCardDialogWidget(context);
            },
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            color: Colors.orangeAccent,
            child: Text("Scratch Card",
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),),
          ),
        ));
  }

  Future<void> scratchCardDialogWidget(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: Column(
              children: [
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: Text("Congratulations!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Scratcher(
                color: Colors.orangeAccent,
                accuracy: ScratchAccuracy.low,
                threshold: 25,
                brushSize: 50,
                onThreshold: () {
                  setState(() {
                    opacity = 1;
                  });
                },
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: opacity,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Text("You Have Earned",style: TextStyle(fontSize: 20),),
                        SizedBox(height: 50),
                        Text("143",style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        }
    );
  }
}
