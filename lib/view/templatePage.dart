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
            )
          ],
        ),
      )),
    );
  }
}
