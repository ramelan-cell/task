import 'package:basecode/model/radio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/dropdown.dart';

class TemplateController extends GetxController {
  late TextEditingController jenisKelamin;
  late TextEditingController jenisKelaminRadio;
  late TextEditingController agama;
  late TextEditingController agamaRadio;

  List<DropdownList> listItemJenisKelamin = [
    DropdownList(id: '1', name: 'Laki -laki'),
    DropdownList(id: '2', name: 'Perempuan')
  ];

  List<DropdownList> listItemAgama = [
    DropdownList(id: '3', name: 'Islam'),
    DropdownList(id: '4', name: 'Keristen')
  ];

  List<RadioModel> listRadioAgama = [
    RadioModel(title: "Islam", value: "1"),
    RadioModel(title: "Keristen", value: "2"),
    RadioModel(title: "Budha", value: "3")
  ];

  List<RadioModel> listRadioJenisKelamin = [
    RadioModel(title: "Laki-laki", value: "6"),
    RadioModel(title: "Perempuan", value: "7")
  ];

  void proses() {
    print(jenisKelamin.text);
    print(jenisKelaminRadio.text);
    print(agama.text);
    print(agamaRadio.text);
  }

  @override
  void onInit() {
    jenisKelamin = TextEditingController();
    agama = TextEditingController();
    agamaRadio = TextEditingController();
    jenisKelaminRadio = TextEditingController();
    super.onInit();
  }
}
