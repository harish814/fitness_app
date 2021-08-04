import 'package:clgproject/provider/google_sign_in.dart';
import 'package:clgproject/screens/relaxMindScreen/mind_wimhof.dart';
import 'package:clgproject/screens/workout_screens/mindWorkout1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  int _selectIndex = 0;
  Color drawerColor = Colors.white;
  bool drawerState = true;

  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: _selectIndex, length: 3, vsync: this);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xff000a33),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xffececec),
          ),
          backgroundColor: Color(0xff000a33),
          elevation: 0,
        ),
        drawer: Drawer(
          child: Container(
            color: Color(0xff000a33),
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 100,
                      child: Image.network(user.photoURL),
                    ),SizedBox(
                      height: 15,
                    ),
                    Text(
                      user.email,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),SizedBox(
                      height: 15,
                    ),
                    Text(
                      user.displayName,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      title: Text('Logout',style: TextStyle(color: Colors.white),),
                      onTap: () async{
                        final SharedPreferences pref = await SharedPreferences.getInstance();
                        if(pref.getBool('loogedIN') == true){
                          pref.remove('loogedIN');
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LogginScreen()), (Route<dynamic>route) => false);
                        }else {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context, listen: false);
                          provider.logout();
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
              fit: BoxFit.cover
            ),
            color: Color(0xff000a33),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Trainings of any\nDifficulty level',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffececec),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.greenAccent),
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          onTap: (int index) {
                            setState(() {
                              _selectIndex = index;
                            });
                          },
                          tabs: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Text('Home-Workout'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Text('Relax-Mind'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Text('Weight-Workout'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IndexedStack(
                        children: [
                          HomeWorkout(
                              screenWidth: screenWidth,
                              selectIndex: _selectIndex),
                          MindWorkout(
                              screenWidth: screenWidth,
                              selectIndex: _selectIndex),
                          WeightWorkout(
                              screenWidth: screenWidth,
                              selectIndex: _selectIndex),
                        ],
                        index: _selectIndex,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class WeightWorkout extends StatelessWidget {
  const WeightWorkout({
    Key key,
    @required this.screenWidth,
    @required int selectIndex,
  })  : _selectIndex = selectIndex,
        super(key: key);

  final double screenWidth;
  final int _selectIndex;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 10),
        child: Column(
          children: <Widget>[
            LayoutBuilder(builder: (context, BoxConstraints constraints) {
              return Container(
                width: constraints.maxWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: constraints.maxWidth * 0.48,
                      height: constraints.maxWidth * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple,
                      ),
                      child: Center(
                        child: Text(
                          'YET to COME',
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * 0.48,
                      height: constraints.maxWidth * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orangeAccent,
                      ),
                      child: Center(
                        child: Text(
                          'YET to COME',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
      maintainState: true,
      visible: _selectIndex == 2,
    );
  }
}

class MindWorkout extends StatelessWidget {
  const MindWorkout({
    Key key,
    @required this.screenWidth,
    @required int selectIndex,
  })  : _selectIndex = selectIndex,
        super(key: key);

  final double screenWidth;
  final int _selectIndex;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [homeBoxShadow],
                      image: DecorationImage(
                        image: AssetImage('images/yoga.png'),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.greenAccent,
                    ),
                    height: 200,
                    width: (screenWidth - 60) / 2,
                    child:Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        decoration: homeBoxDecoration,
                        child: Row(
                          children: [
                            VerticalDivider(
                              indent: 40,
                              endIndent: 40,
                              thickness: 3,
                              color: Colors.black,
                            ),
                            Text(
                              'WIM\nHOF',
                              style: homeTextStyle,
                            ),
                          ],
                        )),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MindWimhof()));
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                  ),
                  height: 200,
                  width: (screenWidth - 60) / 2,
                  child: Center(
                    child: Text(
                      'YET to COME',
                      style: homeTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrange,
                  ),
                  height: 200,
                  width: (screenWidth - 65) / 2,
                  child: Center(
                    child: Text(
                      'YET to COME',
                      style: homeTextStyle,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  height: 200,
                  width: (screenWidth - 65) / 2,
                  child: Center(
                    child: Text(
                      'YET to COME',
                      style: homeTextStyle,
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      maintainState: true,
      visible: _selectIndex == 1,
    );
  }
}

class HomeWorkout extends StatelessWidget {
  const HomeWorkout({
    Key key,
    @required this.screenWidth,
    @required int selectIndex,
  })  : _selectIndex = selectIndex,
        super(key: key);

  final double screenWidth;
  final int _selectIndex;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: <Widget>[
            ExerciseCard(workout1: MindWorkout1(),workout2: MindWorkout1(),image1: 'images/fullBody.jpg',
              image2: 'images/chest.jpg',name1: 'One\nPunch\nMan',name2: 'STILL\nYRT TO\nADD',
            ),
            SizedBox(
              height: 25,
            ),
            ExerciseCard(workout1: MindWorkout1(),workout2: MindWorkout1(),image1: 'images/core.jpg',
              image2: 'images/leg.jpg',name1: 'STILL\nYRT TO\nADD',name2: 'STILL\nYRT TO\nADD',
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      maintainState: true,
      visible: _selectIndex == 0,
    );
  }
}

class ExerciseCard extends StatelessWidget {

  ExerciseCard({this.workout1,this.workout2,this.image1,this.image2,this.name1,this.name2});

  final Widget workout1;
  final Widget workout2;
  final String image1;
  final String image2;
  final String name1;
  final String name2;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return workout1;
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [homeBoxShadow],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(image1),
                    fit: BoxFit.fill,
                  ),
                ),
                width: constraints.maxWidth * 0.48,
                height: constraints.maxWidth * 0.7,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: homeBoxDecoration,
                    child: Row(
                      children: [
                        VerticalDivider(
                          indent: 40,
                          endIndent: 40,
                          thickness: 3,
                          color: Colors.black,
                        ),
                        Text(
                          name1,
                          style: homeTextStyle,
                        ),
                      ],
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return workout2;
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    homeBoxShadow,
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage(image2),
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                width: constraints.maxWidth * 0.48,
                height: constraints.maxWidth * 0.7,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: homeBoxDecoration,
                    child: Row(
                      children: [
                        VerticalDivider(
                          indent: 40,
                          endIndent: 40,
                          thickness: 3,
                          color: Colors.black,
                        ),
                        Text(
                          name2,
                          style: homeTextStyle,
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
