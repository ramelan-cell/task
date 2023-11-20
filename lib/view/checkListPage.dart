import 'dart:io';

import 'package:basecode/component/appBarWidget.dart';
import 'package:basecode/component/buttonWidget.dart';
import 'package:basecode/component/textFormFieldWidget.dart';
import 'package:basecode/constan/constan.dart';
import 'package:basecode/controller/authController.dart';
import 'package:basecode/helper/helper.dart';
import 'package:basecode/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CheckListPage extends StatefulWidget {
  Map<String, dynamic> listData;
  CheckListPage(this.listData, {super.key});

  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile;
  File? tempFile;
  TextEditingController catatan = TextEditingController();
  final authC = Get.put(AuthController());

  getCamera(String id, String idcategory) async {
    try {
      pickedFile = (await _picker.pickImage(
          source: ImageSource.camera,
          maxHeight: 800.0,
          maxWidth: 460.0,
          imageQuality: 100))!;
      setState(() {
        tempFile = File(pickedFile!.path);
        authC.updateImages(id, tempFile, idcategory);
        Navigator.pop(context);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> showMyDialogConfirm(String id, String note) async {
    catatan.text = note;
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Tambahkan notes',
            style: HelperController.textStyle(16, secondColor, FontWeight.bold),
          ),
          content: Container(
            child: TextFormField(
              style: HelperController.textStyle(
                  12, secondColor, FontWeight.normal),
              controller: catatan,
              maxLines: 1,
              decoration: InputDecoration(hintText: "Notes"),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit',
                  style: HelperController.textStyle(
                      16, primaryColor, FontWeight.bold)),
              onPressed: () {
                authC.updateNotes(id, catatan.text, widget.listData['id']);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showMyDialogUpload(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Upload Images',
            style: HelperController.textStyle(16, secondColor, FontWeight.bold),
          ),
          content: (tempFile == null)
              ? IconButton(
                  onPressed: () => getCamera(id, widget.listData['id']),
                  icon: Icon(
                    Icons.photo_camera,
                    size: 50,
                  ))
              : Container(
                  child: Image.file(File(pickedFile!.path)),
                ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Take Photo',
                style: HelperController.textStyle(
                    15, primaryColor, FontWeight.bold),
              ),
              onPressed: () {
                getCamera(id, widget.listData['id']);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          title: widget.listData['name'],
          flagBack: true,
          flagAction: true,
          child: GetBuilder<AuthController>(
            builder: (authC) {
              return IconButton(
                  onPressed: () => authC.getCheckList(widget.listData['id']),
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
              itemCount: authC.dataCheckList.length,
              itemBuilder: (context, i) {
                authC.notes[i] =
                    TextEditingController(text: authC.dataCheckList[i]['note']);
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  // height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: primaryColor),
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Text(
                              authC.dataCheckList[i]['name'],
                              style: HelperController.textStyle(
                                  16, secondColor, FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: DefaultTextStyle(
                              style: HelperController.textStyle(
                                  12, secondColor, FontWeight.normal),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Excellent'),
                                  Text('Good'),
                                  Text('Poor'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () => showMyDialogUpload(
                                          authC.dataCheckList[i]['id']),
                                      icon: Icon(
                                        Icons.photo_camera,
                                        color: Colors.blueAccent,
                                      )),
                                  IconButton(
                                      onPressed: () => showMyDialogConfirm(
                                          authC.dataCheckList[i]['id'],
                                          authC.dataCheckList[i]['note']),
                                      icon: Icon(
                                        Icons.add_business,
                                        color: Colors.blueAccent,
                                      )),
                                ],
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Row(
                              children: [
                                Checkbox(
                                  tristate: true,
                                  value:
                                      (authC.dataCheckList[i]['check1'] == '1')
                                          ? true
                                          : false,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (value == true) {
                                        authC.dataCheckList[i]['check1'] = '1';
                                        authC.dataCheckList[i]['check2'] = '0';
                                        authC.dataCheckList[i]['check3'] = '0';
                                        authC.updateCheckList(
                                            authC.dataCheckList[i]['id'],
                                            authC.dataCheckList[i]['check1'],
                                            authC.dataCheckList[i]['check2'],
                                            authC.dataCheckList[i]['check3'],
                                            widget.listData['id']);
                                      } else {
                                        authC.dataCheckList[i]['check1'] = '0';
                                      }
                                    });
                                  },
                                ),
                                Checkbox(
                                  tristate: true,
                                  value:
                                      (authC.dataCheckList[i]['check2'] == '1')
                                          ? true
                                          : false,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (value == true) {
                                        authC.dataCheckList[i]['check2'] = '1';
                                        authC.dataCheckList[i]['check1'] = '0';
                                        authC.dataCheckList[i]['check3'] = '0';

                                        authC.updateCheckList(
                                            authC.dataCheckList[i]['id'],
                                            authC.dataCheckList[i]['check1'],
                                            authC.dataCheckList[i]['check2'],
                                            authC.dataCheckList[i]['check3'],
                                            widget.listData['id']);
                                      } else {
                                        authC.dataCheckList[i]['check2'] = '0';
                                      }
                                    });
                                  },
                                ),
                                Checkbox(
                                  tristate: true,
                                  value:
                                      (authC.dataCheckList[i]['check3'] == '1')
                                          ? true
                                          : false,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (value == true) {
                                        authC.dataCheckList[i]['check3'] = '1';
                                        authC.dataCheckList[i]['check1'] = '0';
                                        authC.dataCheckList[i]['check2'] = '0';
                                        authC.updateCheckList(
                                            authC.dataCheckList[i]['id'],
                                            authC.dataCheckList[i]['check1'],
                                            authC.dataCheckList[i]['check2'],
                                            authC.dataCheckList[i]['check3'],
                                            widget.listData['id']);
                                      } else {
                                        authC.dataCheckList[i]['check3'] = '0';
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: (authC.dataCheckList[i]['picture'] == null)
                                ? Icon(
                                    Icons.image,
                                    size: 100,
                                    color: Colors.grey,
                                  )
                                : Image.network(
                                    BaseUrl.urlCeklis +
                                        authC.dataCheckList[i]['picture'],
                                    width: 150,
                                    height: 100,
                                  ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Text(
                              authC.notes[i].text,
                              style: HelperController.textStyle(
                                  12, secondColor, FontWeight.normal),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              });
        }),
      ),
    );
  }
}
