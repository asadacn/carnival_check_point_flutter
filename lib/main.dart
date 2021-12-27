
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  // }
  // await FlutterDownloader.initialize(debug: true);
  // set true to enable printing logs to console
  //await Permission.storage.request();
  //await Permission.mediaLibrary.request();
  // ask for storage permission on app create

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carnival Check Point',
      theme: ThemeData(
          primarySwatch: Colors.blue, visualDensity: VisualDensity.standard),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// class Splash extends StatelessWidget {
//   const Splash({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     bool lightMode =
//         MediaQuery.of(context).platformBrightness == Brightness.light;
//     return Scaffold(
//       backgroundColor:
//       lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
//       body: Center(
//           child: lightMode
//               ? Image.asset('assets/carnival.png')
//               : Image.asset('assets/carnival.png')),
//     );
//   }
// }
//
// class Init {
//   Init._();
//   static final instance = Init._();
//
//   Future initialize() async {
//     // This is where you can initialize the resources needed by your app while
//     // the splash screen is displayed.  Remove the following example because
//     // delaying the user experience is a bad design practice!
//     await Future.delayed(const Duration(seconds: 3));
//   }
// }
