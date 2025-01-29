import 'package:e_commerce_official_app/auth_common/auth_dialog_confirm.dart';
import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class duyuru_tercihleri extends StatefulWidget {
  const duyuru_tercihleri({Key? key}) : super(key: key);

  @override
  _duyuru_tercihleriState createState() => _duyuru_tercihleriState();
}


class _duyuru_tercihleriState extends State<duyuru_tercihleri> {



  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool duyuru_checkedbox = false;


  @override
  void initState() {


    _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email)
        .get().then((value) {
          setState(() {

      duyuru_checkedbox = value.data()?["duyuru"];

        });});
    super.initState();







  }


  @override
  Widget build(BuildContext context) {




    return Container(
      width: 700,
      height: 600,
      color: Constants.white,
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

            children: [


              SizedBox(height: 20,),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Kampanya, İndirim veya Duyuru bildirim tercihi",         style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 15),),

              ),
              SizedBox(height: 20,),

              Container(width: 700, height: 1, color: Constants.lightblack,),
              SizedBox(height: 20,),


              Row(children: [

                Checkbox(value: duyuru_checkedbox, onChanged: (d) {

                  setState(() {
                    duyuru_checkedbox = !duyuru_checkedbox;

                  });
                }
                ),

              SizedBox(width: 20,),

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("E-Posta ile bilgilendirilmek istiyorum.",         style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 15),),

                ),


              ],),


              SizedBox(height: 20,),

              Container(
                width: 150,
                height: 50,
                child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) , )),
                      backgroundColor: MaterialStateProperty.all(Colors.green),





                    ),

                    onPressed: () {

                      setState(() {



                        _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email)
                            .update({'duyuru': duyuru_checkedbox.toString()})
                            .then((value) => print("User Updated"))
                            .catchError((error) => print("Failed to update user: $error"));



                        /*       _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email)
                                .update({

                              'ad' :  _controller_ad.text,    //_kasa_adiController.text,
                              'soyad' : _controller_soyad.text,  // selectedValue,
                              'telefon' : _controller_telefon.text , // _acilis_bakiyesiController.text,
                            });*/

                        showDialog(context: context, builder: (BuildContext context) {

                          return  auth_result_dialog(text: "Bilgileriniz Başarıyla  \n Güncellenmiştir.", button_text: "Anlaşıldı.",


                          );
// hatayberkay1234@gmail.com
                        });


                        /*

                                     */


                      });

                    }, child: Text("Güncelle", style: TextStyle(color: Constants.white), )),
              ),


            ]),
      ),

    );
  }
}
