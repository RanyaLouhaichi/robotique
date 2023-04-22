import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/User.dart';
import '../headerWidget.dart';

enum role { reception, homologation, jury, admin }
class AddUser extends StatelessWidget {
 // const AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c1 = Theme.of(context).primaryColor;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Get.height / 3,
                child: headerWidget(),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Add a user",
                        style: GoogleFonts.playfairDisplay(
                            textStyle:
                            TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              buildBody(c1, context),
            ],
          )),
    );
  }
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final roleController = TextEditingController();
  Container buildBody(color, context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Column(children: [
        Form(
          child: Column(
            children: [
              /****************Name Field**************************** */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Oxygen',
                          fontSize: 25)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 48,
                    child: TextFormField(
                      controller: usernameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color, width: 1.0),
                          ),
                          hintText: 'Name',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade400, width: 1.0))),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),

              /**************************Task************************ */



              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text("Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Oxygen',
                            fontSize: 25)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  ),
                  Container(
                    height: 48,
                    child: TextFormField(
                      obscureText: false,
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color, width: 1.0),
                          ),
                          hintText: 'Name',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade400, width: 1.0))),
                    ),
                  ),
                  Row(children: [
                    Text("Role",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Oxygen',
                            fontSize: 25)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {

                            roleController.text = role.admin.toString();

                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(Size(20, 20)),
                            backgroundColor: MaterialStateProperty.all(color),
                          ),
                          child: Text('admin'),
                        ),
                        ElevatedButton(
                          onPressed: () {

                            roleController.text = role.homologation.toString();

                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(Size(20, 20)),
                            backgroundColor: MaterialStateProperty.all(color),
                          ),
                          child: Text('Homologation'),
                        ),]
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {

                          roleController.text = role.jury.toString();

                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(Size(20, 20)),
                          backgroundColor: MaterialStateProperty.all(color),
                        ),
                        child: Text('Jury'),

                      ),
                      ElevatedButton(
                        onPressed: () {

                          roleController.text = role.reception.toString();

                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(Size(20, 20)),
                          backgroundColor: MaterialStateProperty.all(color),
                        ),
                        child: Text('Reception'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),

              SizedBox(height: 20.0),

              /************ buttoon***************** */
              Container(
                width: Get.width,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    createUser(username: usernameController.text, password: passwordController.text,role: roleController.text );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(50, 50)),
                    backgroundColor: MaterialStateProperty.all(color),
                  ),
                  child: Text(
                    'Add User',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ]),
    );
  }


  Future createUser({required String username,password, role}) async {
    final docComp =
    FirebaseFirestore.instance.collection("users").doc();
    final user = User(username, password, role);

    final json = user.toJson();
    await docComp.set(json);
    Get.defaultDialog(
      title: "GeeksforGeeks",
      middleText: "Hello world!",
      backgroundColor: Colors.green,
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
    );
    usernameController.clear();
    passwordController.clear();
  }
}