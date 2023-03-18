import 'package:coreapp1/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';


class EmailField extends StatefulWidget {
   const EmailField({Key? key}) : super(key: key);
  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final _formKey = GlobalKey<FormState>();
  late String _email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(color: ColorApp.fields),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.75,
          height: MediaQuery.of(context).size.height*0.05,
          child: Form(child: TextFormField(
              controller: TextEditingController(),
              validator: validateEmail,
              decoration:  InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorApp.fields
                    )
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                hintText: "Add email Here",hintStyle: TextStyle(color: ColorApp.fields),
                enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: ColorApp.fields)
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
String? validateEmail(String? email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (email != null && regExp.hasMatch(email)) {
    return null;
  } else {
    const String errorText = 'Please enter a valid email';
    return errorText;
  }
}