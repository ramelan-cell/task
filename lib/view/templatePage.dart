import 'package:basecode/component/buttonWidget.dart';
import 'package:basecode/component/radioButtonWidget.dart';
import 'package:basecode/constan/constan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/dropdownWidget.dart';
import '../component/textFormFieldWidget.dart';
import '../controller/templateController.dart';

class TemplatePage extends StatelessWidget {
  TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateC = Get.put(TemplateController());
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            TextFormFieldWidget(
                text: 'username',
                controller: TextEditingController(),
                obscureText: false,
                readOnly: false,
                iconWidget: SizedBox(),
                prefixIcon: false,
                suffixIcon: false),
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
                listItem: templateC.listRadioAgama)
          ],
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
