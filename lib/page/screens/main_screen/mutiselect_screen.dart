import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shoplive_mvp/cls/cls.dart';
import 'package:shoplive_mvp/models/event_bus.dart';
import 'package:shoplive_mvp/models/fb_accounts_data.dart';
import 'package:shoplive_mvp/page/screens/main_screen/stream_screen.dart';
import 'package:shoplive_mvp/page/screens/main_screen/webview.dart';

class MutiSelect extends StatelessWidget {
  final _multiSelectKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    final AccountsData _accdata = Provider.of<AccountsData>(context);
    // HomeScreenModels _homescreen = Provider.of<HomeScreenModels>(context);
    EventBus _evnt = Provider.of<EventBus>(context);
    final List<Data> _animals = _accdata.getData.data;
    print(_accdata);
    List<Data> _selected = [];
    try {
      List<MultiSelectItem<Data>> _items = [];
      _items =
          _animals.map((_v) => MultiSelectItem<Data>(_v, _v.name)).toList();
      return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {},
              child: Icon(Icons.arrow_back // add custom icons also
                  ),
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      _evnt.setStateLogout(true);
                      Navigator.pushNamed(context, '/');
                    },
                    child: Icon(
                      Icons.logout,
                      size: 26.0,
                    ),
                  )),
            ],
          ),
          body: (_items != null)
              ? Column(
                  children: <Widget>[
                    MultiSelectBottomSheetField(
                      initialChildSize: 0.4,
                      listType: MultiSelectListType.CHIP,
                      searchable: true,
                      buttonText: Text("#Tag"),
                      title: Text("#Tag"),
                      items: _items,
                      onConfirm: (values) {
                        _selected = values.cast<Data>();
                        log.d(_selected);
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (value) {
                          _selected.remove(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        decoration: InputDecoration(
                          labelText: "Comment",
                          hintText: "Comment",
                          suffix: InkWell(
                            child: Icon(Icons.clear),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                      margin: EdgeInsets.all(10),
                      child: AnimatedButton(
                        text: 'Continue..',
                        pressEvent: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.QUESTION,
                            headerAnimationLoop: false,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Continue',
                            desc: '',
                            buttonsTextStyle: TextStyle(color: Colors.black),
                            showCloseIcon: true,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebViewScreen()),
                              );
                              // _homescreen.setScreen("/select");
                            },
                          )..show();
                        },
                      ),
                    )
                  ],
                )
              : CircularProgressIndicator());
    } catch (e) {
      //  เช็ค error ค่า null
      return Text(e.toString());
    }
  }
}
