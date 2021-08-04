import 'package:clgproject/screens/workout_screens/startMindWorkout1/nextWorkout.dart';
import 'package:clgproject/screens/workout_screens/startMindWorkout1/push_up.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../home_page.dart';

class JumpingJack extends StatefulWidget {
  @override
  _JumpingJackState createState() => _JumpingJackState();
}

class _JumpingJackState extends State<JumpingJack> {
  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    final CountdownController _controller = CountdownController();
    return WillPopScope(
      onWillPop: () {
        _controller.pause();
        return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return WillPopScope(
                onWillPop: () async{
                  _controller.resume();
                  Navigator.pop(context);
                  return false;
                },
                child: AlertDialog(
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
                  insetPadding: EdgeInsets.zero,
                ),
              );
            });
      },
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/jumpingJacks.gif'),
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
                        'Jumping Jacks',
                        style: TextStyle(fontSize: 36, fontFamily: 'Montserrat',color: Color(0xffececec)),
                      ),
                      Countdown(
                        controller: _controller,
                        seconds: 10,
                        build: (_, double time) {
                          if(time.toString() == '3.0'){
                            print('happened');
                            audioPlayer.play('countdown.wav');
                          }
                          return Text(
                          time.toString(),
                          style: TextStyle(
                              fontSize: 58, fontWeight: FontWeight.bold,color: Color(0xffececec)),
                        );},
                        onFinished: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return NextWorkout('Push Ups', PushUp(), 15);
                          }));
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          _controller.pause();
                          showDialog(
                            barrierColor: Color(0xee30475e),
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return WillPopScope(
                                  onWillPop: () async {
                                    _controller.resume();
                                    Navigator.pop(context);
                                    return false;
                                  },
                                  child: SimpleDialog(
                                    children: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            _controller.restart();
                                            Navigator.pop(context);
                                          },
                                          child: Text('Restart the Exercise',style: TextStyle(
                                            color: Color(0xfff2a365),
                                          ),)),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushAndRemoveUntil(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return HomePage();
                                                }), (Route<dynamic> route) => false);
                                          }, child: Text('Quit',style: TextStyle(
                                        color: Color(0xfff2a365),
                                      ),)),
                                      TextButton(
                                        onPressed: () {
                                          _controller.resume();
                                          Navigator.pop(context);
                                        },
                                        child: Text('Resume',style: TextStyle(
                                          color: Colors.blueAccent,
                                        ),),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xffececec)),
                                        ),
                                      ),
                                    ],
                                    backgroundColor: Color(0xee30475e),
                                  ),
                                );
                              });
                        },
                        child: Text('pause'),
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
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(onPressed: () {}, child: Text('previous',style: TextStyle(color: Colors.grey),)),
              TextButton(
                  onPressed: () {
                    _controller.pause();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return NextWorkout('Push Ups', PushUp(), 15);
                    }));
                  },
                  child: Text('Skip')),
            ],
          ),
        ),
      ),
    );
  }
}
