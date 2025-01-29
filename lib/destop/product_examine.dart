import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/product_widget.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/footage/footage.dart';
import 'package:e_commerce_official_app/destop/satis_sepet_ve_favoriler/sepette_eklendi.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';


class products_examine extends StatefulWidget {
  final String product_name;
  const products_examine({super.key, required this.product_name});

  @override
  _products_examineState createState() => _products_examineState();
}

class _products_examineState extends State<products_examine> {
  bool selected_special_products = false;


  String urun_adi_string = "";
   String urun_fiyati_string = "";
/*  String urun_aciklamasi_string = "";
  String urun_gorsel_first_string = "";
   String urun_gorsel_second_string = "";
    String urun_gorsel_third_string = "";*/

  @override
  void initState() {
   /* FirebaseFirestore.instance.collection("products").doc("${widget.product_name}")
        .get().then((value) {
      setState(() {
        urun_adi_string = value.data()?["urun_adi"];


      });
    } );
    FirebaseFirestore.instance.collection("products").doc("${widget.product_name}")
        .get().then((value) => urun_fiyati_string = value.data()?["urun_fiyati"]);

*/

    super.initState();






  }

/*
  Future<void> getinfos()  {
    // Get the reference to the image file in Firebase Storage








*/
/*
      FirebaseFirestore.instance.collection("products").doc("${widget.product_name}")
          .get().then((value) => urun_gorsel_second_string = value.data()?["gorsel_link_second"]);

      FirebaseFirestore.instance.collection("products").doc("${widget.product_name}")
          .get().then((value) => urun_gorsel_third_string = value.data()?["gorsel_link_third"]);


    FirebaseFirestore.instance.collection("products").doc("${widget.product_name}")
        .get().then((value) => urun_aciklamasi_string = value.data()?["urun_aciklamasi"]);

      FirebaseFirestore.instance.collection("products").doc("${widget.product_name}")
          .get().then((value) {

            setState(() {
              urun_gorsel_first_string = value.data()?["gorsel_link_first"];

              print(urun_gorsel_first_string + "tttt");
            });

      } );
*//*



      */
/*FirebaseFirestore.instance.collection("products").doc("${widget.product_name}")
        .get().then((value) => urun_aciklamasi_string = value.data()?["urun_aciklama"]);*//*






  }
*/






  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: Constants.white,
      appBar: PreferredSize(
        preferredSize:  Size(double.maxFinite, 210 ),
        child: (ResponsiveLayout.isTinyLimit(context) ||
            ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            :     app_bar(),
      ),


      body: ResponsiveLayout(
        computer:SingleChildScrollView(
          child: Row(


            children: [


          Spacer(),
              Container(
                width: 1100,





              child: Column(



                  children: [

// ürün resmi ve  bilgileri
                 Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                      child: Row(
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
                              return Container(child: Column(
                                children: [

                                  Row(
                                    children: [
                                      gorsel_row_first(urun_gorsel_first_string: snapshot.data!['gorsel_link_first'], urun_gorsel_second_string: snapshot.data!['gorsel_link_second'],
                                      urun_gorsel_third_string: snapshot.data!['gorsel_link_third'],),


                                   SizedBox(width: 20,),

                                   gorsel_row_second(urun_adi_string:   snapshot.data!['urun_adi'], urun_fiyati_string:   snapshot.data!['urun_fiyati'] , product_name: widget.product_name,)
                                    ],
                                  )



                             //     Text(snapshot.data!['urun_fiyati']),
                                ],
                              ));
                            }
                            return CircularProgressIndicator();
                          }),




                        ],
                      ),
                    ),


                    SizedBox(height: 20,),



                    // Urun açıklamasi ve iade koşulları
                    Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  width: 400,
                                  height: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.green),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 50,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                          color: selected_special_products ? Colors.green :Colors.yellow ,

                                        ),



                                        child: TextButton(

                                            onPressed: () {
                                              setState(() {
                                                selected_special_products = false;


                                              });
                                            }, child: Text("Ürün Açıklaması" ,  style: TextStyle(
                                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15, color: Constants.lightblack
                                        ), )),
                                      ),


                                      Container(
                                        width: 200,
                                        height: 50,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                                          color: selected_special_products ? Colors.yellow :Colors.green ,

                                        ),

