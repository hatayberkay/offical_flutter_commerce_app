import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/options_controller.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/footage/footage.dart';
import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/options_side_bar.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class user_options extends StatefulWidget {
  const user_options({Key? key}) : super(key: key);

  @override
  _user_optionsState createState() => _user_optionsState();
}

class _user_optionsState extends State<user_options> {
  @override
  Widget build(BuildContext context) {
    Options_controller options_controller = Get.put(Options_controller());


    return Scaffold(
      body: ResponsiveLayout(
        computer:  SingleChildScrollView(
          child: Container(
            child:

            Column(children: [

              app_bar(),
              SizedBox(height: 20,),

              Row(


                children: [

                  Spacer(),

                  options_side_bar(),


                  SizedBox(width: 100,),

                  Container(
                    width: 700,
                      height: 600,

                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx( () => options_controller.options_pages[options_controller.index.value],  ),
                        ],
                      )

                  ),

                  Spacer(),


              ],
              ),


              SizedBox(height: 20,),


              Container(
                width: 1100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white),
                child: Column(
                  children: [
                    footage(),


                    Padding(
                      padding: const EdgeInsets.all(Constants.kPadding),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Mobil Uygulamalarımız", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600,fontSize: 30),),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(Constants.kPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/apple.png", width: 250,),
                          SizedBox(width: 20,),
                          Image.asset("images/google.png" , width: 250,),

                        ],
                      ),
                    )


                  ],
                ),
              ),


            ]),

          ),
        ),
        largeTablet: Container(
          child:

          Column(children: [

            app_bar(),




          ]),

        ),
        tablet: Container(
          child:

          Column(children: [

            app_bar(),




          ]),

        ),
        phone: Container(
          child:

          Column(children: [

            app_bar(),




          ]),

        ),
        tiny: Container(
          child:

          Column(children: [

            app_bar(),




          ]),

        ),

      ),
    );
  }
}

class option_box extends StatefulWidget {
  const option_box({Key? key}) : super(key: key);

  @override
  _option_boxState createState() => _option_boxState();
}

class _option_boxState extends State<option_box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(color: Constants.green ,  borderRadius: BorderRadius.circular(5),),

    );
  }
}



