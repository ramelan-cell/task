import 'package:basecode/model/dropdownMulti.dart';
import 'package:basecode/model/radio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/dropdown.dart';

class TemplateController extends GetxController {
  late TextEditingController jenisKelamin;
  late TextEditingController jenisKelaminRadio;
  late TextEditingController agama;
  late TextEditingController agamaRadio;
  late List<DropDownMultiList> selectItemHewan;
  var selectMultiHewan = [].obs;
  var selectMultiOrang = [].obs;

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

  List<DropDownMultiList> listSelectNamaHewan = [
    DropDownMultiList(id: "1", name: 'Macan'),
    DropDownMultiList(id: "2", name: "Singa"),
    DropDownMultiList(id: "3", name: "jerapah"),
    DropDownMultiList(id: "4", name: "Gajah"),
    DropDownMultiList(id: "5", name: "Macan Tutul"),
    DropDownMultiList(id: "6", name: 'Macan'),
    DropDownMultiList(id: "7", name: "Singa"),
    DropDownMultiList(id: "8", name: "jerapah"),
    DropDownMultiList(id: "9", name: "Gajah"),
    DropDownMultiList(id: "10", name: "Macan Tutul"),
    DropDownMultiList(id: "11", name: 'Macan'),
    DropDownMultiList(id: "12", name: "Singa"),
    DropDownMultiList(id: "13", name: "jerapah"),
    DropDownMultiList(id: "14", name: "Gajah"),
    DropDownMultiList(id: "15", name: "Macan Tutul")
  ];

  List<DropDownMultiList> listSelectNamaOrang = [
    DropDownMultiList(id: "1", name: 'Kholid'),
    DropDownMultiList(id: "2", name: "Muhammad"),
    DropDownMultiList(id: "3", name: "Rahmat"),
    DropDownMultiList(id: "4", name: "Andin"),
    DropDownMultiList(id: "5", name: "Gama")
  ];

  void proses() {
    print(jenisKelamin.text);
    print(jenisKelaminRadio.text);
    print(agama.text);
    print(agamaRadio.text);
    print(selectMultiHewan.value);
    print(selectMultiOrang.value);
  }

  @override
  void onInit() {
    jenisKelamin = TextEditingController();
    agama = TextEditingController();
    agamaRadio = TextEditingController();
    jenisKelaminRadio = TextEditingController();
    selectItemHewan = [];
    super.onInit();
  }
}
