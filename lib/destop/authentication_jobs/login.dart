import 'package:e_commerce_official_app/auth_common/auth_dialog_rejected.dart';
import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/form_container_widget.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/authentication_jobs/uye_kaydi.dart';
import 'package:e_commerce_official_app/destop/footage/footage.dart';
import 'package:e_commerce_official_app/destop/login_destop/user_login_page.dart';
import 'package:e_commerce_official_app/firebase_operations/firebase_auth.dart';
import 'package:e_commerce_official_app/firebase_operations/firebase_database.dart';
import 'package:e_commerce_official_app/main.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';


class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size(double.maxFinite, 210 ),
        child: (ResponsiveLayout.isTinyLimit(context) ||
            ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            :  app_bar(),
      ),
      body: ResponsiveLayout(
        computer: Container(
          color: Constants.white,
          child: Column(

              children: [


                SizedBox(height: 20,),

                Row(

                  children: [
                    Spacer(),
// giriş yap
                    Container(
                        height: 450,
                        child: giris_yap()),

                    SizedBox(width: 20,),

                    // kayit ol
                    Container(
                      height: 450,
                      child:   uye_ol_yazi(),),
                    Spacer(),
                  ],


                )


          ]),

        ),
        largeTablet: Container(),
        tablet: Container(),
        phone: Container(),
        tiny: Container(),

      ),
    );
  }
}


class giris_yap extends StatefulWidget {
  const giris_yap({Key? key}) : super(key: key);

  @override
  _giris_yapState createState() => _giris_yapState();
}

class _giris_yapState extends State<giris_yap> {
  TextEditingController _controller_e_mail = TextEditingController();
  TextEditingController _controller_sifre = TextEditingController();
  FirebaseAuthService _auth = FirebaseAuthService();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 550,
      child: Center(
        child: Column(


            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                        fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 30
                    ),
                  ),
                ),
              ),

            SizedBox(height: 10,),

            Container(
              width: 300,
              child: FormContainerWidget(
                controller: _controller_e_mail,
                hintText: "E-Posta Adresiniz",
              ),
            ),
              SizedBox(height: 10,),
              Container(
                width: 300,
                child: FormContainerWidget(
                  controller: _controller_sifre,
                  isPasswordField: true,

                  hintText: "Şifreniz",
                ),
              ),
              SizedBox(height: 20,),

              TextButton(onPressed: () {}, child: Text("Parolamı Unuttum")),
              SizedBox(height: 10,),
              Container(
                width: 300,
                height: 50,
                child: OutlinedButton(

                  onPressed: ()  {
// hatayberkay1234@gmail.com




                    setState(() async {


                      _auth.signInWithEmailAndPassword(_controller_e_mail.text,_controller_sifre.text).then((value) =>
                          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new user_login_page() ))


                      ).catchError((error) => showDialog(context: context, builder: (BuildContext context) {
                        return auth_dialog_rejected(text: "Bilgilerinizi kontrol ediniz.", button_text: "Tekrar dene");


                      } ) );


                    });







                  },
                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) , )),
                  ),
                  child: const Text("Giriş Yap" , style: TextStyle(color: Constants.lightblack,
                      fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                  ),),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 300,
                height: 50,
                child: OutlinedButton(

                  onPressed: ()  {
// hatayberkay1234@gmail.com




                    setState(() async {

                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new yeni_uye_kaydi()));



                    });







                  },
                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all(Colors.yellow[800]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) ,  )),
                  ),
                  child: const Text("Üye Ol" , style: TextStyle(color: Constants.lightblack,
                      fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                  ),),
                ),
              ),
              SizedBox(height: 10,),



        ]),
      ),

    );
  }
}

class uye_ol_yazi extends StatefulWidget {
  const uye_ol_yazi({Key? key}) : super(key: key);

  @override
  _uye_ol_yaziState createState() => _uye_ol_yaziState();
}

class _uye_ol_yaziState extends State<uye_ol_yazi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 550,
      child: Column(


          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Üye Ol",
                  style: TextStyle(
                      fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 30
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Üye ol", style: TextStyle(color: Constants.lightblack, fontSize: 20, fontWeight: FontWeight.w900),),
                  SizedBox(height: 10,),
                  Text("Hızlı ve güvenli bir alışveriş için yeni bir hesap oluşturun. Böylece sipariş durumunuzu takip edebilir ve önceki siparişlerinize göz atabilirsiniz."
                  , style: TextStyle(color: Constants.lightblack, fontSize: 20, fontWeight: FontWeight.w700),),
                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      lazy_mark(text: "Avantajlı Alışveriş", image_text: "star_icon",),
                      SizedBox(width: 10,),
                      lazy_mark(text: "Bol Çeşit, Kolay Erişim", image_text: "easy_icon",),
                      SizedBox(width: 10,),
                      lazy_mark(text: "Güvenli Platform", image_text: "safety_icon",),

                    ],
                  ),
                  SizedBox(height: 30,),

                ],),
            ),

            Container(
              width: 300,
              height: 50,
              child: OutlinedButton(

                onPressed: ()  {


                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new yeni_uye_kaydi()));



                  setState(() async {
                  });







                },
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all(Colors.yellow[800]),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) ,  )),
                ),
                child: const Text("Üye Ol" , style: TextStyle(color: Constants.lightblack,
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                ),),
              ),
            ),
            SizedBox(height: 10,),



          ]),

    );
  }
}

class lazy_mark extends StatelessWidget {
  final String text;
  final String image_text;
  const lazy_mark({super.key, required this.text, required this.image_text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [



          Image.asset("images/" + "$image_text" + ".png" , width: 50,  height: 50,),
          SizedBox(height: 10,),
          Text("$text", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),




        ],

      ),
    );
  }
}

