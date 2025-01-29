import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/form_container_widget.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/footage/footage.dart';
import 'package:e_commerce_official_app/destop/satis_sepet_ve_favoriler/favoriler.dart';
import 'package:e_commerce_official_app/destop/satis_sepet_ve_favoriler/sepet.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class satis_first extends StatefulWidget {
 final List<String> alinacak_urunler_id_list;
 final String fiyat;


  const satis_first({super.key, required this.alinacak_urunler_id_list, required this.fiyat});

  @override
  _satis_firstState createState() => _satis_firstState();
}

class _satis_firstState extends State<satis_first> {
  List<String> liste_adi = [];
  List<String>  urun_adi_listem = [];
  List<String> urun_fiyati_listem = [];
  List<String>  urun_gorsel_listem = [];
  List<String> urun_stok_durumu_listem = [];

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController adres_controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    liste_adi = [];
   urun_adi_listem = [];
   urun_fiyati_listem = [];
     urun_gorsel_listem = [];
     urun_stok_durumu_listem = [];


    _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email)
        .get().then((value) => adres_controller.text = value.data()?["adres"]);



setState(() {
  siparislere_bak();

});


    }






  void siparislere_bak() async {

    for (int i = 0; i < widget.alinacak_urunler_id_list.length; i++) {

      var points = await FirebaseFirestore.instance
          .collection('products')
          .doc(widget.alinacak_urunler_id_list[i])
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map data = (documentSnapshot.data() as Map);




          setState(() {
            liste_adi.add(data['urun_adi']);
            urun_adi_listem.add(data['urun_adi']);
            urun_fiyati_listem.add(data['urun_fiyati']);
            urun_gorsel_listem.add(data['gorsel_link_first']);
            urun_stok_durumu_listem.add(data['gorsel_link_first']);



          });


        }
      });

    }




  }



  @override
  Widget build(BuildContext context) {












    return Scaffold(
      backgroundColor: Constants.white,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 210 ),
        child: (ResponsiveLayout.isTinyLimit(context) ||
            ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            :  app_bar(),
      ),
      body:  ResponsiveLayout(
        computer: SingleChildScrollView(child:

        Column(

          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [



                Container(
                  width: 1100,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Constants.kPadding),
                        child: FittedBox(fit: BoxFit.scaleDown,
                          child: Text("Adres Bilgilerinizi kontrol ediniz.", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                        ),
                      ),


                        SizedBox(height: 20,),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Sıralama : İL / İLÇE , MAHALLE , APARTMAN NO",         style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 15, color: Colors.red),),

                      ),


                        SizedBox(height: 20,),


                      Container(
                        width: 1100,
                        child: FormContainerWidget(
                          controller: adres_controller,
                          hintText: "",
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(Constants.kPadding),
                        child: FittedBox(fit: BoxFit.scaleDown,
                          child: Text("Ürünleriniz", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                        ),
                      ),

                      SizedBox(height: 40,),


                      ListView.builder(
                        shrinkWrap: true,

                        itemBuilder: (context, index) =>



                            Column(
                              children: [

                                sepette_eklenmis_urunler_next( image_url: urun_gorsel_listem[index].toString(),
                                urun_adi: urun_adi_listem[index ].toString(),
                                  urun_fiyat: urun_fiyati_listem[index].toString(),
                                ),




                              ],

                            ),




                        itemCount: urun_adi_listem.length.toInt() ,


                      ),


                      Row(


                        children: [

                          Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Container(
                              width: 250,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() async {

/*
                                    var points = await FirebaseFirestore.instance
                                        .collection('products')
                                        .doc(widget.alinacak_urunler_id_list[i])
                                        .get()
                                        .then((DocumentSnapshot documentSnapshot) {
                                      if (documentSnapshot.exists) {
                                        Map data = (documentSnapshot.data() as Map);




                                        setState(() {



                                          liste_adi.add(data['urun_adi']);
                                          urun_adi_listem.add(data['urun_adi']);
                                          urun_fiyati_listem.add(data['urun_fiyati']);
                                          urun_gorsel_listem.add(data['gorsel_link_first']);
                                          urun_stok_durumu_listem.add(data['gorsel_link_first']);



                                        });


                                      }
                                    });*/


                                    for (int i = 0; i < widget.alinacak_urunler_id_list.length; i++) {
                                      final _firestore_id =  _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email).collection("siparislerim").doc();

                                      String id_string = "";
                                      id_string = _firestore_id.id;


                                      _firestore_id.set({
                                        "id" :   id_string,




                                      });

                                    _firestore.collection("siparislerim").doc(id_string).set({
                                        "siparis_id" : id_string,
                                        "urun_adi" : urun_adi_listem[i].toString(),
                                        "durum" : "Saticiya iletildi." ,
                                        "fatura_fiyati" :  urun_fiyati_listem[i].toString(),
                                        "gorsel": urun_gorsel_listem[i].toString(),
                                        "adres": adres_controller.text,



                                      });


                                    }




                                  });


                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(Constants.kPadding / 2),
                                  child: Text("Ödeme Yap" , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Constants.green),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Container(
                              width: 250,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {

                                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new sepet()));




                                  });


                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(Constants.kPadding / 2),
                                  child: Text("Sepete geri dön" , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Constants.green),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                                ),
                              ),
                            ),
                          ),





                        ],)
                    ],
                  ),

                ),


                SizedBox(width: 20,),















              ],





            ),



            Container(
                width: 1100 ,

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white,),

                child: footage()),


          ],
        )),
        tablet:  Container(),
        largeTablet:  Container(),
        phone:  Container(),
        tiny:  Container(),

      ),

    );
  }
}


class sepette_eklenmis_urunler_next extends StatefulWidget {

  final String image_url;

  final String urun_adi;
  final String urun_fiyat;


  const sepette_eklenmis_urunler_next({super.key , required this.image_url, required this.urun_adi, required this.urun_fiyat});

  @override
  _sepette_eklenmis_urunler_nextState createState() => _sepette_eklenmis_urunler_nextState();
}

class _sepette_eklenmis_urunler_nextState extends State<sepette_eklenmis_urunler_next> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.kPadding),
      child: Container(
        width: 1100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Constants.white),

        child: Row(


          children: [



            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Image.network( widget.image_url,
                fit: BoxFit.fill, width: 100, height: 50,),
            ),


            SizedBox(width: 20,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                FittedBox(
                  fit: BoxFit.scaleDown,

                  child: Text("${widget.urun_adi}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                ),
                SizedBox(height: 20,),


              ],

            ),


            SizedBox(width: 200,),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text("${widget.urun_fiyat} TL", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

            ),

            SizedBox(width: 250,),








          ],

        ),





      ),
    );
  }
}
