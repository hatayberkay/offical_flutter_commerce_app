import 'package:e_commerce_official_app/auth_common/auth_dialog_confirm.dart';
import 'package:e_commerce_official_app/auth_common/auth_dialog_rejected.dart';
import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/form_container_widget.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/firebase_operations/firebase_database.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../firebase_operations/firebase_auth.dart';


class yeni_uye_kaydi extends StatefulWidget {
  const yeni_uye_kaydi({Key? key}) : super(key: key);

  @override
  _yeni_uye_kaydiState createState() => _yeni_uye_kaydiState();
}

class _yeni_uye_kaydiState extends State<yeni_uye_kaydi> {
  bool _uyelik_checkedValue = false;
  bool _kampanya_checkedValue = false;
  bool _kisisel_veriler_checkedValue = false;


  TextEditingController _controller_ad = TextEditingController();
  TextEditingController _controller_soyad = TextEditingController();
  TextEditingController _controller_telefon = TextEditingController();
  TextEditingController _controller_e_posta = TextEditingController();
  TextEditingController _controller_sifre = TextEditingController();
  TextEditingController _controller_sifre_tekrar = TextEditingController();


  final FirebaseAuthService _auth = FirebaseAuthService();

  final firestore_database_service _firestore = firestore_database_service();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size(double.maxFinite, 210 ),
    child: (ResponsiveLayout.isTinyLimit(context) ||
    ResponsiveLayout.isTinyHeightLimit(context))
    ? Container()
        :     app_bar(),
    ),
      body: SingleChildScrollView(
        child: Container(


          child: Row(

            children: [

              Spacer(),

              Container(
                child: Column(
crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Üye Ol",
                        style: TextStyle(
                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 30
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: TextButton(onPressed: () {


                      },
                          child: Text("Eğer daha önce kayıt olduysanız, lütfen oturum açma sayfasına gidiniz.",
                            style: TextStyle(
                                fontFamily:  'Poppins', fontWeight: FontWeight.w300, fontSize: 15
                            ),)
                      ),
                    ),



                    SizedBox(height: 10,),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Üyelik Bilgileri",
                        style: TextStyle(
                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    Container(
            width: 1100,
            color: Colors.yellow,
            height: 1,
          ),

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
                          hintText: "Adınızı giriniz.",
                        ),
                      ),

                        SizedBox(height: 10,),
                    ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Soyad" , style: TextStyle(
                        fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                    ),),
                      SizedBox(height: 10,),
                      Container(
                        width: 1100,
                        child: FormContainerWidget(
                          controller: _controller_soyad,
                          hintText: "Soyadınızı giriniz.",
                        ),
                      ),
                        SizedBox(height: 10,),

                    ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Telefon" , style: TextStyle(
                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                        ),),
                        SizedBox(height: 10,),
                        Container(
                          width: 1100,
                          child: FormContainerWidget(
                            controller: _controller_telefon,
                            hintText: "Telefon numarınızı giriniz.",
                            inputType: TextInputType.number ,

                          ),
                        ),

                        SizedBox(height: 10,),
                      ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-Posta" , style: TextStyle(
                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                        ),),
                        SizedBox(height: 10,),
                        Container(
                          width: 1100,
                          child: FormContainerWidget(
                            controller: _controller_e_posta,

                            hintText: "E-Posta adresinizi giriniz.",
                          ),
                        ),
                        SizedBox(height: 10,),

                      ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Şifre" , style: TextStyle(
                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                        ),),
                        SizedBox(height: 10,),
                        Container(
                          width: 1100,
                          child: FormContainerWidget(
                            controller: _controller_sifre,
                            hintText: "Şifrenizi giriniz.",
                          ),
                        ),
                        SizedBox(height: 10,),

                      ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Şifre Tekrar" , style: TextStyle(
                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                        ),),
                        SizedBox(height: 10,),
                        Container(
                          width: 1100,
                          child: FormContainerWidget(
                            controller: _controller_sifre_tekrar,
                            hintText: "Tekrar aynı şifreyi giriniz.",
                          ),
                        ),

                        SizedBox(height: 10,),
                      ],),


                    SizedBox(height: 20,),

                    Container(
                      width: 1100,
                      height: 300,
                      color: Constants.white,
                      child: Column(



                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                TextButton(onPressed: () {setState(() {

                                });}, child: Text("Üyelik Sözleşmesi")),


                                Container(
                                  width: 50,
                                  height: 100,
                                  child: Checkbox(
                                    value: _uyelik_checkedValue , onChanged: (d) {
                                      setState(() {
                                        _uyelik_checkedValue = !_uyelik_checkedValue;


                                      });

                                  },
                                  ) ),

                                Text("Okudum.Kabul ediyorum"),
                              ],

                            ),

                            Container(
                              width: 300,
                              height: 50,
                              child: OutlinedButton(

                                onPressed: ()  {






                                  setState(() async {


                                    if(_controller_ad.text.isNotEmpty || _controller_soyad.text.isNotEmpty
                                        || _controller_telefon.text.isNotEmpty || _controller_e_posta.text.isNotEmpty
                                        || _controller_sifre.text.isNotEmpty || _controller_sifre_tekrar.text.isNotEmpty)

                                    {
                                      if(_controller_sifre.text.toString() == _controller_sifre_tekrar) {

                                        if(_uyelik_checkedValue == true && _kisisel_veriler_checkedValue == true) {

                                          _auth.signUpWithEmailAndPassword(_controller_e_posta.text.toString() , _controller_sifre.text.toString());
                                          _firestore.uyelik_kayit_ilk_kez(_controller_ad.text.toString(), _controller_soyad.text.toString(), _controller_telefon.text.toString(),
                                              _controller_e_posta.text.toString() , _kampanya_checkedValue.toString());

                                          showDialog(context: context, builder: (BuildContext context) =>
                                              auth_result_dialog(text: "Üyeliğiniz oluşturuldu." , button_text: "Anladım"),


                                          );


                                        }else {

                                          showDialog(context: context, builder: (BuildContext context) =>
                                              auth_dialog_rejected(text: "Devam edebilmek için üyelik sözleşmesi ve KVKK sözleşmesini kabul ediniz." , button_text: "Anlaşıldı"),


                                          );

                                        }





                                      }else {

                                        showDialog(context: context, builder: (BuildContext context) =>
                                            auth_dialog_rejected(text: "Şifreleriniz uyuşmuyor." , button_text: "Tekrar deneyin"),


                                        );


                                      }

                                    }else {
                                      showDialog(context: context, builder: (BuildContext context) =>
                                          auth_dialog_rejected(text: "Tüm bilgileri eksiksiz doldurduğunuzdan emin olunuz." , button_text: "Bilgileri kontrol et"),


                                      );

                                    }









                                  });







                                },
                                style: ButtonStyle(

                                  backgroundColor: MaterialStateProperty.all(Colors.yellow[800]),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) ,  )),
                                ),
                                child: const Text("Kayıt Formunu Gönder" , style: TextStyle(color: Constants.lightblack,
                                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                                ),),
                              ),
                            ),
                            SizedBox(height: 20,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                    width: 50,
                                    height: 50,
                                    child: Checkbox(
                                      value: _kampanya_checkedValue , onChanged: (d) {
                                      setState(() {
                                        _kampanya_checkedValue = !_kampanya_checkedValue;


                                      });

                                    },
                                    ) ),

                                Text("Kampanyalardan haberdar olabilmem için kişisel verilerimin işlenmesini \n ve tarafıma elektronik ileti gönderilmesini kabul ediyorum."),
                              ],


                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                    width: 50,
                                    height: 50,
                                    child: Checkbox(
                                      value: _kisisel_veriler_checkedValue , onChanged: (d) {
                                      setState(() {
                                        _kisisel_veriler_checkedValue = !_kisisel_veriler_checkedValue;


                                      });

                                    },
                                    ) ),

                                Text("Kişisel verilerimin işlenmesine yönelik aydınlatma metnini okudum ve anladım."),
                              ],

                            ),
                          ]),

                    )


                  ],

                ),
              ),

              Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}

