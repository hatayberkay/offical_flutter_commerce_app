import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/filtre_sayfasi.dart';
import 'package:flutter/material.dart';


class hover_dialog extends StatefulWidget {
  const hover_dialog({Key? key}) : super(key: key);

  @override
  _hover_dialogState createState() => _hover_dialogState();
}

class _hover_dialogState extends State<hover_dialog> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue,),
        width: 1000,
        height: height/2,

        child: Container(

          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,









              children: [

                Spacer(),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [
                      SizedBox(height: height/10,),
                      Text("Kadın Giyim ve Aksesuvar" , style: TextStyle(  fontFamily: 'Poppins', fontWeight: FontWeight.w800,)),
                      SizedBox(height: 10,),
                      app_bar_dialog_button(text: "Kadın T-shirt",),
                      app_bar_dialog_button(text: "Etek",),
                      app_bar_dialog_button(text: "Pantolon ve Tayt",),
                      app_bar_dialog_button(text: "Büyük Beden",),
                      app_bar_dialog_button(text: "Dış Giyim",),
                      app_bar_dialog_button(text: "Elbise",),





                    ],


                  ),
                ),

                SizedBox(width: 20,),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [
                      SizedBox(height: height/10,),
                      Text("Erkek Giyim ve Aksesuvar", style: TextStyle(  fontFamily: 'Poppins', fontWeight: FontWeight.w800,)),

                      SizedBox(height: 10,),

                      app_bar_dialog_button(text: "Erkek T-shirt",),
                      app_bar_dialog_button(text: "Gömlek",),
                      app_bar_dialog_button(text: "Pantolon ve Short",),
                      app_bar_dialog_button(text: "Büyük Beden",),
                      app_bar_dialog_button(text: "Dış Giyim",),
                      app_bar_dialog_button(text: "Triko",),






                    ],


                  ),
                ),
                SizedBox(width: 20,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,



                    children: [

                      SizedBox(height: height/10,),


                      Text("Ayakkabı ve Çanta" , style: TextStyle(  fontFamily: 'Poppins', fontWeight: FontWeight.w800,)),

                      SizedBox(height: 10,),


                      app_bar_dialog_button(text: "Çocuk Ayakkabı",),
                      app_bar_dialog_button(text: "Çocuk Çanta",),
                      app_bar_dialog_button(text: "Erkek Ayakkabı",),
                      app_bar_dialog_button(text: "Kadın Ayakkabı",),
                      app_bar_dialog_button(text: "Kadın Çanta",),







                    ],


                  ),
                ),

                Spacer(),

                Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: Image.asset("images/giyim.jpg" , height: height/3, width: width/10, ),
                ),

                Spacer(),

              ]),

        ),


      ),
    );
  }
}

class app_bar_dialog_button extends StatefulWidget {
  final String text;

  const app_bar_dialog_button({super.key, required this.text});

  @override
  _app_bar_dialog_buttonState createState() => _app_bar_dialog_buttonState();
}

class _app_bar_dialog_buttonState extends State<app_bar_dialog_button> {
  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: ((isHovered) {
        return  Container(
          child:   Padding(
            padding: const EdgeInsets.all(Constants.kPadding / 2),
            child: InkWell(
                onTap: () {
                  setState(() {

                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  filtre(alt_kategori: "monitor",)));
                  });

                },

                child: Text("${widget.text}", style: TextStyle(fontSize: 15,   fontFamily: 'Poppins', fontWeight: FontWeight.w500, color: isHovered ? Colors.black : Constants.lightblack ))),
          ),

        );

      }),


    );
  }
}

