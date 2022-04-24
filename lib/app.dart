import 'package:flutter/material.dart';
import 'package:loginregister/widget/main_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Register App',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
