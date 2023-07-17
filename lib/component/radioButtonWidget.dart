import 'package:flutter/material.dart';
import '../model/radio.dart';

class RadioButtonWidget extends StatefulWidget {
  String title;
  TextEditingController controller;
  List<RadioModel> listItem;
  RadioButtonWidget(
      {required this.title,
      required this.controller,
      required this.listItem,
      super.key});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Text(widget.title),
        ),
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.listItem.length,
              itemBuilder: (context, i) {
                return RadioListTile(
                  dense: true,
                  title: Text(widget.listItem[i].title),
                  value: widget.listItem[i].value,
                  groupValue: widget.controller.text,
                  onChanged: (value) {
                    setState(() {
                      widget.controller.text = value.toString();
                    });
                  },
                );
              }),
        ),
      ],
    );
  }
}
