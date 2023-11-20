import 'package:basecode/helper/helper.dart';
import 'package:flutter/material.dart';

import '../constan/constan.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool flagBack;
  bool flagAction;
  Widget child;
  AppBarWidget({
    super.key,
    required this.title,
    required this.flagBack,
    required this.flagAction,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: flagBack,
      iconTheme: IconThemeData(color: whiteColor),
      elevation: 0,
      backgroundColor: primaryColor,
      title: Text(
        title,
        style: HelperController.textStyle(16, whiteColor, FontWeight.bold),
      ),
      centerTitle: true,
      actions: [(flagAction == true) ? child : SizedBox()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
