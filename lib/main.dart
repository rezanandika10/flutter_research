import 'package:flutter/material.dart';
import 'package:flutter_research/home/screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
          title: 'Flutter Research',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routers.generateRouter,
          initialRoute: '/home_route'),
    );
  }
}
