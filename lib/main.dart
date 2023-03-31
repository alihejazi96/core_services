import 'package:coreapp1/providers/provider_facilities_page.dart';
import 'package:coreapp1/providers/provider_login_states.dart';
import 'package:coreapp1/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  var app = MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LoginStates(),
    ),
    ChangeNotifierProvider(
      create: (context) => FacilitiesPageState(),
    ),
  ], child: const MyApp());
  runApp(app);

  // FacilitiesApi().getFacilities();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const Scaffold(
        body: HomePage(),

      ),
    );
  }
}
