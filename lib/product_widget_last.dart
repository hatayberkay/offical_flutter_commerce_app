import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/product_examine.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_common/auth_dialog_confirm.dart';


class product_widgetdd extends StatefulWidget {
  final String id;
  final String image_url;

  final String urun_adi;
  final String urun_fiyat;


  const product_widgetdd({super.key,required this.id, required this.image_url, required this.urun_adi, required this.urun_fiyat});

  @override
  _product_widgetState createState() => _product_widgetState();
}

class _product_widgetState extends State<product_widgetdd> {
/*
  final imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/commerce-fe056.appspot.com/o/mail.png?alt=media&token=6f57a585-25ae-44c9-ad12-15efea5d9163';
*/


FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.kPadding),
      child: Container(



        decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: Colors.blue)),
        child: InkWell(
          onTap: () {
            setState(() {
              print("go to the store" + "${widget.id}");
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new products_examine(product_name: "${widget.id}",)));

            });
          },
          child: Column(
            children: [

              /*  CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
*/








              Stack(
                children: [
                  Image.network(widget.image_url , width: 250.0,
                    height: 200.0, fit: BoxFit.fill,),



                  InkWell(
                    onTap: () {
                      setState(() {

                        print("liked");

                        _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser!.email.toString()).collection('favorilerim').doc(widget.id).set({
                          "id" : widget.id,



                        });

                        showDialog(context: context, builder: (BuildContext context) =>
                            auth_result_dialog(text: "Eşya Favorilerinize Eklendi." , button_text: "Tamam."),);




                      });
                    },
                    child: Positioned(
                        left: 150,
                        child: HoverBuilder(builder: (isHovered) {
                          if(!isHovered)
                            return CircleAvatar(
                                backgroundColor: Colors.white, radius: 20.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/like_icon_not_selected.png"),
                                ));

                          return CircleAvatar(
                              backgroundColor: Colors.white, radius: 20.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("images/like_icon_selected.png"),
                              ));






                        },)),
                  )

                ],),


              Container(height: 1, color: Colors.black,),
              HoverBuilder(
                builder: ((isHovered) {
                  return Padding(
                    padding: const EdgeInsets.all(Constants.kPadding),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("${widget.urun_adi}" ,style: TextStyle(color: isHovered ? Colors.green : Colors.black   , fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,)),
                    ),
                  );
                }),

              ),
              Container(height: 1, color: Colors.black,),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: Text("${widget.urun_fiyat}" + " TL" ,style: TextStyle(color: Colors.black   , fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,)),
                ),

              ),
            ],
          ),
        ),


      ),
    );
  }
}
