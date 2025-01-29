import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/destop/admin_page/kullanicilar/kullanicilar_islemleri.dart';
import 'package:e_commerce_official_app/destop/admin_page/siparisler/siparis_gelen.dart';
import 'package:e_commerce_official_app/destop/admin_page/urunler/urunler_islemleri.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/hesap_bilgileri.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';



class admin_main_page extends StatefulWidget {
  const admin_main_page({Key? key}) : super(key: key);

  @override
  _admin_main_pageState createState() => _admin_main_pageState();
}

class _admin_main_pageState extends State<admin_main_page> {




  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(computer:

    Scaffold(
        appBar: PreferredSize(
          preferredSize:  Size(double.maxFinite, 210 ),
          child: (ResponsiveLayout.isTinyLimit(context) ||
              ResponsiveLayout.isTinyHeightLimit(context))
              ? Container()
              :     app_bar(),
        ),

        body:
      Column(
          children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,


              children: [

                hesap_bilgileri_box(text: "kullanıcılar", icon_name_text: "cart.png", onPressed: () =>
                    setState(() {


                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  kullanicilar(purpose: "indirim kuponu tanımla",),),);




                    })

                  ,),

                hesap_bilgileri_box(text: "kullanıcılar indirim kuponu", icon_name_text: "cart.png", onPressed: () =>
                    setState(() {



                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  kullanicilar(purpose: "indirim kuponu olustur",),),);



                    })

                  ,),


                hesap_bilgileri_box(text: "Ürünler Ekle", icon_name_text: "cart.png", onPressed: () =>
                    setState(() {
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  urunler_islemleri(purpose: "urun ekle",),),);





                    })

                  ,),

                hesap_bilgileri_box(text: "Ürün Fiyat Güncelle", icon_name_text: "cart.png", onPressed: () =>
                    setState(() {

                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  urunler_islemleri(purpose: "urun guncelle",),),);





                    })

                  ,),



                hesap_bilgileri_box(text: "Siparisler Gelen", icon_name_text: "cart.png", onPressed: () =>
                    setState(() {

                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new siparis_gelen(purpose: "siparis_gelen",)));




                    })

                  ,),


                hesap_bilgileri_box(text: "Siparisler Gerçekleşen", icon_name_text: "cart.png", onPressed: () =>
                    setState(() {

                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new siparis_gelen(purpose: "siparis gerceklesen",)));




                    })

                  ,),





              ],
            ),

    Row(
      children: [

        hesap_bilgileri_box(text: "İade Talepleri", icon_name_text: "cart.png", onPressed: () =>
            setState(() {


              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  kullanicilar(purpose: "indirim kuponu tanımla",),),);




            })

          ,),

      ],

    )

    // admin panel yönetici





      ]),



    ),

      largeTablet: Container(),
      phone: Container(),
      tablet: Container(),
      tiny: Container(),


    );
  }
}
