import 'package:clgproject/home_page.dart';
import 'package:clgproject/screens/workout_screens/startMindWorkout1/plank.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';

import 'nextWorkout.dart';

class Squats extends StatefulWidget {
  @override
  _SquatsState createState() => _SquatsState();
}

class _SquatsState extends State<Squats> {
  @override
  Widget build(BuildContext context) {
    final CountdownController _controller = CountdownController();
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('Do you want to Quit'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }), (Route<dynamic> route) => false);
                      },
                      child: Text('Quit'))
                ],
              );
            });
      },
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/squats.gif'),
                      fit: BoxFit.contain,
                    ),
                    gradient: LinearGradient(colors: [Colors.cyan,Colors.blue],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: Color(0xff222831),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Squats',
                      style: TextStyle(fontSize: 36, fontFamily: 'Montserrat',color: Color(0xffececec)),
                    ),
                    Text(
                      '10 Reps',
                      style: TextStyle(fontSize: 36,color: Color(0xffececec)),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return WillPopScope(
                                onWillPop: () async{
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(
                                          builder: (context) {
                                            return HomePage();
                                          }), (Route<dynamic> route) => false);
                                  return false;
                                },
                                child: AlertDialog(
                                  title: Text(
                                      'YOU HAVE COMPLETED THE EXERCISE!!! CONGRATS',textAlign: TextAlign.center,),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return HomePage();
                                          }), (Route<dynamic> route) => false);
                                        },
                                        child: Icon(Icons.favorite))
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text('Done'),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xff30475e)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return NextWorkout('Plank Hold', Plank(), 15);
                    }));

              }, child: Text('previous')),
              TextButton(
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.grey),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
