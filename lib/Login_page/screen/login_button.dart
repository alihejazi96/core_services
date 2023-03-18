import 'package:coreapp1/providers/provider_login_states.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  LoginButtonState createState() => LoginButtonState();
}

class LoginButtonState extends State<LoginButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(
              backgroundColor: ColorApp.buttons,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              )
          ),
          onPressed: () { LoginStates().login(TextEditingController().text, "password"); },
          child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: ColorApp.whiteText,
                    fontWeight: FontWeight.bold),
              ))),
    );
  }
}
