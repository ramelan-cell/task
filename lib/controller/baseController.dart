import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_version_plus/new_version_plus.dart';

class BaseController extends GetxController {
  advancedStatusCheck(NewVersionPlus newVersion, BuildContext context) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      int localVersion = int.parse(status.localVersion.replaceAll('.', ''));
      int storeVersion = int.parse(status.storeVersion.replaceAll('.', ''));
      if (localVersion < storeVersion) {
        // ignore: use_build_context_synchronously
        newVersion.showUpdateDialog(
          allowDismissal: false,
          context: context,
          versionStatus: status,
          dialogTitle: 'UPDATE SYSTEM',
          dismissButtonText: "Skip",
          dialogText: 'Please update the app from version' +
              " ${status.localVersion}" +
              " to ${status.storeVersion}",
        );
      }
    }
  }

  void cekVersion(BuildContext context) async {
    final newVersion = NewVersionPlus(
        iOSId: 'com.exo.task',
        iOSAppStoreCountry: 'id',
        androidId: "com.exo.task");

    // await advancedStatusCheck(newVersion, context);
  }
}
