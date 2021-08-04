import 'package:clgproject/screens/workout_screens/startMindWorkout1/nextWorkout.dart';
import 'package:clgproject/screens/workout_screens/startMindWorkout1/jumping_jack.dart';
import 'package:flutter/material.dart';
import '../../sabt.dart';

class MindWorkout1 extends StatefulWidget {
  @override
  _MindWorkout1State createState() => _MindWorkout1State();
}

class _MindWorkout1State extends State<MindWorkout1> {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            primary: true,
            pinned: true,
            backgroundColor: Color(0xff222831),
            expandedHeight: 200,
            title: SABT(
                child: Text(
              'One Punch Man',
              style: TextStyle(color: Color(0xffececec)),
            )),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/onePunchMan.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ), //SliverAppBar
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                horizontalTitleGap: -20,
                leading: Container(
                  height: 20,
                  width: 5,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10)),
                ),
                title: Text(
                  '16 Exercises • 10 Minutes',
                  style: TextStyle(color: Colors.greenAccent),
                ),
              ),
              Divider(
                color: Color(0xffececec),
                thickness: 1,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                elevation: 5,
                shadowColor: Color(0xffa72693),
                color: Color(0xffececec),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 65,
                      width: 65,
                      child: Image(
                        image: AssetImage('images/jumpingJack.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Jumping Jacks',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xff30475e),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '15 Sec',
                          style: TextStyle(color: Color(0xfff2a365)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                elevation: 5,
                shadowColor: Color(0xffa72693),
                color: Color(0xffececec),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 65,
                      width: 65,
                      child: Image(
                        image: AssetImage('images/pushUp.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Push ups',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xff30475e),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '10 Reps',
                          style: TextStyle(color: Color(0xfff2a365)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                elevation: 5,
                shadowColor: Color(0xffa72693),
                color: Color(0xffececec),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 65,
                      width: 65,
                      child: Image(
                        image: AssetImage('images/plank.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Plank Hold',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xff30475e),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '15 Sec',
                          style: TextStyle(color: Color(0xfff2a365)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                elevation: 5,
                shadowColor: Color(0xffa72693),
                color: Color(0xffececec),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 65,
                      width: 65,
                      child: Image(
                        image: AssetImage('images/jumpingJack.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Jumping Jacks',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xff30475e),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '15 Sec',
                          style: TextStyle(color: Color(0xfff2a365)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                elevation: 5,
                shadowColor: Color(0xffa72693),
                color: Color(0xffececec),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 66,
                      width: 65,
                      child: Image(
                        image: AssetImage('images/squats.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Squats',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xff30475e),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '10 Reps',
                          style: TextStyle(color: Color(0xfff2a365)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]), //SliverChildBuildDelegate
          ) //SliverList
        ], //<Widget>[]
      ), //CustonScrollView
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blueAccent,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NextWorkout('Jumping Jacks', JumpingJack(), 10);
            }));
          },
          child: Text(
            'START',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
