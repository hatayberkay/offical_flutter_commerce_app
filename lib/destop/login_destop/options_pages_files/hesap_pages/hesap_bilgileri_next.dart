import 'package:e_commerce_official_app/auth_common/auth_dialog_confirm.dart';
import 'package:e_commerce_official_app/auth_common/auth_dialog_rejected.dart';
import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/form_container_widget.dart';
import 'package:e_commerce_official_app/firebase_operations/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class hesap_bilgileri_next extends StatefulWidget {
  const hesap_bilgileri_next({Key? key}) : super(key: key);

  @override
  _hesap_bilgileri_nextState createState() => _hesap_bilgileri_nextState();




}




class _hesap_bilgileri_nextState extends State<hesap_bilgileri_next> {

  TextEditingController _controller_ad = TextEditingController();
  TextEditingController _controller_soyad = TextEditingController();
  TextEditingController _controller_telefon = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email)
        .get().then((value) =>_controller_ad.text = value.data()?["ad"]);
    _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email)
        .get().then((value) =>_controller_soyad.text = value.data()?["soyad"]);
    _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email)
        .get().then((value) =>_controller_telefon.text = value.data()?["telefon"]);
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

              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Hesap Bilgilerim",         style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 30),),

              ),
              SizedBox(height: 20,),
            FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Kişisel Bilgileriniz",         style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 15),),

              ),
              SizedBox(height: 20,),
              Container(width: 700, height: 1, color: Constants.lightblack,),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Ad" , style: TextStyle(
                      fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                  ),),
                  SizedBox(height: 10,),
                  Container(
                    width: 1100,
                    child: FormContainerWidget(
                      controller: _controller_ad,
                      hintText: "",
                    ),
                  ),

                  SizedBox(height: 10,),
                ],),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Soyad" , style: TextStyle(
                      fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                  ),),
                  SizedBox(height: 10,),
                  Container(
                    width: 1100,
                    child: FormContainerWidget(
                      controller: _controller_soyad,
                      hintText: "",
                    ),
                  ),

                  SizedBox(height: 10,),
                ],),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Telefon" , style: TextStyle(
                      fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                  ),),
                  SizedBox(height: 10,),
                  Container(
                    width: 1100,
                    child: FormContainerWidget(
                      controller: _controller_telefon,
                      hintText: "",
                    ),
                  ),

                  SizedBox(height: 10,),
                ],),

              SizedBox(height: 50,),
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
                            .update({

                          'ad' :  _controller_ad.text,    //_kasa_adiController.text,
                          'soyad' : _controller_soyad.text,  // selectedValue,
                          'telefon' : _controller_telefon.text , // _acilis_bakiyesiController.text,
                         });

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








        ]

      ),

    ));
  }
}
