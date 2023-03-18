import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

bool passVisibility = true;

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(color: ColorApp.fields),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.05,
          child: TextFormField(
            obscureText: passVisibility,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorApp.fields)),
              suffixIcon: IconButton(
                icon:
                Icon(passVisibility ? Icons.visibility_off : Icons.visibility),
                color: ColorApp.fields,
                onPressed: () {
                  setState(() {
                    passVisibility = !passVisibility;
                  });
                },
              ),
              contentPadding:
              const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
              hintText: "************",
              hintStyle: TextStyle(color: ColorApp.fields),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorApp.fields)),
            ),
          ),
        )
      ],
    );
  }
}
