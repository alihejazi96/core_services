import 'package:coreapp1/Login_page/screen/initial_state.dart';
import 'package:coreapp1/home.dart';
import 'package:coreapp1/providers/provider_login_states.dart';
import 'package:coreapp1/facilities_page/facilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  States state = States.initial;

  var errorMessage = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginStates>(context);
    state = provider.state;
    return Scaffold(
      body: buildBody(),
    );
  }
  buildBody() {
    switch (state) {
      case States.initial:
        return const InitialState();
      case States.loading:
        return const Center(child: CircularProgressIndicator());
      case States.failed:
        return const InitialState();
      case States.succeeded:
        return const HomePage();
    }
  }
}
