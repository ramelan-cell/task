import 'package:basecode/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/appBarWidget.dart';
import '../constan/constan.dart';
import 'aboutPage.dart';
import 'homePage.dart';

class MenuTabPage extends StatelessWidget {
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: DefaultTextStyle(
          style: TextStyle(color: primaryColor, fontSize: 13),
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[HomePage(), AboutPage()],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            labelColor: primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: primaryColor,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                child: Text(
                  "Home",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Tab(
                icon: Icon(Icons.info),
                child: Text(
                  "About",
                  style: TextStyle(fontSize: 12.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
