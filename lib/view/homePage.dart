import 'package:basecode/constan/constan.dart';
import 'package:basecode/controller/authController.dart';
import 'package:basecode/view/taskPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final authC = Get.put(AuthController());
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: 100,
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
                      backgroundImage: NetworkImage(
                          'http://gab.mapp.co.id/images/profile/noimage.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Halo, '),
                          Obx(
                            () => Text(
                              authC.nameUser.value ?? '-',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
