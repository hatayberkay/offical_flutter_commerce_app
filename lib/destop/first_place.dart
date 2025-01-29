import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/product_widget.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/authentication_jobs/login.dart';
import 'package:e_commerce_official_app/destop/footage/footage.dart';
import 'package:e_commerce_official_app/destop/selected_category/selected_categories.dart';
import 'package:e_commerce_official_app/destop/selected_products/first_placee.dart';
import 'package:e_commerce_official_app/destop/selected_products/second_place.dart';
import 'package:e_commerce_official_app/product_widget_last.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class first_place extends StatefulWidget {
  const first_place({Key? key}) : super(key: key);

  @override
  _first_placeState createState() => _first_placeState();
}

class _first_placeState extends State<first_place> {

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  bool selected_special_products = false;


  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;



    return Container(
      color: Constants.white,
      width: width,
      child: Column(

          children: [






            // slider
            Container(
              width: 1300,
              height: 550,
              child: Padding(
                padding: const EdgeInsets.all(Constants.kPadding),
                child: CarouselSlider(
                  carouselController: buttonCarouselController,

                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,


                  ),
                  items:  imgList
                      .map((item) => Container(

                    child: Container(
                   //   margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Stack(
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      print(imgList.indexOf(item));

                                    });
                                  },

                                  child: Image.network(item, fit: BoxFit.cover, width: 1000.0)),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Text(
                                    'No. ${imgList.indexOf(item)} image',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ))
                      .toList(),
                ),
              ),
            ),