                                        child: TextButton(onPressed: () {
                                          setState(() {

                                            selected_special_products = true;

                                          });
                                        }, child: Text("İade Koşulları",  style: TextStyle(
                                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20, color: Constants.lightblack
                                        ),)),
                                      ),



                                    ],

                                  ),


                                ),
                                Spacer(),
                              ],
                            ),



                            SizedBox(height: 20,),
                            AnimatedCrossFade(firstChild:  Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: const iade_kosullari(),
                            ), secondChild: Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                              child: const   urun_aciklama(),
                            ) ,
                              crossFadeState: selected_special_products ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                              duration: const Duration(seconds: 1),),

                          ]),


                    ),




                    SizedBox(height: 20,),
                    // Benzer Urunler




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


                    SizedBox(height: 20,),
                    //  footage

                    Container(
                        width: 1100 ,

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white,),

                        child: footage()),






                  ]),
      ),
             Spacer(),

            ],
          ),
        ),
        largeTablet: Container(),
        tablet: Container(),
        phone: Container(),
        tiny: Container(),

      ),
    );
  }
}

class gorsel_row_first extends StatefulWidget {



  String urun_gorsel_first_string = "";
   String urun_gorsel_second_string = "";
    String urun_gorsel_third_string = "";

   gorsel_row_first({super.key , required this.urun_gorsel_first_string, required this.urun_gorsel_second_string, required this.urun_gorsel_third_string});

  @override
  _gorsel_row_firstState createState() => _gorsel_row_firstState();
}

class _gorsel_row_firstState extends State<gorsel_row_first> {




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Container(
            width: 550,
            height: 650,

        child: Image.network(widget.urun_gorsel_first_string ,
         fit: BoxFit.fill,), ),




          SizedBox(height: 20,),

          Row(
            children: [

              Container(
                width: 100,
                height: 150,
            child: Image.network(widget.urun_gorsel_first_string ,
              fit: BoxFit.fill,), ),

              SizedBox(width: 10,),
              Container(
                width: 100,
                height: 150,
                child:  Image.network(widget.urun_gorsel_second_string ,
                  fit: BoxFit.fill,),

                ),

              SizedBox(width: 10,),

              Container(
                width: 100,
                height: 150,
                child:  Image.network(widget.urun_gorsel_third_string ,
                  fit: BoxFit.fill,),

              ),



            ],

          )


        ],

      ),


    );
  }
}


class gorsel_row_second extends StatefulWidget {
  String urun_adi_string = "";
  String urun_fiyati_string = "";
  String product_name = "";




   gorsel_row_second({super.key , required this.urun_adi_string, required this.urun_fiyati_string, required this.product_name});

  @override
  _gorsel_row_secondState createState() => _gorsel_row_secondState();
}

class _gorsel_row_secondState extends State<gorsel_row_second> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {


    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,


          children: [

            Text(
             "${widget.urun_adi_string}",
              style: TextStyle(
                  fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
              ),
            ),

            FittedBox(fit: BoxFit.scaleDown,
            child: Text(
              "${widget.urun_fiyati_string} " + " TL",
              style: TextStyle(
                  fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 25
              ),
            ),

            ),

            kargo_secenegi(),


            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Container(width: 450, height: 1, color: Constants.white,),
            ),


            kuponlar(),

            SizedBox(height: 75,),
            // Stok durumu
            Container(
              width: 150,
              child: Text("Stokta kalan adet: 1"),

            ),





            SizedBox(height: 150,),


            // Sepete ekle ve favorilere ekle.
            Row(

            children: [



            

              Container(
                width: 350,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {


                      _firestore.collection("Users").doc(FirebaseAuth.instance.currentUser!.email.toString()).collection('sepettim').doc(widget.product_name).set({
                        "id" : widget.product_name,
                        "durum" : "sepette",



                      });

                      


                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new sepete_eklendi(product_name: widget.product_name,)));
                    });


                  },
                  child: Padding(
                    padding: const EdgeInsets.all(Constants.kPadding / 2),
                    child: Text("Sepete Ekle" , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Constants.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                  ),
                ),
              ),

     SizedBox(width: 50,),



        HoverBuilder(builder: (isHovered) {
          if(!isHovered)
            return CircleAvatar(
                backgroundColor: Constants.white, radius: 20.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/like_icon_not_selected.png"),
                ));

          return CircleAvatar(
              backgroundColor: Constants.white, radius: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/like_icon_selected.png"),
              ));






        },),



            ],




            ),













      ]),
    );
  }
}

