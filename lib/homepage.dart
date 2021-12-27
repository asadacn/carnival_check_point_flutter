import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String _url_crm = "https://reportpanel.carnival.com.bd/partnercrm/index.php";
  String _url_olt = "http://172.30.23.58";
  String _url_self_care = "https://selfcare.carnival.com.bd/";
  String _url_hotspot = "http://bokshiganj.carnival.com.bd";
  String _url_fb = 'https://fb.com/CarnivalBakshiganj';
  String _url_ftp = "http://nagordola.com.bd/";

  // int checkInt = 0;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   Future<int> a = CheckInternet().checkInternetConnection();
  //   a.then((value) {
  //     if (value == 0) {
  //       setState(() {
  //         checkInt = 0;
  //       });
  //       print('No internet connect');
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('No internet connection!'),
  //       ));
  //     } else {
  //       setState(() {
  //         checkInt = 1;
  //       });
  //       print('Internet connected');
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('Connected to the internet'),
  //       ));
  //     }
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Carnival Check Point'),
        centerTitle: true,
        elevation: 0,
      ),

        drawer : Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Carnival Check Point'),
              ),
              ListTile(
                leading: const Icon(Icons.build),
                title: const Text('Configuration'),
                onTap: () {
                  // Update the state of the app.

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  // Update the state of the app.

                  Navigator.pop(context);

                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Exit'),
                onTap: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }

                },
              ),
            ],
          ),
        ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launch("tel:09642111333");
        },
        tooltip: 'Carnival Core Helpline',
        icon: const Icon(Icons.call),
        label: const Text('Core Helpline'),

        backgroundColor: Colors.red,


      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(100, 50, 10, 10),
        child: RichText(
          text: TextSpan(
            text: 'Carnival Internet - ',
            style: TextStyle(color: Colors.black),
            recognizer: TapGestureRecognizer()..onTap = () => _launchURL(_url_fb),
            children: [
              TextSpan(
                text: '@Bakshiganj',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = () => _launchURL(_url_fb),
              )
            ],
          ),
          // textAlign: TextAlign.center,
        ),
      ),
      body: Center(

        child: SingleChildScrollView(

          child: Column(

            children: [
             Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _launchURL(_url_crm);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.admin_panel_settings, size: 50),
                        title: Text('CRM PANEL'),
                        subtitle: Text('Carnival panel'),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _launchURL(_url_self_care);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.touch_app, size: 50),
                        title: Text('SELF CARE'),
                        subtitle: Text('Carnival Self Care'),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _launchURL(_url_olt);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.device_hub, size: 50),
                        title: Text('OLT'),
                        subtitle: Text('OLT Management'),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _launchURL(_url_hotspot);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.wifi, size: 50),
                        title: Text('WIFI HUT'),
                        subtitle: Text('Carnival Hotspot'),
                      ),
                    ],
                  ),
                ),
              ),


              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _launchURL(_url_ftp);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.link, size: 50),
                        title: Text('FTP SERVER'),
                        subtitle: Text('Carnival Nagordola FTP Server'),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
