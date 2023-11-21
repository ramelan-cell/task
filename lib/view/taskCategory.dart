import 'package:basecode/component/appBarWidget.dart';
import 'package:basecode/component/buttonWidget.dart';
import 'package:basecode/constan/constan.dart';
import 'package:basecode/controller/authController.dart';
import 'package:basecode/helper/helper.dart';
import 'package:basecode/view/categoryPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCategoryPage extends StatelessWidget {
  Map<String, dynamic> listData;
  TaskCategoryPage(this.listData, {super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());
    return Scaffold(
      appBar: AppBarWidget(
          title: listData['name'],
          flagBack: true,
          flagAction: true,
          child: GetBuilder<AuthController>(
            builder: (authC) {
              return IconButton(
                  onPressed: () => authC.getDetailTaskCategory(listData['id']),
                  icon: Icon(
                    Icons.refresh,
                    color: whiteColor,
                  ));
            },
          )),
      body: Container(
        child: GetBuilder<AuthController>(builder: (authC) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: authC.detailTaskCategory.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    authC.getCategory(authC.detailTaskCategory[i]['id']);
                    Get.to(CategoryPage(authC.detailTaskCategory[i]));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: primaryColor),
                        color: (authC.detailTaskCategory[i]['status'] == '1')
                            ? Colors.greenAccent
                            : whiteColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      authC.detailTaskCategory[i]['name'],
                      style: HelperController.textStyle(
                          14, secondColor, FontWeight.bold),
                    )),
                  ),
                );
              });
        }),
      ),
      bottomNavigationBar: InkWell(
        onTap: () => authC.submitTask(listData['id']),
        child: ButtonWidget(
            text: 'Submit', color: primaryColor, colorTxt: secondColor),
      ),
    );
  }
}
