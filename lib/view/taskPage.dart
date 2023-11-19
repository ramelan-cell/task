import 'package:basecode/constan/constan.dart';
import 'package:basecode/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTaskPage extends StatelessWidget {
  const ListTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (autC) {
        return Container(
          child: ListView.builder(
              itemCount: autC.dataListTask.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: primaryColor),
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 252, 244, 178)),
                        child: Center(
                            child: Text(
                          autC.dataListTask[i]['lokasi'],
                          style: TextStyle(fontSize: 12, color: secondColor),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          autC.dataListTask[i]['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          autC.dataListTask[i]['ket'] ?? '-',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Divider()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, bottom: 20, top: 10),
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 242, 185, 204),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              autC.dataListTask[i]['check1'] +
                                  ' / ' +
                                  autC.dataListTask[i]['check2'] +
                                  ' / ' +
                                  autC.dataListTask[i]['check3'],
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 12),
                            )),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(right: 10, bottom: 20, top: 10),
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 157, 190, 240),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              autC.dataListTask[i]['check1'] +
                                  ' / ' +
                                  autC.dataListTask[i]['check2'] +
                                  ' / ' +
                                  autC.dataListTask[i]['check3'],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 12, 51, 111),
                                  fontSize: 12),
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
