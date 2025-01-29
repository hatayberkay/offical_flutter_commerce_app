

import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/footage/footage.dart';
import 'package:e_commerce_official_app/destop/satis_sepet_ve_favoriler/favoriler.dart';
import 'package:e_commerce_official_app/destop/satis_sepet_ve_favoriler/satis_first.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:collection/collection.dart';



class sepet extends StatefulWidget {
  const sepet({Key? key}) : super(key: key);

  @override
  _sepetState createState() => _sepetState();
}





class _sepetState extends State<sepet> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> liste_adi = [];
  List<String> urun_adi_listem = [];
  List<String> urun_fiyati_listem = [];
  List<String> urun_gorsel_listem = [];

  List<String> kupon_id_listem = [];
  List<String> kupon_adi_listem = [];
  List<String> kupon_harcama_listem = [];
  List<String> kupon_aciklama_listem = [];
  List<String> kupon_miktar_listem = [];
  List<String> kupon_son_kullanma_listem = [];

  String urun_fiyati = "0";

  List<String> urun_fiyat_toplam = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
   liste_adi = [];
  urun_adi_listem = [];
       urun_fiyati_listem = [];
    urun_gorsel_listem = [];


   kupon_id_listem = [];
   kupon_adi_listem = [];
   kupon_harcama_listem = [];
   kupon_aciklama_listem = [];
   kupon_miktar_listem = [];
   kupon_son_kullanma_listem = [];

      message();

   kupon_indir();
    });




  }

 /* await for(snap in FirebaseFirestore.instance
      .collection('products')
      .doc(message.data()["id"])
      .snapshots() ) {
  for(var message in snap.docs){


  }

  }
*/


  void kupon_indir() async {




    await for(var snapshots in   FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser?.email.toString())
        .collection("kuponlarim")
        .snapshots()){
      for(var message in snapshots.docs){


        //  print(message.data()["id"]+ "ddd");
        kupon_id_listem.add(message.data()["id"]);


        print(message.id + "dddd");


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
      for (int i = 0; i < kupon_id_listem.length; i++) {

        var points = await FirebaseFirestore.instance
            .collection('kuponlar')
            .doc(kupon_id_listem[i]) //kupon_id_listem[i]
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Map data = (documentSnapshot.data() as Map);







            setState(() {
              kupon_adi_listem.add(data['kupon_adi']);
              kupon_aciklama_listem.add(data['kupon_aciklama']);
              kupon_harcama_listem.add(data['kupon_harcama_limiti']);
              kupon_miktar_listem.add(data['kupon_miktar']);
              kupon_son_kullanma_listem.add(data['kupon_son_kullanma_tarihi']);

            });





          }
        });


      }





    }

  }

  void message() async {




    await for(var snapshots in   FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser?.email.toString())
        .collection("sepettim")
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

            });




       /*     for (var entry in data['durum'].values) {
              print(entry);


              listem_adi.add(entry);
            }

            data.forEach((key, value) {
              print('adding entry' + value["durum"]);

            });
*/


          }
        });


      }



/*

      QuerySnapshot querySnapshot = await  FirebaseFirestore.instance.collection('products').get();
      final allData = querySnapshot.docs.map((doc) {

        print(doc.data()["name"]);


       // doc.data()!).toList();

      };
*/







/*
      for (int i = 0; i < liste_adi.length; i++) {

        await   for(var snapshotsdd in   FirebaseFirestore.instance
            .collection('products')
            .doc(liste_adi[i].toString())

            .snapshots() ){

      //    for(var message in snapshotsdd!){

            print(snapshotsdd.data()!["kategori"] + "dddd");


            //  print(message.data()["id"]+ "ddd");
          //  liste_adi.add(message.data()["id"]);

     //    }




        }

      }
*/







/*
      for (int i = 0; i < liste_adi.length; i++) {
        // add data to list you want to return.
        await for(var snapshotsdd in   FirebaseFirestore.instance
            .collection('products')
            .doc(message.data()["id"])
            .snapshots()){

          print(snapshotsdd.data()!["durum"]+ "dddr");


          */
