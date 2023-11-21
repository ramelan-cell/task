import 'package:basecode/component/appBarWidget.dart';
import 'package:basecode/component/buttonWidget.dart';
import 'package:basecode/constan/constan.dart';
import 'package:basecode/controller/authController.dart';
import 'package:basecode/helper/helper.dart';
import 'package:basecode/view/checkListpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  Map<String, dynamic> listData;
  CategoryPage(this.listData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          title: listData['name'],
          flagBack: true,
          flagAction: true,
          child: GetBuilder<AuthController>(
            builder: (authC) {
              return IconButton(
                  onPressed: () => authC.getCategory(listData['id']),
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
              itemCount: authC.dataCategory.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    authC.getCheckList(authC.dataCategory[i]['id']);
                    Get.to(CheckListPage(authC.dataCategory[i]));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: primaryColor),
                        color: (authC.dataCategory[i]['status'] == '1')
                            ? Colors.greenAccent
                            : whiteColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authC.dataCategory[i]['name'],
                          style: HelperController.textStyle(
                              14, secondColor, FontWeight.bold),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, bottom: 20, top: 10),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 242, 185, 204),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                authC.dataCategory[i]['check1'] +
                                    ' / ' +
                                    authC.dataCategory[i]['check2'] +
                                    ' / ' +
                                    authC.dataCategory[i]['check3'],
                                style: HelperController.textStyle(
                                    10, Colors.pink, FontWeight.bold),
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10, bottom: 20, top: 10),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 157, 190, 240),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                authC.dataCategory[i]['jumlah'].toString() +
                                    ' / ' +
                                    authC.dataCategory[i]['checklist']
                                        .toString(),
                                style: HelperController.textStyle(
                                    10, blueMuda, FontWeight.bold),
                              )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
