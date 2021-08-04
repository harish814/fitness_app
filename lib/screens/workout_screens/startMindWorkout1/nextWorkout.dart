import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../home_page.dart';

class NextWorkout extends StatefulWidget {
  String name;
  Widget fun;
  int time;
  NextWorkout(String Name, Widget Fun, int Time) {
    name = Name;
    fun = Fun;
    time = Time;
  }
  @override
  _NextWorkoutState createState() => _NextWorkoutState();
}

class _NextWorkoutState extends State<NextWorkout> {
  final AudioCache audioPlayer = AudioCache();
  @override
  Widget build(BuildContext context) {
    final CountdownController _controller = CountdownController();
    return WillPopScope(
      onWillPop: () {
        return showDialog(
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
              );
            });
      },
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                  child: Center(
                    child: Text('Take Rest'),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.cyan,Colors.blue],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                  ),
            )),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Color(0xff222831),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'NEXT WORKOUT',
                    style: TextStyle(
                        color: Color(0xffececec),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: Color(0xffececec),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              _controller.pause();
                            },
                            child: Icon(
                              Icons.pause,
                              color: Color(0xfff2a365),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _controller.resume();

                            },
                            child: Icon(
                              Icons.play_arrow,
                              color: Color(0xfff2a365),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Center(
                          child: Countdown(
                            controller: _controller,
                            seconds: widget.time,
                            build: (_, double time) {
                              if(time.toString() == '3.0'){
                                print('happened');
                                audioPlayer.play('countdown.wav');
                              }
                              return Text(
                                time.toString(),
                                style: TextStyle(
                                    fontSize: 58,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffececec)),
                              );
                            },
                            onFinished: () {
                              _controller.pause();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return widget.fun;
                              }));
                            },
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xff30475e),
                            borderRadius: BorderRadius.circular(50)),
                        width: 150,
                        height: 150,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xfff2a365),
                        ),
                        onPressed: () {
                          _controller.pause();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return widget.fun;
                          }));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
