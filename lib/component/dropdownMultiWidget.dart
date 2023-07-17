import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../constan/constan.dart';
import '../model/dropdownMulti.dart';

class DropDownMultiWidget extends StatelessWidget {
  String title;
  List<DropDownMultiList> listItem;
  RxList<dynamic> selectItem;
  DropDownMultiWidget(
      {required this.title,
      required this.listItem,
      required this.selectItem,
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
            child: Text(title),
          ),
          MultiSelectDialogField(
            buttonText: Text('Pilih'),
            buttonIcon: Icon(Icons.search),
            selectedColor: primaryColor,
            searchable: true,
            items: listItem.map((e) => MultiSelectItem(e, e.name)).toList(),
            listType: MultiSelectListType.LIST,
            onConfirm: (values) {
              selectItem.value = values;
              print(selectItem);
            },
          ),
        ],
      ),
    );
  }
}
