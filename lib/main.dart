import 'package:coreapp1/services/facilities_api.dart';
import 'package:coreapp1/ui/Login_page/login.dart';
import 'package:coreapp1/providers/provider_login_states.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  var app = MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LoginStates(),
    )
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
        body: Login(),

      ),
    );
  }
}
