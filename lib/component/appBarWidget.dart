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
      iconTheme: IconThemeData(color: Colors.black87),
      elevation: 0,
      backgroundColor: primaryColor,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [(flagAction == true) ? child : SizedBox()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
