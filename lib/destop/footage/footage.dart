import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/destop/footage/fotage_buttonlari.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class footage extends StatefulWidget {
  const footage({Key? key}) : super(key: key);

  @override
  _footageState createState() => _footageState();
}

class _footageState extends State<footage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,



          children: [

            Spacer(),
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: web_sitesi(),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: bilgi(),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: hesabim_section(),
            ),
            Spacer(),
          ],


        ),
      ),


    );
  }
}


class web_sitesi extends StatefulWidget {
  const web_sitesi({Key? key}) : super(key: key);

  @override
  _web_sitesiState createState() => _web_sitesiState();
}

class _web_sitesiState extends State<web_sitesi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [
          Text("Web Sitesi" , style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900,fontSize: 20 , color: Constants.lightblack)),

          SizedBox(height: 10,),
          Container(width: 200, height: 1, color: Colors.black,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              footage_button(text: "Hakkımızda", onpressed: () {

                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "hakkımızda",)));

              }),
              footage_button(text: "Site Kullanım Şartları", onpressed: () {

                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "Site Kullanım Şartları",)));


              }),
              footage_button(text: "İade / Değişim Prosedürü", onpressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "İADE VE DEĞİŞİM",)));


              }),
              footage_button(text: "Gizlilik ve Güvenlik Politikası", onpressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "Gizlilik ve Güvenlik Politikası",)));


              }),
              footage_button(text: "Gizlilik ve KVKK Politikası", onpressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "Gizlilik ve KVKK Politikası",)));


              }),
              footage_button(text: "İletişim", onpressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "İletişim",)));


              }),
            ],
          ),



        ],
      ),

    );
  }
}

class footage_button extends StatefulWidget {
  final String text;
  final VoidCallback  onpressed;

  const footage_button({ super.key , required this.text , required this.onpressed});

  @override
  _footage_buttonState createState() => _footage_buttonState();
}

class _footage_buttonState extends State<footage_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:     FittedBox(
        fit: BoxFit.scaleDown,
        child: TextButton(onPressed: () {

            widget.onpressed();


        }, child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("${widget.text}" , style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600,fontSize: 20 , color: Constants.lightblack),),
        )),
      ),





    );
  }
}


class bilgi extends StatefulWidget {
  const bilgi({Key? key}) : super(key: key);

  @override
  _bilgiState createState() => _bilgiState();
}

class _bilgiState extends State<bilgi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [



          Text("Bilgi" , style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900,fontSize: 20 , color: Constants.lightblack)),
          SizedBox(height: 10,),
          Container(width: 200, height: 1, color: Colors.black,),



          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [

             SizedBox(height: 10,),
             footage_button(text: "Teslimat ve İade", onpressed: () {

               Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "Teslimat ve İade",)));



             }),
             footage_button(text: "Sık Sorulan Sorular", onpressed: () {
               Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "Sık Sorulan Sorular",)));



             }),

             footage_button(text: "Üyelik Sözleşmesi", onpressed: () {
               Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "Üyelik Sözleşmesi",)));


             }),
             footage_button(text: "Yasaklı Ürünler", onpressed: () {
               Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "Yasaklı Ürünler",)));


             }),
             footage_button(text: "İletişim", onpressed: () {
               Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new footage_buttonlar(button_adi: "İletişim",)));


             }),
             footage_button(text: "Mesafeli Satış Sözleşmesi", onpressed: () {}),

           ],

         )



        ],


      ),
    );
  }
}

class hesabim_section extends StatefulWidget {
  const hesabim_section({Key? key}) : super(key: key);

  @override
  _hesabim_sectionState createState() => _hesabim_sectionState();
}

class _hesabim_sectionState extends State<hesabim_section> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

          children: [

            Text("Hesabım" , style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900,fontSize: 20 , color: Constants.lightblack)),
            SizedBox(height: 10,),
            Container(width: 200, height: 1, color: Colors.black,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
                footage_button(text: "Üye Girişi", onpressed: () {}),
                footage_button(text: "Hesabım", onpressed: () {}),
                footage_button(text: "Sipariş Takibi", onpressed: () {}),
                footage_button(text: "Teslimat Bilgileri", onpressed: () {}),
              ],

            ),



      ]),

    );
  }
}

