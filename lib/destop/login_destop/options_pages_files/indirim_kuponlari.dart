import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/product_widget_last.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class indirim_kuponlari extends StatefulWidget {
  const indirim_kuponlari({Key? key}) : super(key: key);

  @override
  _indirim_kuponlariState createState() => _indirim_kuponlariState();
}

class _indirim_kuponlariState extends State<indirim_kuponlari> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 600,
      color: Constants.white,
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Column(

            children: [


              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>( // inside the <> you enter the type of your stream
                stream: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.email).collection("kuponlarim").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    /*    print(snapshot.data!.docs.length.toString() + "asd");
                          print( snapshot.data!.docs[0].get("durum") + "asd");*/


                    return ListView.builder(
                      shrinkWrap: true,

                      itemBuilder: (context, index) =>

                          kuponlarim(kupon_adi: snapshot.data!.docs[index].get("kupon_adi"), kupon_aciklama: snapshot.data!.docs[index].get("kupon_aciklama") ,
                          kupon_miktari: snapshot.data!.docs[index].get("kupon_miktari") , kupon_harcama_limiti:  snapshot.data!.docs[index].get("kupon_harcama_limiti") ,
                            kupon_son_kullanma_tarihi: snapshot.data!.docs[index].get("kupon_son_kullanma_tarihi")  ,
                          ),
                         //   urun_fiyat: snapshot.data!.docs[index].get("urun_fiyati"),

                      itemCount: snapshot.data!.docs.length,
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),



        ]),
      ),


    );
  }
}


class kuponlarim extends StatefulWidget {
  final String kupon_adi;
  final String kupon_aciklama;
  final String kupon_harcama_limiti;
  final String kupon_miktari;
  final String kupon_son_kullanma_tarihi;


  const kuponlarim({super.key , required this.kupon_adi, required this.kupon_aciklama, required this.kupon_harcama_limiti, required this.kupon_miktari, required this.kupon_son_kullanma_tarihi});

  @override
  _kuponlarimState createState() => _kuponlarimState();
}

class _kuponlarimState extends State<kuponlarim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.white),

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
                Text(widget.kupon_miktari + "TL'lik indirim hakkınız var.", style: TextStyle(
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
            Text(widget.kupon_harcama_limiti +"'TL mininum alışveriş tutarında geçerli olmak üzere." , style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
              color: Color(0XFF918fa3),
            ),),
            SizedBox(height: 20,),
            Text("Son Kullanma Tarihi: " +widget.kupon_son_kullanma_tarihi, style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Avenir',
            ),),

        ],)


      ]),

    );
  }
}
