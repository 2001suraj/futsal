// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:futsal/data/repository/post/login_data_repo.dart';
import 'package:futsal/data/repository/post/login_repo.dart';
import 'package:futsal/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local_data/shared_pref.dart';
import '../../../data/model/user_login_model.dart';
import '../../../provider/login_provider.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  LoginRepo? loginRepo;

  LoginPreferences loginPreferences = LoginPreferences();
  String password = '';
  String email = '';

  void getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    password = prefs.getString('pass')!;
    setState(() {});
  }

  void getemail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('mobile_no')!;
    setState(() {});
  }

  @override
  void initState() {

    super.initState();
    getdata();
    getemail();
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('User Profile'),
          backgroundColor: Colors.orangeAccent,
          elevation: 0,
          actions: [
            StatefulBuilder(
              builder: (context, setState) {
                return PopupMenuButton(itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ResetPasswordScreenRoute);
                            },
                            child: Text('reset password'))),
                    PopupMenuItem(
                        child: TextButton(
                            onPressed: () async {
                                loginPreferences.removeloginCache().whenComplete(() {
                      Navigator.pushReplacementNamed(context, LoginScreenRoute);
                    });

                            },
                            child: Text('logout'))),
                  ];
                });
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(1, 4),
                            blurRadius: 2)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, UpdateInfoScreenRoute);
                              },
                              icon: Icon(Icons.edit))),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FutureBuilder<UserLoginModel>(
                              future: LoginDataRepo().loginDataRepo(
                                  mobile_no: email, password: password),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var user = snapshot.data!.userData!;
                                  return Column(children: [
                                    //name
                                    Text(
                                      user.fullName.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 5),
                                    //email
                                    Text(user.email.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ]);
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280.0),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 420,
                    width: double.infinity,
                    child: Consumer<LoginProvider>(
                      builder: (context, value, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder<UserLoginModel>(
                            future: LoginDataRepo().loginDataRepo(
                                mobile_no:
                                    value.user()!.mobileNumber.toString(),
                                password: password),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var user = snapshot.data!.userData!;
                                return Column(
                                  children: [
                                    //your name
                                    constbuildColumn(
                                        Atext: 'Your Name ',
                                        text: user.fullName,
                                        icon: Icons.person),

                                    //Email
                                    constbuildColumn(
                                        Atext: 'Email ',
                                        text: user.email,
                                        icon: Icons.email_outlined),

                                    //mobile number
                                    constbuildColumn(
                                        Atext: 'Mobile Number ',
                                        text: user.mobileNumber,
                                        icon: Icons.mobile_friendly_sharp),

                                    // Address
                                    constbuildColumn(
                                        Atext: 'Address ',
                                        text: user.address,
                                        icon: Icons.location_on_outlined),

                                    //Date of Birth
                                    constbuildColumn(
                                        Atext: 'Date of Birth',
                                        text: user.dob,
                                        icon: Icons.calendar_month),

                                    //Gender
                                    constbuildColumn(
                                        Atext: 'Gender',
                                        text: user.gender,
                                        icon: Icons.group),
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
        ));
  }

  Column constbuildColumn({required Atext, required text, required icon}) {
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
        Text(
          text,
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