class kargo_secenegi extends StatelessWidget {
  const kargo_secenegi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Constants.white),


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Row(
                children: [
                  FittedBox(fit: BoxFit.scaleDown,
                  child: Text("Teslimat Seçenekleri"),
                  ),

                  Spacer(),
                  Image.asset("images/mng.png" , width: 150, height: 50,),


                ],

              ),
            ),


            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Row(
                children: [

                  FittedBox(fit: BoxFit.scaleDown,
                    child: Text("Tahmini kargoya verilme süresi:", style: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(width: 20,),
                  FittedBox(fit: BoxFit.scaleDown,
                    child: Text("Tarih", style: TextStyle(color: Colors.black)),
                  ),


                ],
              ),
            ),


      ]),

    );
  }
}


class kuponlar extends StatefulWidget {
  const kuponlar({Key? key}) : super(key: key);

  @override
  _kuponlarState createState() => _kuponlarState();
}

class _kuponlarState extends State<kuponlar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


        Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: FittedBox(fit: BoxFit.scaleDown, child: Text("Kuponlar", style: TextStyle(color: Colors.black ,    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20) ),),
        ),


      Container(
      width: 350,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Constants.green),


      child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: FittedBox(fit: BoxFit.scaleDown, child: Text("50 TL indirim", style: TextStyle(color: Colors.black) ),),
            ),


            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: FittedBox(fit: BoxFit.scaleDown, child: Text("Alt Limit : 50.000 TL", style: TextStyle(color: Colors.black) ),),
            ),





          ]),

    ),

      ]),
    );
  }
}

class urun_aciklama extends StatefulWidget {
  const urun_aciklama({Key? key}) : super(key: key);

  @override
  _urun_aciklamaState createState() => _urun_aciklamaState();
}

class _urun_aciklamaState extends State<urun_aciklama> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1100,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("MioFit Efficiency Kadın Spor Üst Vücudu saran MioFit Efficiency Spor Üst hareket özgürlüğü sağlarken, "
              "basınç uygulayan kesimi ise kasları destekler. Yoğun antrenmanlarda ısıyı vücudundan uzaklaştırarak serin"
              " kalmanı ve rahat etmeni sağlayan, file yapıdaki sırt, kol ve bel detayları şık bir görünüm sunar. %95 Polyamid %5 Elastan", style: TextStyle(fontSize: 20),),
        ],
      ),

    );
  }
}

class iade_kosullari extends StatefulWidget {
  const iade_kosullari({Key? key}) : super(key: key);

  @override
  _iade_kosullariState createState() => _iade_kosullariState();
}

