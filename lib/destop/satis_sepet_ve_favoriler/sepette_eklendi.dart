import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/product_widget.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/main.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../footage/footage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class sepete_eklendi extends StatefulWidget {
  final String product_name;



  const sepete_eklendi({super.key, required this.product_name});

  @override
  _sepete_eklendiState createState() => _sepete_eklendiState();
}

class _sepete_eklendiState extends State<sepete_eklendi> {
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

      computer: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(

                children: [
                  Spacer(),


// Eklendi yazısı
                  Column(

                      children: [




                        Container(
                          width: 700,
                          height: 350,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                          child: Column(



                              children: [

                                SizedBox(height: 20,),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [

                                    Image.asset("images/confirm.png", width: 50, height: 50,),


                                    SizedBox(width: 20,),

                                    Text("Ürününüz sepete eklendi", style: TextStyle(fontSize: 20, color: Colors.green),),


                                  ],),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(Constants.kPadding),
                                  child: Container(width: 700, height: 2,
                                  color: Constants.white,

                                  ),
                                ),

                                Row(

                                 crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [



                                    StreamBuilder<DocumentSnapshot>(
                                        stream:  FirebaseFirestore.instance
                                            .collection('products')
                                            .doc("${widget.product_name}")
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                                          if (snapshot.hasData) {
                                            return Container(child:
                                            Row(
                                              children: [


                                                Padding(
                                                  padding: const EdgeInsets.all(Constants.kPadding),
                                                  child: Image.network(snapshot.data!['gorsel_link_first'] ,
                                                    fit: BoxFit.fill, width: 200, height: 200,),
                                                ),

                                                SizedBox(width: 20,),

                                                Padding(
                                                  padding: const EdgeInsets.all(Constants.kPadding),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,

                                                    children: [
                                                      Text(snapshot.data!['urun_adi']  , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),

                                                      SizedBox(height: 20,),

                                                      Text(snapshot.data!['urun_fiyati'] , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),



                                                    ],


                                                  ),
                                                ),



                                                  ],
                                            ));
                                          }
                                          return CircularProgressIndicator();
                                        }),






                                ],),








                              ]),



                        ),






                  ]),



                  SizedBox(width: 20,),


                  // Sipariş sonuç secenekleri
                  Container(
                    width: 400,
                    height: 350,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [


                        Container(
                          width: 250,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {



                              });


                            },
                            child: Padding(
                              padding: const EdgeInsets.all(Constants.kPadding / 2),
                              child: Text("Siparişi Tamamla" , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Constants.green),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(

                          width: 250,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {



                              });


                            },
                            child: Padding(
                              padding: const EdgeInsets.all(Constants.kPadding / 2),
                              child: Text("Sepete Git" , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Constants.white),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(

                          width: 250,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {


                                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => MyHomePage(title: "Flutter Demo Home Page")));

                              });


                            },
                            child: Padding(
                              padding: const EdgeInsets.all(Constants.kPadding / 2),
                              child: Text("Keşfetmeye Devam et" , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10),),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Constants.white),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                            ),
                          ),
                        ),
                      ],

                    ),


                  ),

                  Spacer(),
                ],
              ),



              SizedBox(height: 50,),


              // Benzer Ürünler

              Container(
                width: 1100 ,

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white,),

                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Benzer Ürünler",
                              style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 30),),
                          ),
                        ),


                        Row(

                          children: [

                            Spacer(),


                            Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: product_widget(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: product_widget(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: product_widget(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: product_widget(),
                            ),


                            Spacer(),

                          ],


                        )


                      ]),
                ),


              ),


              SizedBox(height: 50,),

              //Footage

              Container(
                  width: 1100 ,

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white,),

                  child: footage()),


            ],
          ),
        ),




      ),
      largeTablet: Container(),
      tablet: Container(),
      phone: Container(),
      tiny: Container(),



    ),);
  }
}

