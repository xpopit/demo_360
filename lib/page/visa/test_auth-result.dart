import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplive_mvp/models/event_bus.dart';
// import 'package:shoplive_mvp/page/widgets/image-display.dart';
import 'package:visa/auth-data.dart';
import 'package:shoplive_mvp/cls/cls.dart';
import 'package:shoplive_mvp/services/api_call.dart';
import 'package:shoplive_mvp/models/fb_accounts_data.dart';
// import 'app-scale.dart';

class AuthResult extends StatefulWidget {
  const AuthResult({Key key}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<AuthResult> {
  Widget build(BuildContext context) {
    // final AuthData authData = ModalRoute.of(context).settings.arguments;
    final AccountsData _accdata = Provider.of<AccountsData>(context);
    EventBus _evnt = Provider.of<EventBus>(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
      // ImageDisplay(
      //     height: 0.20,
      //     imageUrl: authData != null ? authData.profileImgUrl : null),
      RaisedButton(
          child: Text('Logout'),
          onPressed: () {
            _evnt.setStateLogout(true);
            Navigator.pushNamed(context, '/');
          })
    ])));
  }
}
