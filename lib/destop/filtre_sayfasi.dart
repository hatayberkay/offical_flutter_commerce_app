import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/form_container_widget.dart';
import 'package:e_commerce_official_app/common/product_widget.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/footage/footage.dart';
import 'package:e_commerce_official_app/product_widget_last.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class filtre extends StatefulWidget {
  final String alt_kategori;


  const filtre({super.key , required this.alt_kategori});

  @override
  _filtreState createState() => _filtreState();
}

class _filtreState extends State<filtre> {
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

                      SizedBox(height: 20,),


                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          filtre_arama_yeri(),


                          SizedBox(width: 20,),

                          Container(
                            width: 700,
                            height: 600,
                            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>( // inside the <> you enter the type of your stream
                              stream: FirebaseFirestore.instance.collection("products").snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {

                                  List<dynamic> map =     snapshot.data!.docs.where((element) => element["kategori_alt"].toString().toLowerCase().contains(widget.alt_kategori)).toList();

                                  print(snapshot.data!.docs.length.toString() + "asd");
                                  print( snapshot.data!.docs[0].get("durum") + "asd");


                                  return GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 20,
                                        childAspectRatio: 0.45,
                                      ),
                                      itemBuilder: (context, index) =>
                                      //     product_widget(),
                                      //    product_widget(),
                                      //    Text(snapshot.data!.docs.length.toString() ),


                                      // Text(snapshot.data!.docs[index].get("urun_fiyati")),

                                      product_widgetdd(id:  snapshot.data!.docs[index].id ,image_url: snapshot.data!.docs[index].get("gorsel_link_first"), urun_adi: snapshot.data!.docs[index].get("urun_adi"),
                                        urun_fiyat: snapshot.data!.docs[index].get("urun_fiyati"),
                                      ),

                                      itemCount: map.length // snapshot.data!.docs.length,
                                  );


                                }
                                if (snapshot.hasError) {
                                  return const Text('Error');
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                     //


                       /*   product_widget(),

                          product_widget(),
*/



                        ],

                      ),








                    ],
                  ),

                ),












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

class filtre_arama_yeri extends StatefulWidget {
  const filtre_arama_yeri({Key? key}) : super(key: key);

  @override
  _filtre_arama_yeriState createState() => _filtre_arama_yeriState();
}

class _filtre_arama_yeriState extends State<filtre_arama_yeri> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            FittedBox(fit: BoxFit.scaleDown, child: Text("Fiyat" , style: TextStyle(fontWeight: FontWeight.w800)),),

            SizedBox(height: 10,),

            Container(width: 450, height: 1, color: Constants.white,),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [


                Container(
                  width: 100,
                  height: 40,
                  child: FormContainerWidget(
                    labelText: "0",


                  ),

                ),

                Text("TL"),


                Container(
                  width: 100,
                  height: 40,
                  child: FormContainerWidget(
                    labelText: "100",


                  ),

                ),


            ],),

            SizedBox(height: 10,),

            FittedBox(fit: BoxFit.scaleDown, child: Text("Kategoriler" , style: TextStyle(fontWeight: FontWeight.w800)),),

            SizedBox(height: 10,),

            Container(width: 450, height: 1, color: Constants.white,),
          ],


        ),
      ),




    );
  }
}
