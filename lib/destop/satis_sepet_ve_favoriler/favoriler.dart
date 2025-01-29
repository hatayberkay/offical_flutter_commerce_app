import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/footage/footage.dart';
import 'package:e_commerce_official_app/destop/satis_sepet_ve_favoriler/sepet.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class favoriler extends StatefulWidget {
  const favoriler({Key? key}) : super(key: key);

  @override
  _favorilerState createState() => _favorilerState();
}






class _favorilerState extends State<favoriler> {





  void message() async {




    await for(var snapshots in   FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser?.email.toString())
        .collection("favorilerim")
        .snapshots()){
      for(var message in snapshots.docs){


        //  print(message.data()["id"]+ "ddd");
        liste_adi.add(message.data()["id"]);




        /*     await for(var snapshots in   FirebaseFirestore.instance
          .collection('products')
          .doc(message.data()["id"])

          .snapshots()) {
        for (var message in snapshots.data()!.values) {
          //   print(message.data()["durum"]+ "ddd");
          print(message.data().keys.toString() + "ddd");

     //     listem_adi.add(message.data().keys as String);
          // liste_adi.add(message.data()["id"]);
        }
      }
      */

      }


      // tüm dokumanlara bak
      for (int i = 0; i < liste_adi.length; i++) {

        var points = await FirebaseFirestore.instance
            .collection('products')
            .doc(liste_adi[i])
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Map data = (documentSnapshot.data() as Map);




            setState(() {
              urun_adi_listem.add(data['urun_adi']);
              urun_fiyati_listem.add(data['urun_fiyati']);
              urun_gorsel_listem.add(data['gorsel_link_first']);
              urun_stok_durumu_listem.add(data['stok_adedi']);


            });


          }
        });


      }

    }

  }



  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> liste_adi = [];
  List<String> urun_adi_listem = [];
  List<String> urun_fiyati_listem = [];

  List<String> urun_gorsel_listem = [];
  List<String> urun_stok_durumu_listem = [];





  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      liste_adi = [];
      urun_adi_listem = [];
      urun_fiyati_listem = [];
      urun_gorsel_listem = [];

      message();
    });




  }











  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: PreferredSize(
        preferredSize:  Size(double.maxFinite, 210 ),
        child: (ResponsiveLayout.isTinyLimit(context) ||
            ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            :  app_bar(),
      ),
      body: ResponsiveLayout(
        computer: SingleChildScrollView(child:

        Column(

          children: [
            SizedBox(height: 20,),

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
                          child: Text("Favorilerim", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                        ),
                      ),

                      SizedBox(height: 20,),


                   /*   favorilere_eklenmis_urunler(),
                      favorilere_eklenmis_urunler(),
                      favorilere_eklenmis_urunler(),
                      favorilere_eklenmis_urunler(),*/

                      if(urun_adi_listem.length.toInt() > 0 )
                      ListView.builder(
                        shrinkWrap: true,

                        itemBuilder: (context, index) =>



                            Column(
                              children: [

                                favorilere_eklenmis_urunler(urun_id: liste_adi[index].toString() ,urun_adi: urun_adi_listem[index ].toString() ,
                                  urun_fiyat: urun_fiyati_listem[index].toString(),
                                  image_url: urun_gorsel_listem[index].toString(), stok_adedi: urun_stok_durumu_listem[index].toString(),)




                              ],

                            ),




                        itemCount: urun_adi_listem.length.toInt() ,


                      ),
                      if(urun_adi_listem.length.toInt()  == 0 )

                        ListView.builder(
                          shrinkWrap: true,

                          itemBuilder: (context, index) =>



                              Column(
                                children: [

                               Text("Favorilerim kısmına henüz birşey eklemediniz."),



                                ],

                              ),




                          itemCount: 1 ,
                        ),


                    ],
                  ),

                ),


                SizedBox(width: 20,),













              ],





            ),


            SizedBox(height: 20,),

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

class favorilere_eklenmis_urunler extends StatefulWidget {
  final String urun_id;
  final String image_url;

  final String urun_adi;
  final String urun_fiyat;
  final String stok_adedi;

  const favorilere_eklenmis_urunler({super.key, required this.urun_id ,required this.image_url, required this.urun_adi , required this.urun_fiyat , required this.stok_adedi});

  @override
  _favorilere_eklenmis_urunlerState createState() => _favorilere_eklenmis_urunlerState();
}

class _favorilere_eklenmis_urunlerState extends State<favorilere_eklenmis_urunler> {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.kPadding),
      child: Container(
        width: 1100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Constants.white),

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

                  child: Text("${widget.urun_adi}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 5)),

                ),
                SizedBox(height: 20,),

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("Stokta kalan: " + " ${widget.stok_adedi}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                ),
              ],

            ),


            SizedBox(width: 200,),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text("${widget.urun_fiyat} TL", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

            ),

            SizedBox(width: 250,),


            Container(
              width: 100,
              height: 50,
              child: OutlinedButton(onPressed: () {
                setState(() {



                  _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser!.email.toString()).collection('sepettim').doc(widget.urun_id).set({
                    "id" : widget.urun_id,
                    "durum" : "sepette",



                  });

                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new sepet()));


                });
              }, child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding / 2),
                  child: Icon(Icons.shopping_cart)
              ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Constants.green),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                ),),
            ),

            SizedBox(width: 20,),


            Container(
              width: 100,
              height: 50,
              child: OutlinedButton(onPressed: () {
                setState(() {


                    _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser!.email.toString()).collection('favorilerim').doc(widget.urun_id).delete();

                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new favoriler()));




                });
              }, child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding / 2),
                  child: Icon(Icons.delete)
              ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                ),),
            ),






          ],

        ),





      ),
    );
  }
}
