import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/dropdownJenisKelamin.dart';

class TemplateController extends GetxController {
  var selectedItem = "".obs;
  late TextEditingController jenisKelamin;

  List<DropdownListJenisKelamin> listItemJenisKelamin = [
    DropdownListJenisKelamin(id: '1', name: 'Laki -laki'),
    DropdownListJenisKelamin(id: '2', name: 'Perempuan')
  ];

  @override
  void onInit() {
    jenisKelamin = TextEditingController();
    super.onInit();
  }
}
