import 'package:basecode/constan/constan.dart';
import 'package:basecode/controller/authController.dart';
import 'package:basecode/helper/helper.dart';
import 'package:basecode/service/api.dart';
import 'package:basecode/view/taskPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../component/appBarWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final authC = Get.put(AuthController());
    return Scaffold(
      appBar: AppBarWidget(
          title: titleAplikasi,
          flagBack: false,
          flagAction: true,
          child: Row(
            children: [
              IconButton(
                  onPressed: () => authC.getListTask(authC.userId.value),
                  icon: Icon(
                    Icons.refresh,
                    color: whiteColor,
                  )),
              IconButton(
                  onPressed: () => authC.signOut(),
                  icon: Icon(
                    Icons.logout,
                    color: whiteColor,
                  )),
            ],
          )),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: (box.read('poto') == null)
                          ? NetworkImage(
                              'http://gab.mapp.co.id/images/profile/noimage.png')
                          : NetworkImage(BaseUrl.urlFoto + box.read('foto')),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo, ',
                            style: HelperController.textStyle(
                                15, whiteColor, FontWeight.bold),
                          ),
                          Obx(
                            () => Text(
                              authC.nameUser.value ?? '-',
                              style: HelperController.textStyle(
                                  15, whiteColor, FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTaskPage()
            ],
          ),
        ),
      ),
    );
  }
}
