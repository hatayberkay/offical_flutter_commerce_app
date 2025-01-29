import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/first_place.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';


class user_login_page extends StatefulWidget {
  const user_login_page({Key? key}) : super(key: key);

  @override
  _user_login_pageState createState() => _user_login_pageState();
}

class _user_login_pageState extends State<user_login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size(double.maxFinite, 210 ),
        child: (ResponsiveLayout.isTinyLimit(context) ||
            ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            :  app_bar(),
      ),

      body: ResponsiveLayout(
        computer: SingleChildScrollView(
          child: Container(
            child: Column(

                children: [

                  first_place(),

            ]),

          ),
        ),
        tablet: Container(),
        largeTablet: Container(),
        phone: Container(),
        tiny: Container(),

      ),

    );
  }
}