            // circler imageview
            Container(
              width: 1100,
              height: 100,

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white,),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      circleavatar_image(image_text: "cart.png",),
                      circleavatar_image(image_text: "cart.png",),
                      circleavatar_image(image_text: "cart.png",),
                      circleavatar_image(image_text: "cart.png",),
                      circleavatar_image(image_text: "cart.png",),
                      circleavatar_image(image_text: "cart.png",),
                      circleavatar_image(image_text: "cart.png",),
                      circleavatar_image(image_text: "cart.png",),






                ]),
              ),



            ),

                SizedBox(height: 20,),

                // text
            Container(
              width: width/2,
              child:    Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                   "Türkiye'nin Online Hesaplı Alışveriş Sitesi ve Pazaryeri",
                    style: TextStyle(
                      fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 30
                    ),
                  ),
                ),
              ),


            ),
            SizedBox(height: 20,),

            // kesfet
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
                      child: Text("Keşfet",
                        style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 30),),
                    ),
                  ),


                      Container(
                    //    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange,),


                        child: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: GridView.count(crossAxisCount: 4,

                            physics: NeverScrollableScrollPhysics(),
                     //     childAspectRatio: (1 / .10),
                            shrinkWrap: true,


                            children: [

                        HoverBuilder(builder: ((isHovered) {
                          return  isHovered ? Container(width: 50, height: 100, color: Colors.transparent, child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Keşfet", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800)),
                              ),
                              SizedBox(height: 20,),

                              Container(
                                width: 150,
                                height: 50,
                                child: OutlinedButton(

                                  onPressed: null,
                                  style: ButtonStyle(

                                    backgroundColor: MaterialStateProperty.all(Colors.purple[400]),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) , )),
                                  ),
                                  child: const Text("Bak" , style: TextStyle(color: Constants.white,
                                      fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                                  ),),



                                ),
                              )



                            ],
                          ),) : Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/bilgisayar_kesif.jpg'),
                                  fit: BoxFit.fill,
                                ),

                              ),
                            ),
                          );





                        })),

                            HoverBuilder(builder: ((isHovered) {


                                return  isHovered ? Container(width: 50, height: 100, color: Colors.transparent, child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text("Keşfet", style: TextStyle(color: Colors.black, fontSize: 20 , fontWeight: FontWeight.w800,)),
                                    ),
                                    SizedBox(height: 20,),

                                    Container(
                                      width: 150,
                                      height: 50,
                                      child: OutlinedButton(

                                        onPressed: null,
                                        style: ButtonStyle(

                                          backgroundColor: MaterialStateProperty.all(Colors.purple[400]),
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) , )),
                                        ),
                                        child: const Text("Bak" , style: TextStyle(color: Constants.white,
                                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                                        ),),



                                      ),
                                    )



                                  ],
                                ),) :
                                Padding(
                                  padding: const EdgeInsets.all(Constants.kPadding),
                                  child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'images/kadin_kesif.jpg'),
                                        fit: BoxFit.fill,
                                      ),

                                    ),
                                  ),
                                );





                            })),


                              HoverBuilder(builder: ((isHovered) {


                                return  isHovered ? Container(width: 50, height: 100, color: Colors.transparent, child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text("Keşfet", style: TextStyle(color: Colors.black, fontSize: 20,  fontWeight: FontWeight.w800,)),
                                    ),
                                    SizedBox(height: 20,),

                                    Container(
                                      width: 150,
                                      height: 50,
                                      child: OutlinedButton(

                                        onPressed: null,
                                        style: ButtonStyle(

                                          backgroundColor: MaterialStateProperty.all(Colors.purple[400]),
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) , )),
                                        ),
                                        child: const Text("Bak" , style: TextStyle(color: Constants.white,
                                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                                        ),),



                                      ),
                                    )



                                  ],
                                ),) :
                                Padding(
                                  padding: const EdgeInsets.all(Constants.kPadding),
                                  child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'images/parfum_kesif.jpg'),
                                        fit: BoxFit.fill,
                                      ),

                                    ),
                                  ),
                                );





                            })),


                              HoverBuilder(builder: ((isHovered) {


                                return  isHovered ? Container(width: 50, height: 100, color: Colors.transparent, child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text("Keşfet", style: TextStyle(color: Colors.black, fontSize: 20,  fontWeight: FontWeight.w800,)),
                                    ),
                                    SizedBox(height: 20,),

                                    Container(
                                      width: 150,
                                      height: 50,
                                      child: OutlinedButton(

                                        onPressed: null,
                                        style: ButtonStyle(

                                          backgroundColor: MaterialStateProperty.all(Colors.purple[400]),
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) , )),
                                        ),
                                        child: const Text("Bak" , style: TextStyle(color: Constants.white,
                                            fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                                        ),),



                                      ),
                                    )



                                  ],
                                ),) :
                                Padding(
                                  padding: const EdgeInsets.all(Constants.kPadding),
                                  child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'images/telefon_kesif.jpg'),
                                        fit: BoxFit.fill,
                                      ),

                                    ),
                                  ),
                                );





                              })),



                            ],
                          ),
                        ),
                      ),
                ]),
              ),


            ),


            SizedBox(height: 20,),

            // super firsatlar

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
                      child: Text("Süper Firsatlar", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 30),),
                    ),
                  ),


                      Container(
                    //    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange,),


                        child: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding ),
                          child: GridView.count(crossAxisCount: 2,


                            physics: NeverScrollableScrollPhysics(),
                   //  childAspectRatio: (1 / .4),

                        shrinkWrap: true,


                            children: [


                              Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(
                                    'images/firsat_first.jpg'),
                                fit: BoxFit.fill,
                              ),

                            ),
                          ),
                        ),
      Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(
                                    'images/firsat_second.jpg'),
                                fit: BoxFit.fill,
                              ),

                            ),
                          ),
                        ),
      Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(
                                    'images/firsat_third.jpg'),
                                fit: BoxFit.fill,
                              ),

                            ),
                          ),
                        ),
      Padding(
                              padding: const EdgeInsets.all(Constants.kPadding),
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(
                                    'images/firsat_third.jpg'),
                                fit: BoxFit.fill,
                              ),

                            ),
                          ),
                        ),

                         //     Image.asset("images/firsat_first.jpg" , ),






                            ],
                          ),
                        ),
                      ),
                ]),
              ),


            ),

            SizedBox(height: 20,),

            // secili urunler

            Container(
              width: 1100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Padding(
                      padding: const EdgeInsets.all(Constants.kPadding),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Seçili Ürünler", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400,fontSize: 30),),
                      ),
                    ),

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
                                }, child: Text("Kadin Giyim" ,  style: TextStyle(
                                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20, color: Constants.lightblack
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
                                }, child: Text("Erkek Giyim",  style: TextStyle(
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

                    AnimatedCrossFade(firstChild:  const first_placee(), secondChild: const second_place(),
                      crossFadeState: selected_special_products ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                      duration: const Duration(seconds: 1),)


              ]),


            ),

            SizedBox(height: 20,),

            // seçili kategoriler

            Container(
              width: 1100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Padding(
                    padding: const EdgeInsets.all(Constants.kPadding),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("Öne Çıkan Kategoriler", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400,fontSize: 30),),
                    ),
                  ),

                  selected_categories(),
                ],
              ),

            ),

            SizedBox(height: 20,),
            // firsat urunler

            Container(
              width: 1100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("Fırsat Ürünleri", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400,fontSize: 30),),
                  ),
                ),




                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>( // inside the <> you enter the type of your stream
                      stream: FirebaseFirestore.instance.collection("products").snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {

                      /*    print(snapshot.data!.docs.length.toString() + "asd");
                          print( snapshot.data!.docs[0].get("durum") + "asd");*/


                           return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) =>

                                product_widgetdd(id:  snapshot.data!.docs[index].id ,image_url: snapshot.data!.docs[index].get("gorsel_link_first"), urun_adi: snapshot.data!.docs[index].get("urun_adi"),
                              urun_fiyat: snapshot.data!.docs[index].get("urun_fiyati"),
                              ),
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

       /*             Container(
                      //    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange,),


                      child: Padding(
                        padding: const EdgeInsets.all(Constants.kPadding ),
                        child: GridView.count(


                          crossAxisCount: 4,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.75,

                          physics: NeverScrollableScrollPhysics(),
                          //  childAspectRatio: (1 / .4),

                          shrinkWrap: true,


                          children: [


                            product_widget(),
                            product_widget(),
                            product_widget(),
                            product_widget(),
                            product_widget(),
                            product_widget(),
                            //     Image.asset("images/firsat_first.jpg" , ),






                          ],
                        ),
                      ),
                    ),*/








              ]),



            ),

            SizedBox(height: 20,),

            // footage
            Container(
              width: 1100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Column(
              children: [
                footage(),


                Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("Mobil Uygulamalarımız", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600,fontSize: 30),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/apple.png", width: 200,),
                      SizedBox(width: 20,),
                      Image.asset("images/google.png" , width: 200,),

                    ],
                  ),
                )


              ],
            ),
            ),

            SizedBox(height: 20,),

            //last text
            Container(
              child: Column(
                children: [
                FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("© 2023 wnt.com.tr Tüm Hakları Saklıdır.", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400,fontSize: 30),),
              ),

                ],

              ),
            ),


      ]),

    );
  }
}

class circleavatar_image extends StatefulWidget {
  final String image_text;


  const circleavatar_image({super.key , required this.image_text});

  @override
  _circleavatar_imageState createState() => _circleavatar_imageState();
}

class _circleavatar_imageState extends State<circleavatar_image> {
  @override
  Widget build(BuildContext context) {
    return    Container(
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: CircleAvatar(
            child: Image.asset("images/" + widget.image_text,),
            backgroundColor: Constants.green, radius: 20.0 ),
      ),
    );
  }
}
