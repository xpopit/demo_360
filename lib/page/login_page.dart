import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shoplive_mvp/page/visa/auth-page.dart';
import 'package:shoplive_mvp/page/visa/utils.dart';
import 'visa/app-scale.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Container(
                  color: HexColor('#f5f5f5'),
                  width: scale.ofWidth(1),
                  padding: EdgeInsets.fromLTRB(
                      0, scale.ofHeight(0.027), 0, scale.ofHeight(0.027)),
                  child: Column(children: [
                    Utils.getButton(
                        text: 'Sign up with Facebook',
                        color: HexColor('#4267B2'),
                        textColor: Colors.white,
                        icon: Image.asset('assets/fb.png',
                            width: scale.ofHeight(0.0245)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AuthPage(thirdParty: 'fb')),
                          );
                        }),
                  ])))),
    );
  }
}