/*    for(var message in snapshotsdd.data()){


          }*//*


          //   liste_adi.add(snapshotsdd.data()!["durum"]);




          //    _data[index].data()['kasa_adi']

        }
      }
*/









      //    _data[index].data()['kasa_adi']

    }

  }


  List<String> userChecked = [];

  // fiyat listesi
  List<int> userChecked_sum_up = [];

  // fiyat idleri

  List<String > userChecked_ids = [];

  int calculated_sum_up = 0;

  void _onSelected(bool selected, String dataName, String urun_id) {
    if (selected == true) {
      setState(() {

        String string = dataName;
        var parts = string.split('.');
        String first = parts[0].trim().toString();                 // prefix: "date"
        String second = parts[1].trim();
        String last = first + second;
        int last_last = int. parse(last);


       userChecked_sum_up.add(last_last);


        final sum = userChecked_sum_up.sum;

        calculated_sum_up = sum;




        userChecked_ids.add(urun_id);


        userChecked.add(dataName);
        // print(userChecked );




      });
    } else {
      setState(() {

        String string = dataName;
        var parts = string.split('.');
        String first = parts[0].trim().toString();                 // prefix: "date"
        String second = parts[1].trim();
        String last = first + second;
        int last_last = int. parse(last);

        //userChecked_fee.remove(last as int);

        userChecked.remove(dataName);
        userChecked_sum_up.remove(last_last);
        final sum = userChecked_sum_up.sum;
        calculated_sum_up = sum;

        userChecked_ids.remove(urun_id);


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
                  width: 700,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Constants.kPadding),
                      child: FittedBox(fit: BoxFit.scaleDown,
                      child: Text("Sepetim", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                      ),
                    ),

                    SizedBox(height: 20,),




          ListView.builder(
            shrinkWrap: true,

            itemBuilder: (context, index) =>



            Row(
              children: [



          //you can use checkboxlistTile too

                Checkbox(
                  value: userChecked.contains(urun_fiyati_listem[index]),
                  onChanged: (value) {
                    _onSelected(value!, urun_fiyati_listem[index] , liste_adi[index].toString());
                  },
                ),
                sepete_eklenmis_urunler( id: liste_adi[index].toString(),  urun_adi: urun_adi_listem[index].toString() ,
                  urun_fiyat: urun_fiyati_listem[index].toString(), image_url: urun_gorsel_listem[index].toString(),),




              ],

            ),




            itemCount: urun_adi_listem.length.toInt() ,
          ),


                  /*  StreamBuilder <QuerySnapshot<Map<String, dynamic>>>(
                        stream:  FirebaseFirestore.instance
                            .collection('Users')
                            .doc(FirebaseAuth.instance.currentUser?.email.toString())
                        .collection("sepettim")
                            .snapshots(),
                        builder: (BuildContext context,
                           snapshot) {
                          if (snapshot.hasData) {




                            return GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 20,
                                childAspectRatio: 0.75,
                              ),
                              itemBuilder: (context, index) =>
                                  Text(snapshot.data!.docs[index].get("id")),

                                  StreamBuilder <QuerySnapshot<Map<String, dynamic>>>(
                                      stream:  FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(FirebaseAuth.instance.currentUser?.email.toString())
                                          .collection("sepettim")
                                          .snapshots(),
                                      builder: (BuildContext context,
                                          snapshot) {
                                        if (snapshot.hasData) {




                                          return GridView.builder(
                                            shrinkWrap: true,
                                            gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              crossAxisSpacing: 20,
                                              childAspectRatio: 0.75,
                                            ),
                                            itemBuilder: (context, index) =>





                                                Text(snapshot.data!.docs[index].get("id")),

                                            itemCount: snapshot.data!.docs.length,
                                          );
                                        }
                                        return CircularProgressIndicator();
                                      }),






                              itemCount: snapshot.data!.docs.length,
                            );
                          }
                          return CircularProgressIndicator();
                        }),*/




                    
                    
              /*      sepete_eklenmis_urunler(),
                    sepete_eklenmis_urunler(),
                    sepete_eklenmis_urunler(),
                    sepete_eklenmis_urunler(),
*/





                  ],
                ),

                ),


                SizedBox(width: 20,),


