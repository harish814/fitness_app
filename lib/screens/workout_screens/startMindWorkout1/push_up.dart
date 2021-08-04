import 'package:clgproject/screens/workout_screens/startMindWorkout1/nextWorkout.dart';
import 'package:clgproject/screens/workout_screens/startMindWorkout1/jumping_jack.dart';
import 'package:clgproject/screens/workout_screens/startMindWorkout1/plank.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../../home_page.dart';

class PushUp extends StatefulWidget {
  @override
  _PushUpState createState() => _PushUpState();
}

class _PushUpState extends State<PushUp> {
  @override
  Widget build(BuildContext context) {
    final CountdownController _controller = CountdownController();
    return WillPopScope(
      onWillPop: (){
        _controller.pause();
        return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Do you want to Quit'),
                actions: [
                  TextButton(
                      onPressed: () {
                        _controller.pause();
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }), (Route<dynamic> route) => false);
                      },
                      child: Text('Quit'))
                ],
                insetPadding: EdgeInsets.zero,
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
                      image: AssetImage('images/pushups.gif'),
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
                      'Push ups',
                      style: TextStyle(fontSize: 36, fontFamily: 'Montserrat',color: Color(0xffececec)),
                    ),
                    Text(
                      '10 Reps',
                      style: TextStyle(fontSize: 36,color: Color(0xffececec)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                              return NextWorkout('Plank Hold', Plank(), 15);
                            }));
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
                _controller.pause();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return NextWorkout('Jumping Jacks', JumpingJack(), 15);
                    }));
              }, child: Text('previous')),

              TextButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return NextWorkout('Normal Plank', Plank(), 15);
                }));
              }, child: Text('Skip')),
            ],
          ),
        ),
      ),
    );
  }
}
