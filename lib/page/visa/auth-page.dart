import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplive_mvp/models/event_bus.dart';
import 'package:shoplive_mvp/models/fb_accounts_data.dart';
import 'package:visa/engine/visa.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:visa/fb.dart';
import 'package:visa/auth-data.dart';
import 'package:shoplive_mvp/cls/cls.dart';

import 'package:shoplive_mvp/services/api_call.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key key, @required this.thirdParty}) : super(key: key);
  final String thirdParty;
  @override
  Widget build(BuildContext context) {
    WebView authenticate = _getThirdPartyAuth(context);
    return Scaffold(
      body: authenticate,
    );
  }

  WebView _getThirdPartyAuth(context) {
    EventBus _evnt = Provider.of<EventBus>(context);
    AccountsData _accdata = Provider.of<AccountsData>(context);
    void done(AuthData authData) {
      switch (thirdParty) {
        case 'fb':

          /// protection loop get facebook
          int count = 0;
          (count <= 2)
              ? ApiService().getGFBAccounts(authData.accessToken).then((_v) {
                  count++;
                  log.d(_v);
                  _accdata.setData(_v);
                  if (_accdata.data.length >= 1) {
                    count = 3;
                    Navigator.pushReplacementNamed(context, '/Home',
                        arguments: authData);
                  }
                })
              : log.e("error loop getFacebook");
          break;
        default:
          log.d(authData);
      }

      /// set autologin
      (_evnt.getStateLogout)
          ? _evnt.setStateLogout(false)
          : _evnt.setStateLogout(false);
    }

    var fbAuth = FacebookAuth();

    List<Visa> allProviders = [fbAuth];
    for (var provider in allProviders) {
      provider.debug = true;
    }

    switch (thirdParty) {
      case 'fb':
        return fbAuth.visa.authenticate(
            clientID: '481242729944873',
            redirectUri: 'https://lawlibrarykku.online:18443/',
            scope:
                'public_profile, email, publish_video, pages_show_list, pages_read_engagement, pages_manage_posts',
            state: 'fbAuth',
            newSession: _evnt.getStateLogout,
            onDone: done);
      default:
        return null;
    }
  }
}