// Odeme işlemleri
                Column(
                  children: [
                    SizedBox(width: 20,),




                    SizedBox(height: 20,),

                    Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(Constants.kPadding),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Sipariş Özeti" , style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20), ),

                            ),


                            Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("Ürün Toplamı: " , style: TextStyle(fontWeight: FontWeight.w800,),),

                                  ),


                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text( calculated_sum_up.toString() + " TL "),

                                  ),
                                ],
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("Kargo Toplamı " , style: TextStyle(fontWeight: FontWeight.w800,),),

                                  ),


                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("30 TL "),

                                  ),
                                ],
                              ),
                            ),

                            Container(width: 400, height: 1, color: Constants.white,),

                            Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("Toplam: " , style: TextStyle(fontWeight: FontWeight.w800,),),

                                  ),

                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("${calculated_sum_up + 30}" + "TL "),

                                  ),


                                ],),
                            ),


                            Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: Container(
                                width: 250,
                                height: 50,
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {


                                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new satis_first(alinacak_urunler_id_list: userChecked_ids
                                          , fiyat: "${calculated_sum_up + 30}"),
                                      ),
                                      );

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
                            ),


                          ],

                        ),
                      ),


                    ),


                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.all(Constants.kPadding),
                      child: Container(
                        width: 250,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(()  {


                              kupon_indir();



                            });


                          },
                          child: Padding(
                            padding: const EdgeInsets.all(Constants.kPadding / 2),
                            child: Text("Kupon Kullan" , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Constants.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),









              ],





            ),


            SizedBox(height: 100),

            if(kupon_id_listem.length.toInt() > 0 )
              ListView.builder(
                shrinkWrap: true,

                itemBuilder: (context, index) =>



                    Column(
                      children: [

                    kupon_widget(kupon_id: kupon_id_listem[index].toString(), kupon_adi: kupon_adi_listem[index].toString(), kupon_aciklama:kupon_aciklama_listem[index].toString(),
                      kupon_miktar: kupon_miktar_listem[index].toString(),
                    kupon_harcama_limit: kupon_harcama_listem[index].toString(),
                        kupon_son_kullanma: kupon_son_kullanma_listem[index].toString(),

    ),




                      ],

                    ),




                itemCount: kupon_id_listem.length.toInt() ,


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





class kupon_widget extends StatefulWidget {


  final String kupon_id;
  final String kupon_adi;
  final String kupon_aciklama;
  final String kupon_harcama_limit;
  final String kupon_miktar;
  final String kupon_son_kullanma;

  const kupon_widget({super.key , required this.kupon_id, required this.kupon_adi, required this.kupon_aciklama
  , required this.kupon_harcama_limit, required this.kupon_miktar , required this.kupon_son_kullanma});

  @override
  _kupon_widgetState createState() => _kupon_widgetState();
}

class _kupon_widgetState extends State<kupon_widget> {
  @override
  Widget build(BuildContext context) {
    bool _kupon_sec_checkedvalue = false;

    return Container(
      width: 700,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.white),
      child: Row(
          children: [

            Container(
                width: 50,
                height: 100,
                child: Checkbox(
                  value: _kupon_sec_checkedvalue , onChanged: (d) {
                  setState(() {


                    _kupon_sec_checkedvalue = !_kupon_sec_checkedvalue;

                  });

                },
                ) ),


        Container(
          height: 150,


          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Container(
                    height: 150,
                    child: Center(child: Image.asset("images/discount.png", height: 100,))),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text(widget.kupon_adi , style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Avenir',
                    ),),
                    SizedBox(height: 20,),

                    Text(widget.kupon_aciklama , style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Avenir',
                    ),),
                    SizedBox(height: 20,),
                    Text(widget.kupon_miktar + "TL'lik indirim hakkınız var.", style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Avenir',
                    ),),


                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(widget.kupon_harcama_limit +"'TL mininum alışveriş tutarında geçerli olmak üzere." , style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF918fa3),
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Text("Son Kullanma Tarihi: " +widget.kupon_son_kullanma, style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Avenir',
                    ),),

                  ],)


              ]),

        ),


         /*   SizedBox(width: 20,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("${widget.kupon_adi}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                ),
                SizedBox(height: 20,),

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("${widget.kupon_aciklama}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                ),
              ],

            ),


            SizedBox(width: 20,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("${widget.kupon_harcama_limit}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                ),
                SizedBox(height: 20,),

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("${widget.kupon_miktar}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                ),

                SizedBox(height: 20,),

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("${widget.kupon_son_kullanma}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                ),
              ],

            ),*/



          ]),


    );
  }
}



