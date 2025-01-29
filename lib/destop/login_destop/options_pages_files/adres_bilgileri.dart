import 'package:e_commerce_official_app/auth_common/auth_dialog_confirm.dart';
import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/form_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class adres_bilgileri extends StatefulWidget {
  const adres_bilgileri({Key? key}) : super(key: key);

  @override
  _adres_bilgileriState createState() => _adres_bilgileriState();
}

class _adres_bilgileriState extends State<adres_bilgileri> {

  TextEditingController _adres_bilgisi_controller = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email)
        .get().then((value) =>_adres_bilgisi_controller.text = value.data()?["adres"]);
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
                child: Text("Adres Bilgileriniz",         style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 15),),

              ),
              SizedBox(height: 20,),

              Container(width: 700, height: 1, color: Constants.lightblack,),
              SizedBox(height: 20,),


              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Adres bilgilerinizde olması gerekenler:",         style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 15, color: Colors.red),),

              ),

              SizedBox(height: 20,),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Sıralama : İL / İLÇE , MAHALLE , APARTMAN NO",         style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 15, color: Colors.red),),

              ),

              SizedBox(height: 20,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Adres Bilginiz" , style: TextStyle(
                      fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                  ),),
                  SizedBox(height: 10,),
                  Container(
                    width: 1100,
                    child: FormContainerWidget(
                      controller: _adres_bilgisi_controller,
                      hintText: "",
                    ),
                  ),

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
                                .update({'adres': _adres_bilgisi_controller.text})
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

                ],),

        ]),
      ),

    );
  }
}
