import 'package:coreapp1/constant/text_sizes.dart';
import 'package:flutter/cupertino.dart';
import '../../constant/colors.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome Again!",
      style: TextStyle(
          color: ColorApp.bigText,
          fontWeight: FontWeight.bold,
          fontSize: bigTextFontSize
      ),
    );
  }
}

class SubWelcomText extends StatelessWidget {
  const SubWelcomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "We are happy to see you again!",
      style: TextStyle(
          color: ColorApp.subText,
          fontSize: subTextFontSize
      ),
    );
  }
}