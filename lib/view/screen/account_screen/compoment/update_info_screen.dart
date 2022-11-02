// ignore_for_file: constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futsal/data/model/user_login_model.dart';
import 'package:futsal/data/repository/post/login_data_repo.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repository/post/update_user_profile_repo.dart';
import '../../../../provider/login_provider.dart';

class UpdateInfoScreen extends StatefulWidget {
  static const String Routename = '/updateInfoScreen';
  const UpdateInfoScreen({Key? key}) : super(key: key);
  @override
  State<UpdateInfoScreen> createState() => _UpdateInfoScreenState();
}

class _UpdateInfoScreenState extends State<UpdateInfoScreen> {
  XFile? image;
  String password = '';
  void getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    password = prefs.getString('pass')!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    // TextEditingController namecontroller = TextEditingController();
    // TextEditingController emailcontroller = TextEditingController();
    // TextEditingController phonecontroller = TextEditingController();
    // TextEditingController addresscontroller = TextEditingController();
    // TextEditingController dobcontroller = TextEditingController();
    // TextEditingController gendercontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 200,
                    width: 200,
                    color: Colors.grey,
                    child: image == null
                        ? IconButton(
                            onPressed: () async {
                              final ImagePicker _picker = ImagePicker();
                              final img = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                image = img;
                              });
                            },
                            icon: Icon(Icons.image))
                        : Container(
                            height: 200,
                            width: 200,
                            child: Image.file(
                              File(image!.path),
                              fit: BoxFit.cover,
                            ),
                          )),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                height: 720,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Consumer<LoginProvider>(
                    builder: (context, value, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<UserLoginModel>(
                          future: LoginDataRepo().loginDataRepo(
                              mobile_no: value.user()!.mobileNumber.toString(),
                              password: password),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var user = snapshot.data!.userData!;
                              TextEditingController namecontroller =
                                  TextEditingController(
                                      text: user.fullName.toString());
                              TextEditingController emailcontroller =
                                  TextEditingController(
                                      text: user.email.toString());
                              TextEditingController phonecontroller =
                                  TextEditingController(
                                      text: user.mobileNumber.toString());
                              TextEditingController addresscontroller =
                                  TextEditingController(
                                      text: user.address.toString());
                              TextEditingController dobcontroller =
                                  TextEditingController(
                                      text: user.dob.toString());
                              TextEditingController gendercontroller =
                                  TextEditingController(
                                      text: loginProvider
                                          .user()!
                                          .gender
                                          .toString());
                              return Column(
                                children: [
                                  //your name
                                  constbuildColumn(
                                      Atext: 'Your Name ',
                                      controller: namecontroller,
                                      icon: Icons.person),

                                  //Email
                                  constbuildColumn(
                                      Atext: 'Email ',
                                      controller: emailcontroller,
                                      icon: Icons.email_outlined),

                                  //mobile number
                                  constbuildColumn(
                                      Atext: 'Mobile Number ',
                                      controller: phonecontroller,
                                      icon: Icons.mobile_friendly_sharp),

                                  // Address
                                  constbuildColumn(
                                      Atext: 'Address ',
                                      controller: addresscontroller,
                                      icon: Icons.location_on_outlined),

                                  //Date of Birth
                                  constbuildColumn(
                                      Atext: 'Date of Birth',
                                      controller: dobcontroller,
                                      icon: Icons.calendar_month),

                                  //Gender
                                  constbuildColumn(
                                      Atext: 'Gender',
                                      controller: gendercontroller,
                                      icon: Icons.group),
                                        SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  UpdateUserProfileRepo().updateUserProfilerepo(
                      context: context,
                      email: emailcontroller.text,
                      full_name: namecontroller.text,
                      address: addresscontroller.text,
                      gender: gendercontroller.text,
                      contact_number: phonecontroller.text,
                      dob: dobcontroller.text,
                      userid: loginProvider.user()!.id.toString());
                },
                child: Text("Update"),
                color: Colors.cyan,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              SizedBox(
                height: 40,
              ),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            // By default, show a loading spinner.
                            return const CircularProgressIndicator();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }

  Column constbuildColumn(
      {required Atext, required icon, required controller}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 10,
            ),
            Text(
              Atext,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
        SizedBox(height: 2),
        TextField(
          controller: controller,
        ),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
