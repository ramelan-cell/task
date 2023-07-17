import 'package:flutter/material.dart';

import '../model/dropdown.dart';

class DropdownWidget extends StatelessWidget {
  String selectName;
  List<DropdownList> listItem;
  dynamic value = '';
  TextEditingController controller;
  DropdownWidget(
      {required this.selectName,
      required this.listItem,
      required this.controller,
      this.value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(selectName),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButtonFormField<dynamic>(
                isDense: true,
                decoration: InputDecoration(border: InputBorder.none),
                hint: Text(
                  '- Pilih $selectName -',
                  style: TextStyle(fontSize: 14),
                ),
                // underline: SizedBox(),
                isExpanded: true,
                validator: (value) =>
                    value == null ? 'Please insert $selectName' : null,
                items: listItem.map((list) {
                  return DropdownMenuItem(
                    child: Text(
                      list.name,
                      style: TextStyle(fontSize: 14),
                    ),
                    value: list.id,
                  );
                }).toList(),
                value: value,
                onChanged: (e) {
                  controller.text = e;
                  print(controller.text);
                },
              )),
        ],
      ),
    );
  }
}
