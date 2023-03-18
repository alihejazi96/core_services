import 'package:coreapp1/Login_page/screen/password_field.dart';
import 'package:coreapp1/Login_page/screen/welcome_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/colors.dart';
import 'email_field.dart';
import 'login_button.dart';
import '../../providers/provider_login_states.dart';
import 'loginpicture.dart';

class InitialState extends StatefulWidget {
  const InitialState({Key? key}) : super(key: key);

  @override
  _InitialStateState createState() => _InitialStateState();
}

class _InitialStateState extends State<InitialState> {
  States state = States.initial;
  var errorMessage = "";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginStates>(context);
    state = provider.state;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const LoginPicture(),
                const WelcomeText(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const SubWelcomText(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const EmailField(),
                      const PasswordField(),
                      Text(
                        'Forget Password?',
                        style: TextStyle(color: ColorApp.blackText),
                      ),
                      const LoginButton(),

                      Text(
                        state == States.failed ? errorMessage = "Login Faild" : errorMessage = "",

                        style: TextStyle(color: ColorApp.error),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
