import 'package:flutter/cupertino.dart';

class LoginPicture extends StatelessWidget {
  const LoginPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30,bottom: 50),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("images/logpic.png"),
        ),
      ),
    );
  }
}
