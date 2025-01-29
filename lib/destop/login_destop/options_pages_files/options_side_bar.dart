import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/options_controller.dart';
import 'package:e_commerce_official_app/common/options_controller.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class options_side_bar extends StatefulWidget {
  const options_side_bar({Key? key}) : super(key: key);

  @override
  _options_side_barState createState() => _options_side_barState();
}

class _options_side_barState extends State<options_side_bar> {




  @override
  Widget build(BuildContext context) {

    Options_controller options_controller = Get.put(Options_controller());
    return Container(
      width: 250,

      decoration: BoxDecoration( color: Constants.white, border: Border.all(color: Colors.blueAccent)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

          children: [





            options_button(text: "HESABIM", onPress: () {
              setState(() {
                options_controller.index.value = 0;
                selected: options_controller.index.value == 0;

              });

            }),
            Container(width: 250, color: Colors.blueAccent, height: 1,),


            options_button(text: "Siparişlerim", onPress: () {
              setState(() {
                options_controller.index.value = 1;
                selected: options_controller.index.value == 1;

              });

            }),

            Container(width: 250, color: Colors.blueAccent, height: 1,),
            options_button(text: "Değerlendirmelerim", onPress: () {
              setState(() {
                options_controller.index.value = 2;
                selected: options_controller.index.value == 2;

              });

            }),

            Container(width: 250, color: Colors.blueAccent, height: 1,),
            options_button(text: "Adres Bilgilerim", onPress: () {
              setState(() {
                options_controller.index.value = 3;
                selected: options_controller.index.value == 3;

              });

            }),

            Container(width: 250, color: Colors.blueAccent, height: 1,),
            options_button(text: "İndirim Kuponları", onPress: () {
              setState(() {
                options_controller.index.value = 4;
                selected: options_controller.index.value == 4;

              });

            }),
            Container(width: 250, color: Colors.blueAccent, height: 1,),
            options_button(text: "İade Taleplerim", onPress: () {
              setState(() {
                options_controller.index.value = 5;
                selected: options_controller.index.value == 5;

              });

            }),


            Container(width: 250, color: Colors.blueAccent, height: 1,),
            options_button(text: "Duyuru Tercihlerim", onPress: () {
              setState(() {
                options_controller.index.value = 6;
                selected: options_controller.index.value == 6;
              });

            }),


      ]),



    );
  }
}

class options_button extends StatefulWidget {
  final String text;
  final VoidCallback onPress;


  const options_button({super.key, required this.text, required this.onPress});

  @override
  _options_buttonState createState() => _options_buttonState();
}

class _options_buttonState extends State<options_button> {
  @override
  Widget build(BuildContext context) {


        return InkWell(
          onTap: () => setState(() {
            widget.onPress();
          }),
          child: Container(
            width: 250,
            height: 50,


            child: Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Icon(Icons.keyboard_arrow_right),
                    SizedBox(width: 10,),

                    HoverBuilder(
                      builder: ((isHovered) {
                        return Text(widget.text, style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            color: isHovered ? Colors.green : Colors.black),);
                      }),
                    ),






                  ]),
            ),

          ),
        );

  }
}
