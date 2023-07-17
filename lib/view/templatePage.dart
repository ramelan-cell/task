import 'package:basecode/component/dropdownMultiWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/buttonWidget.dart';
import '../component/dropdownWidget.dart';
import '../component/radioButtonWidget.dart';
import '../component/textFormFieldWidget.dart';
import '../constan/constan.dart';
import '../controller/templateController.dart';
import '../helper/helper.dart';

class TemplatePage extends StatelessWidget {
  TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateC = Get.put(TemplateController());
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormFieldWidget(
                inputType: TextInputType.text,
                text: 'username',
                controller: TextEditingController(),
                obscureText: false,
                readOnly: false,
                iconWidget: SizedBox(),
                prefixIcon: false,
                suffixIcon: false,
                maxLine: 1,
              ),
              DropdownWidget(
                selectName: "Jenis Kelamin",
                listItem: templateC.listItemJenisKelamin,
                controller: templateC.jenisKelamin,
              ),
              DropdownWidget(
                selectName: "Agama",
                listItem: templateC.listItemAgama,
                controller: templateC.agama,
              ),
              RadioButtonWidget(
                  title: 'Jenis Kelamin',
                  controller: templateC.jenisKelaminRadio,
                  listItem: templateC.listRadioJenisKelamin),
              RadioButtonWidget(
                  title: 'Agama',
                  controller: templateC.agamaRadio,
                  listItem: templateC.listRadioAgama),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Format Rupiah'),
                  Text(HelperController.formatRupiah(
                      nominal: 60000000, symbol: 'Rp', decimalDigit: 2)),
                ],
              ),
              DropDownMultiWidget(
                  title: 'Jenis Hewan',
                  listItem: templateC.listSelectNamaHewan,
                  selectItem: templateC.selectMultiHewan),
              DropDownMultiWidget(
                  title: 'Nama - nama orang',
                  listItem: templateC.listSelectNamaOrang,
                  selectItem: templateC.selectMultiOrang)
            ],
          ),
        ),
      )),
      bottomNavigationBar: InkWell(
        onTap: () => templateC.proses(),
        child: ButtonWidget(
            text: 'Proses', color: primaryColor, colorTxt: secondColor),
      ),
    );
  }
}
