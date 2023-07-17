import 'package:flutter/material.dart';

import '../constan/constan.dart';

class TextFormFieldWidget extends StatelessWidget {
  String text;
  TextEditingController controller;
  bool obscureText;
  bool readOnly;
  Widget iconWidget;
  bool prefixIcon;
  bool suffixIcon;
  int maxLine = 1;
  TextInputType inputType;

  TextFormFieldWidget(
      {super.key,
      required this.text,
      required this.controller,
      required this.obscureText,
      required this.readOnly,
      required this.iconWidget,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.inputType,
      required this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(5),
              child: Text(
                text,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              )),
          TextFormField(
            maxLines: maxLine,
            keyboardType: inputType,
            readOnly: readOnly,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
                filled: true,
                fillColor: whiteColor,
                prefixIcon: (prefixIcon == false) ? null : iconWidget,
                suffixIcon: (suffixIcon == false) ? null : iconWidget,
                isDense: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                    borderRadius: BorderRadius.circular(15))),
          ),
        ],
      ),
    );
  }
}