class sepete_eklenmis_urunler extends StatefulWidget {
  final String id;

  final String image_url;

  final String urun_adi;
  final String urun_fiyat;




  const sepete_eklenmis_urunler({super.key , required this.id, required this.image_url, required this.urun_adi , required this.urun_fiyat });

  @override
  _sepete_eklenmis_urunlerState createState() => _sepete_eklenmis_urunlerState();
}

class _sepete_eklenmis_urunlerState extends State<sepete_eklenmis_urunler> {

  bool _sepet_sec_checkedvalue = false;
  int tane_int = 0;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.kPadding),
      child: Container(
        width: 600,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Constants.white),

        child: Row(

          children: [

  /*          Container(
                width: 50,
                height: 100,
                child: Checkbox(

                  value: _sepet_sec_checkedvalue , onChanged: (d) {
                  setState(() {

                 //   toplam == widget.onChanged!(widget.urun_fiyat);

                   // widget.onChanged!("0")
                    _sepet_sec_checkedvalue = !_sepet_sec_checkedvalue;
                    d  == true ?    widget.onChanged!(widget.urun_fiyat) : null ;

                //    widget.onChanged!("-" +widget.urun_fiyat)





                  });

                },
                ) ),
*/

        //    snapshot.data!['gorsel_link_first']
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
                  child: Text("${widget.urun_fiyat} ", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                ),
                SizedBox(height: 20,),

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("Tahmini veriliş tarihi : 02.11.1995", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                ),
              ],

            ),

            SizedBox(width: 40,),


       /*     IconButton(onPressed: () {
              setState(() {
                tane_int--;


                var str = widget.urun_fiyat;
                var parts = str.split('.');
                var first = parts[0].trim();                 // prefix: "date"
                var date = parts[1].trim();

                String new_price = first + date;

                print(new_price + "wwww");

               widget.urun_fiyat == int.parse(new_price * tane_int);

              });



            }, icon: Icon(Icons.remove)),

            Text("${tane_int}"),

            IconButton(onPressed: () {
              setState(() {
                tane_int++;


                var str = widget.urun_fiyat;
                var parts = str.split('.');
                var first = parts[0].trim();                 // prefix: "date"
                var date = parts[1].trim();

                String new_price = first + date;

                print(new_price + "wwww");

                widget.urun_fiyat == int.parse(new_price * tane_int);

               *//* var myInt = int.parse(widget.urun_fiyat);

                widget.urun_fiyat == myInt.toString();*//*
              });


            }, icon: Icon(Icons.add_rounded)),
*/
            SizedBox(width: 40,),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text("${widget.urun_fiyat} TL", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

            ),

            SizedBox(width: 20,),
            IconButton(onPressed: () {

              FirebaseFirestore.instance
                  .collection('Users')
                  .doc(FirebaseAuth.instance.currentUser?.email.toString())
                  .collection("sepettim")
                  .doc("${widget.id}").delete();

              setState(() {




                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new sepet()));


              });

            }, icon: Icon(Icons.delete)),


          ],

        ),





      ),
    );
  }
}
