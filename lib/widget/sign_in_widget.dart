import 'package:clgproject/home_page.dart';
import 'package:clgproject/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildSignupWidget();
  }

  Widget BuildSignupWidget(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover
        ),
        color: Color(0xff000a33),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child:  Text(
                'hey Champ welcome to the App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 12,
          ),
          button(),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text('Login to Continue',
            style: TextStyle(
              color: Colors.white,
            ),),
          ),
          Skip(),
        ],
      ),
    );
  }
}
class button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
      onPressed: (){
        final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
        provider.login();
      },
      label: Text(
        'Sign in with Google',
      ),
      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      highlightedBorderColor: Colors.white,
      borderSide: BorderSide(color: Colors.white),
      textColor: Colors.white,
      icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
    );
  }
}

class Skip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30),
      child: OutlineButton(
        onPressed: (){
          sharedpreferences();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
            return HomePage();
          }), (Route<dynamic> route)=>false);
        },
        child: Text('Skip'),
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        highlightedBorderColor: Colors.white,
        borderSide: BorderSide(color: Colors.white),
        textColor: Colors.white,
      ),
    );
  }
  Future<void> sharedpreferences() async{
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('loogedIN', true);
  }
}


