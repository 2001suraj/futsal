// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:futsal/data/local_data/shared_pref.dart';
import 'package:futsal/data/model/user_login_model.dart';
import 'package:futsal/data/repository/post/login_data_repo.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:futsal/routes.dart';
import 'package:futsal/view/base_widget/build_menu_item.dart';
import 'package:futsal/view/screen/account_screen/account_screen.dart';
import 'package:futsal/view/screen/favorities_screen/favorities_screen.dart';

import 'package:futsal/view/screen/my_booking/my_booking_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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

    return Drawer(
      backgroundColor: Colors.white,
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            children: [
              Container(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/user.png'),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Consumer<LoginProvider>(
                            builder: (context, value, child) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FutureBuilder<UserLoginModel>(
                                      future: LoginDataRepo().loginDataRepo(
                                          mobile_no: email, password: password),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          var user = snapshot.data!.userData!;
                                          return Column(children: [
                                            Text(
                                              user.fullName.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(height: 5),
                                            Text(user.mobileNumber.toString(),
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
                                )),
                        SizedBox(height: 15),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AccountScreen()));
                            },
                            child: Center(
                              child: Text(
                                'view Profile',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 18, 18, 18),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              buildMenuItem(
                  text: 'Home',
                  icon: Icons.home,
                  ontap: () {
                    Navigator.pop(context);
                  },
                  sub: ''),
              buildMenuItem(
                  text: 'Favorities',
                  icon: Icons.favorite_outlined,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavirotiesScreen()));
                  },
                  sub: ''),
              buildMenuItem(
                  text: 'My Booking',
                  icon: Icons.calendar_month_sharp,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyBookingList()));
                  },
                  sub: ''),
              buildMenuItem(
                  text: 'Feedback',
                  icon: Icons.feedback,
                  ontap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => FeedbackScreen()));
                  },
                  sub:
                      " Let our team know your throughs on our  offerings or something new "),
              buildMenuItem(
                  text: 'contact us',
                  icon: Icons.contact_mail,
                  ontap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => ContactUsScreen()));
                  },
                  sub:
                      " Get in touch with our team for support on any bookings, events, activities and more"),
              buildMenuItem(
                  text: 'privacy and conditions',
                  icon: Icons.table_view_sharp,
                  ontap: () {},
                  sub: " Get to know our policies abd what's in it for you"),
              buildMenuItem(
                  text: 'about us',
                  icon: Icons.error_outline,
                  ontap: () {
                    //      Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => AboutUuScreen()));
                  },
                  sub: "Understand how we work ,our values and our offerings"),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              buildMenuItem(
                  text: ' Log out',
                  icon: Icons.logout,
                  ontap: () async {
                    loginPreferences.removeloginCache().whenComplete(() {
                      Navigator.pushReplacementNamed(context, LoginScreenRoute);
                    });
                 
                  },
                  sub: ''),
            ],
          ),
        ),
      ),
    );
  }
}