class _iade_kosullariState extends State<iade_kosullari> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20,),

            Text("Wnt.com.tr’yi tercih ettiğiniz için teşekkür ederiz. Aşağıda iade ve değişim politikamızla ilgili bilgileri bulabilirsiniz. "
                "Herhangi bir soru, öneri veya görüşleriniz için İletisim Formunu kullanarak bizimle iletişime geçebilirsiniz. Tarafımıza ileteceğiniz görüşleriniz bizim için çok değerli olup platformumuzu "
                "siz değerli müşterilerimize daha iyi bir hizmet sunmamıza yardımcı olacaktır."),

            SizedBox(height: 20,),


            Text("İADE VE DEĞİŞİM POLİTİKASI", style: TextStyle(fontWeight: FontWeight.w800)),

            SizedBox(height: 20,),

            Text("Wnt.com.tr den aldığınız ürünleri, anlaşmalı olduğumuz veya teslim aldığınız kargo firması "
                "ile iade etmeniz gerekmektedir. Ürünlerin tarafınıza teslimi tarihinden itibaren en geç 15 gün içerisinde üye panelinizden ürün iade talimatı "
                "oluşturarak anlaşmalı kargolarımız ile Satıcıya iadesi için anlaşmalı kargoya vermeniz gerekmektedir. 15 günü aşan bildirimlerde maalesef iade kabul edilmemektedir."
                " İade süresi dolan, faturasız, etiketsiz, yıkanmış, kullanılmış tekrar satılabilir özelliğini kaybetmiş ya da hasar görmüş ürünlerin iade ve değişimi kabul edilmeyecek, "
                "tarafınıza karşı ödemeli olarak geri gönderilecektir. İadeniz Wnt.com.com.tr ilgili birimleri tarafından incelendikten ve onaylandıktan sonra ürün tutarı, 1-7 iş "
                "günü içerisinde ilgili bankanıza iade edilir. Bundan sonraki süreç tamamen bankanıza bağlıdır ve Wnt.com.tr'nin bankanıza müdahale etme hakkı yoktur. "
                "Taksitli olarak satın almış olduğunuz ürünlerinize ait ürün tutarı tarafımızdan tek seferde tamamı kredi kartınıza iade edilmektedir, bankanız tarafından, "
                "ürün bedeli iadesi çalıştığınız bankanın prosedürleri çerçevesinde, taksitli yada tek seferde olarak kredi kartınıza geri ödenecektir. Ulaşılamayan irtibat "
                "telefon numaralarından kaynaklı gecikmelerden Wnt.com.tr sorumluluk kabul etmemektedir. "
                "Ayrıntılı bilgi için 0850 305 98 17 Müşteri Hizmetlerini arayabilir veya iletişim bölümünden e-mail ile bilgi talep edebilirsiniz.",style: TextStyle(fontWeight: FontWeight.w500), ),

            SizedBox(height: 20,),


            Text("HANGİ ÜRÜNLER İADE EDİLEMEZ?", style: TextStyle(fontWeight: FontWeight.w800)),

            SizedBox(height: 20,),


            Text("Kozmetik ve kişisel bakım ürünleri, ambalajı açılmış ve denenmiş iç giyim ürünleri, ambalajı açılmış ve denenmiş mayo "
                "ve bikini, kitap, kopyalanabilir yazılım ve programlar, DVD, VCD, CD ve kasetler ile kırtasiye sarf malzemeleri "
                "(toner, kartuş, şerit vb.) ancak ambalajı açılmamış, denenmemiş, bozulmamış ve kullanılmamış olmaları halinde iade edilebilir. "
                "Sadece Tasarım ve Abiye ürünlerine özel iade işlemi; ürünün aynı gün içerisinde iade edilmesi durumunda geçerli olacaktır."
                " Belirtilen sürenin aşılması durumunda ise iade işlemleri gerçekleşmemektedir. Tek kullanımlık ürünler hızlı bozulan veya son "
                "kullanma tarihi geçme ihtimali olan ürünlerin iadesi kabul edilmemektedir. İade ve değişimlerde sorun yaşanmaması adına ayakkabılarınızı"
                "ev ortamında, tekstil ürünlerinin etiketlerini koparmadan ve yıkamadan denemenizi öneririz. Etiketleri koparılmış ve "
                "yıkanmış ürünler kabul edilmemektedir.Elektronik ürünlerin tesliminden sonra ambalaj, bant, mühür, paket gibi koruyucu unsurları açılmış olması halinde”"
                " cayma hakkı kapsamı dışında kalacaktır."),

            SizedBox(height: 20,),

            Text("ELİME GEÇEN ÜRÜN KUSURLU, NE YAPMAM GEREKİYOR?", style: TextStyle(fontWeight: FontWeight.w800)),


            SizedBox(height: 20,),

            Text("Wnt.com.tr üzerinden almış olduğunuz kusurlu/ayıplı ürünlerin iadesini kullanıcı panelinizden iade talimatı oluşturarak anlaşmalı "
                "kargo firmalarımızla ilgili tedarikçiye iadesini gerçekleştirebilirsiniz. Tedarikçilerimizden kaynaklı yanlış beden, yanlış renk, "
                "farklı ürün vb gönderiler nedeniyle yaşanan aksaklıktan dolayı öncelikle özür dileriz. Belirtmiş olduğunuz ürün tedarikçi firma "
                "stoklarında bulunduğu takdirde, derhal değişim yapılacak ve yeni ürün tarafınıza gönderilecektir, talep edilen ürünün tedarikçilerimizin"
                " stoklarında bulunmaması durumunda siparişiniz iptal edilip ücret iadesin iade prosedürümüz çerçevesinde ilgili bankanıza ücret iadeniz"
                " yapılacaktır. Çeşitli dönemler yapacağımız kampanyalı ürünlerde oluşabilecek iade durumlarında, ürünler stoklarla sınırlı ürünler olmasından "
                "dolayı ilgili kampanyalardan almış olduğunuz ürün/ürünlerin tedarikçi firma stoklarında olmaması durumunda siparişiniz iptal edilerek para iadesi "
                "işlemi gerçekleştirilecektir. Wnt.com.tr üzerinden yapmış olduğunuz alışverişlerde yaşayabileceğiniz bir olumsuzluk olması "
                "durumunda 0850 305 98 17 numaralı Müşteri Hizmetlerini arayabilir veya iletişim bölümünden e-posta ile temasa geçerek destek talebinde bulunabilirsiniz."),
      ]),

    );
  }
}




