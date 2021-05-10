import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learnbowl/Authentication.dart';
import 'package:learnbowl/helper/iconhelper.dart';
import 'package:learnbowl/pages/categorylistpage.dart';
import 'package:learnbowl/widget/IconFont.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashpage(
        duration: 3,
        goToPage: WelcomePage(),
      )));
}

class Splashpage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  Splashpage({this.duration, this.goToPage});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
        body: Container(
            color: Color(0xFF80C038),
            alignment: Alignment.center,
            child: Iconfont(
              color: Colors.white,
              iconName: IconFontHelper.LOGO,
              size: 100,
            )));
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: FutureBuilder<FirebaseApp>(
                future: Firebase.initializeApp(),
                builder: (context, snapshot) {
                  print(snapshot.hasData);
                  return !snapshot.hasData
                      ? Container()
                      : StreamBuilder<User>(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (context, snapshot) {
                            return snapshot.data != null
                                ? CategoryListPage()
                                : Center(
                                    child: Column(children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: FlatButton(
                                          //onPressed: () { },
                                          child: Text('Click here to Login',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: FlatButton(
                                        color: Color(0xFF80c038),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        padding: EdgeInsets.all(25),
                                        child: Text('Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        onPressed: () {
                                          Authentication.signInWithGoogle(
                                              context: context);
                                          // Navigator.push(
                                          //   context, MaterialPageRoute(builder: (context) => CategoryListPage()));
                                        },
                                      ),
                                    ),
                                  ]));
                          });
                })));
  }
}
