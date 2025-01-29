import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/options_controller.dart';
import 'package:e_commerce_official_app/destop/admin_page/admin_main_page.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class hesap_bilgileri extends StatefulWidget {
  const hesap_bilgileri({Key? key}) : super(key: key);

  @override
  _hesap_bilgileriState createState() => _hesap_bilgileriState();
}

class _hesap_bilgileriState extends State<hesap_bilgileri> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

String asd = "";
  @override
  void initState() {


    super.initState();


  }



  Options_controller options_controller = Get.put(Options_controller());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 600,
      color: Constants.white,
      child: Column(
        children: [
         SizedBox(height: 20,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,


              children: [
                SizedBox(width: 10,),

            hesap_bilgileri_box(text: "Hesap Bilgilerimi düzenle" , icon_name_text: "person_second.png" , onPressed: () =>
              setState(() {
                options_controller.index.value = 7;
                selected: options_controller.index.value == 7;

              })

            ,),
            SizedBox(width: 10,),

            hesap_bilgileri_box(text: "Adresimi Düzenle", icon_name_text: "adress.png", onPressed: () =>
                setState(() {
                  options_controller.index.value = 3;
                  selected: options_controller.index.value == 3;
                })

              ,),
                SizedBox(width: 10,),
            hesap_bilgileri_box(text: "İndirim Kuponlarım",icon_name_text: "discount.png", onPressed: () =>
                setState(() {
                  options_controller.index.value = 4;
                  selected: options_controller.index.value == 4;

                })

              ,),
                SizedBox(width: 10,),
            hesap_bilgileri_box(text: "Siparişlerim", icon_name_text: "orders.png", onPressed: () =>
                setState(() {
                  options_controller.index.value = 1;
                  selected: options_controller.index.value == 1;
                })

              ,),

          ]),

          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(width: 10,),
            hesap_bilgileri_box(text: "İade Taleplerim", icon_name_text: "back.png", onPressed: () =>
                setState(() {
                  options_controller.index.value = 5;
                  selected: options_controller.index.value == 5;
                })

              ,),
            SizedBox(width: 10,),

            hesap_bilgileri_box(text: "Kampanya Bultenine Abone Ol", icon_name_text: "abone.png", onPressed: () =>
                setState(() {
                  options_controller.index.value = 6;
                  selected: options_controller.index.value == 6;
                })

              ,),
                SizedBox(width: 10,),
            hesap_bilgileri_box(text: "Hesabımı Sil", icon_name_text: "delete.png", onPressed: () =>
                setState(() {

                })

              ,),
                SizedBox(width: 10,),
            hesap_bilgileri_box(text: "Çıkış Yap", icon_name_text: "cikis.png", onPressed: () =>
                setState(() {

                })

              ,),




          ]),

          if (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser?.email.toString() == "hatayberkay1234@gmail.com"  )
          hesap_bilgileri_box(text: "Admin paneli", icon_name_text: "cart.png", onPressed: () =>
              setState(() {

                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new admin_main_page()));




              })

            ,),

        ],
      ),

    );
  }
}


class hesap_bilgileri_box extends StatefulWidget {
  final String text;
  final String icon_name_text;
  final VoidCallback onPressed;
  const hesap_bilgileri_box({super.key, required this.text, required this.icon_name_text , required this.onPressed});

  @override
  _hesap_bilgileri_boxState createState() => _hesap_bilgileri_boxState();
}

class _hesap_bilgileri_boxState extends State<hesap_bilgileri_box> {
  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
     builder: ((isHovered) {
       return Container(
         width: 150,
         height: 150,
         decoration: BoxDecoration(
             color:  isHovered ? Colors.lightGreen : Colors.grey,
             borderRadius: BorderRadius.circular(10.0)),
         child: InkWell(
           onTap: () => widget.onPressed()

           ,
           child: Column(
               mainAxisAlignment: MainAxisAlignment.center,

               children: [
                 SizedBox(height: 20,),
                 Image.asset("images/" + widget.icon_name_text, width: 100, height: 50,),
                 SizedBox(height: 20,),

                 Padding(
                   padding: const EdgeInsets.all(Constants.kPadding),
                   child: FittedBox(
                     fit: BoxFit.scaleDown,
                     child: Text(
                       "${widget.text}",
                       style: TextStyle(
                           fontFamily:  'Avenir', fontWeight: FontWeight.w800, fontSize: 15
                       ),
                     ),
                   ),
                 ),




               ]),
         ),
       );
     }),

    );
  }
}

