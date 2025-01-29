import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/form_container_widget.dart';
import 'package:e_commerce_official_app/destop/authentication_jobs/login.dart';
import 'package:e_commerce_official_app/destop/first_place.dart';
import 'package:e_commerce_official_app/destop/login_destop/user_options.dart';
import 'package:e_commerce_official_app/destop/product_examine.dart';
import 'package:e_commerce_official_app/destop/satis_sepet_ve_favoriler/favoriler.dart';
import 'package:e_commerce_official_app/destop/satis_sepet_ve_favoriler/sepet.dart';
import 'package:e_commerce_official_app/firebase_operations/firebase_database.dart';
import 'package:e_commerce_official_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../common/app_bar_controller.dart';
import 'package:e_commerce_official_app/common/dialog.dart' as di;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class app_bar extends StatefulWidget {
  const app_bar({Key? key}) : super(key: key);

  @override
  _app_barState createState() => _app_barState();
}

class _app_barState extends State<app_bar> {
  List<String> _buttonNames = ["Kampanyalar", "Sipariş Takibi", "Yardım Destek",];
  int _currentSelectedButton = 0;

  final List _isHovering = [
    false,
    false,
    false,

  ];




  app_bar_controller sideBarController = Get.put(app_bar_controller());
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String UserName_string = "";
  List<String> urun_liste= [];
  List<String> urun_id_liste= [];

  @override
  void initState() {

    firestore.collection("Users").doc(FirebaseAuth.instance.currentUser?.email)
        .get().then((value) { setState(() {
      UserName_string = value.data()?["ad"];
        });});

    setState(() {

      urunleri_indir();

    });


    super.initState();




  }

  void urunleri_indir() async {
    await for(var snapshots in   FirebaseFirestore.instance
        .collection('products')
        .snapshots()){
      for(var message in snapshots.docs) {
        //  print(message.data()["id"]+ "ddd");
        urun_liste.add(message.data()["urun_adi"]);
        urun_id_liste.add(message.id);






      }

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

  }




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Container(
      color: Colors.white,
      child: Column(
        children: [





          // step 1
          Container(

  child:   Row(

    mainAxisAlignment: MainAxisAlignment.end,

    children: [
      Spacer(),

      ...List.generate(
        _buttonNames.length,
            (index) => TextButton(

          onPressed: () {
            setState(() {
              _currentSelectedButton = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: Constants.kPadding ,right: Constants.kPadding, left: Constants.kPadding ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _buttonNames[index],
                  style: TextStyle(
                    color: _currentSelectedButton == index
                        ? Constants.lightblack
                        : Constants.green,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      Spacer(),






    ],

  ),
      ),
// step 2




        Container(


          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: InkWell(
                    onTap: () => setState(() {
                   //     Navigator.pop(context, MaterialPageRoute(builder: (context) =>  MyHomePage(title: "Flutter Demo Home Page")));

                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => MyHomePage(title: "Flutter Demo Home Page")));


                    }),

                    child: Image.asset(
                        width: width/10,
                        height: height/10,
                        "images/logo.png", fit: BoxFit.fill),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(Constants.kPadding*2),
                  child: Container(
                    width: width/4,
                    child: Autocomplete<String>(



                   /*   optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                         return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 2,
                            child: Container(
                              width: width/4,
                              constraints: BoxConstraints(maxHeight: 250),
                              child: ListView.builder(
                                padding: EdgeInsets.all(10.0),
                                itemCount: options.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                               //   final AutoCompleteItem option = options.elementAt(index);

                            *//*      return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: ListTile(
                                      dense: true,
                                      title: Text(option.value),
                                    ),
                                  );*//*
                                },
                              ),
                            ),
                          ),
                        );
                      },*/

                   /*   ListView(
                        children: options
                            .map((String option) => GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                            title: Text(option),
                          ),
                        ))
                            .toList(),
                      ),
                      */

                    optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(

                            elevation: 4.0,
                            child: Container(
                              width: width/4,
                              constraints: BoxConstraints(maxHeight: 150),
                              child:  ListView(
                                children: options
                                    .map((String option) => GestureDetector(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: ListTile(
                                    title: Text(option),
                                  ),
                                ))
                                    .toList(),
                              ),
                            ),
                          ),
                        );
                      },


                      optionsBuilder: (textEditingValue) {
                        if(textEditingValue == "") {
                          return const Iterable<String>.empty();

                        }
                        return      urun_liste.where((String item)  {
                          return item.contains(textEditingValue.text.toLowerCase());




                        },


                        );


                      },
                      onSelected: (String item) {


                        int index = urun_liste.indexOf(item);

                        print("$item" + "eeee" + index.toString());

                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new products_examine(product_name: urun_id_liste[index])));

                      },

                    ),

                  ),
                ),



                    if (FirebaseAuth.instance.currentUser != null)




                         app_bar_buttons(image:"person.png", text: UserName_string, onPressed: () {
                             setState(() {

                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new user_options()));
                       });

                         }, ),




                if (FirebaseAuth.instance.currentUser == null)
                  app_bar_buttons(image:"person.png", text: "Giriş Yap", onPressed: () {
                  setState(() {

                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new login_page()));
                  });

                }, ),
                app_bar_buttons(image:"favorite.png", text: "Favorilerim", onPressed: () {
                  setState(() {

                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new favoriler()));


                  });

                }, ),
                app_bar_buttons(image:"cart.png", text: "Sepetim",  onPressed: () {
                  setState(() {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new sepet()));
                  });

                },),







                Spacer(),

          ]),

        ),




// step 3

        Container(
          color: Constants.white,
          width: width,
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                HoverBuilder(
                  builder: (isHovered) {


                    return InkWell(
                      onTap: () {
                        setState(() {
                          showDialog(context: context, builder: (BuildContext context) {
                            return di.hover_dialog();


                          });

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Text(
                              "Giyim",
                              style: TextStyle(

                                color: isHovered ? Colors.green : Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
                SizedBox(width: width/30,),
                HoverBuilder(
                  builder: (isHovered) {


                    return InkWell(
                      onTap: () {
                        setState(() {

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Text(
                              "Anne Bebek",
                              style: TextStyle(

                                color: isHovered ? Colors.green : Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
                SizedBox(width: width/30,),
                HoverBuilder(
                  builder: (isHovered) {


                    return InkWell(
                      onTap: () {
                        setState(() {

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "Takı,\nAksesuvar",
                              style: TextStyle(

                                color: isHovered ? Colors.green : Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
                SizedBox(width: width/30,),
                HoverBuilder(
                  builder: (isHovered) {


                    return InkWell(
                      onTap: () {
                        setState(() {

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "Kozmetik,\nKişisel Bakım",
                              style: TextStyle(

                                color: isHovered ? Colors.green : Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
                SizedBox(width: width/30,),

                HoverBuilder(
                  builder: (isHovered) {


                    return InkWell(
                      onTap: () {
                        setState(() {

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Text(
                              "Ayakkabı ve Çanta",
                              style: TextStyle(

                                color: isHovered ? Colors.green : Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),


          ]),
        ),


  /*        Container(
            width: width,
            height: height/20,
            color: Constants.white,
            child:
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  _buttonNames.length,
                      (index) => TextButton(
                    onPressed: () {
                      setState(() {
                        _currentSelectedButton = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(Constants.kPadding * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _buttonNames[index],
                            style: TextStyle(
                              color: _currentSelectedButton == index
                                  ? Colors.black
                                  : Colors.green,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(Constants.kPadding / 2),
                            width: 60,
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: _currentSelectedButton == index
                                  ? LinearGradient(
                                colors: [
                                  Colors.black,
                                  Constants.heavyblack,
                                ],
                              )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )

           *//*     Row(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children: [

             HoverBuilder(
                    builder: (isHovered) {


                      return InkWell(
                        onTap: () {
                          setState(() {

                          });

                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(

                              "Giyim",
                              style: TextStyle(

                                color: isHovered ? Colors.green : Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),








                          ],
                        ),
                      );
                    },
                  ),

                    SizedBox(width: width/30,),

                    HoverBuilder(

                    builder: (isHovered) {





                      return InkWell(
                        onTap: () {
                          setState(() {


                            showDialog(context: context, builder: (BuildContext context) {
                              return di.hover_dialog();


                            });




                          });

                        },
                        child: Column(
                          children: [

                            Text(
                              "Anne Bebek",
                              style: TextStyle(

                                color:
                                isHovered ? Colors.green : Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),






                          ],
                        ),
                      );
                    },
                  ),

                    SizedBox(width: width/30,),
                  HoverBuilder(
                    builder: (isHovered) {
                      return Column(
                        children: [

                          Text(
                            "Takı Aksesuvar",
                            style: TextStyle(

                              color:
                              isHovered ? Colors.green : Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          ),






                        ],
                      );
                    },
                  ),
                    SizedBox(width: width/30,),
                  HoverBuilder(
                    builder: (isHovered) {
                      return Column(
                        children: [

                          Text(
                            "Kozmetik & Kişisel Bakım",
                            style: TextStyle(

                              color:
                              isHovered ? Colors.green : Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          ),






                        ],
                      );
                    },
                  ),
                    SizedBox(width: width/30,),
                  HoverBuilder(
                    builder: (isHovered) {
                      return Column(
                        children: [

                          Text(
                            "Ayakkabı & Çanta",
                            style: TextStyle(

                              color:
                              isHovered ? Colors.green : Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          ),






                        ],
                      );
                    },
                  ),



    ],),*//*
              ],
            ),


          ),*/








        ],


      ),

    );
  }


}

class app_bar_buttons extends StatefulWidget {
final String image;
final String text;
final VoidCallback onPressed;


const app_bar_buttons({super.key, required this.image, required this.text , required this.onPressed });


  @override
  _app_bar_buttonsState createState() => _app_bar_buttonsState();
}

class _app_bar_buttonsState extends State<app_bar_buttons> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;



      return Container(
        child: Row(
          children: [

            Image.asset(
              width: width/50,
              height: height/40,

              "images/" + widget.image , fit: BoxFit.fill,),
            TextButton(


                onPressed: () {
              setState(() {

                widget.onPressed();

              });
            }, child: Text("${widget.text}")),


          ],


        ),

      );
    }

  }





class HoverBuilder extends StatefulWidget {
  const HoverBuilder({
    required this.builder,
    Key? key,
  }) : super(key: key);

  final Widget Function(bool isHovered) builder;

  @override
  _HoverBuilderState createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: widget.builder(_isHovered),
    );
  }

  void _onHoverChanged({required bool enabled}) {
    setState(() {
      _isHovered = enabled;



    });
  }
}

class HoverBuilder_second extends StatefulWidget {
  const HoverBuilder_second({
    required this.builder,
    Key? key,
  }) : super(key: key);

  final Widget Function(bool isHovered) builder;

  @override
  _HoverBuilder_secondState createState() => _HoverBuilder_secondState();
}

class _HoverBuilder_secondState extends State<HoverBuilder_second> {
  bool _isHovered_second = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: widget.builder(_isHovered_second),
    );
  }

  void _onHoverChanged({required bool enabled}) {
    setState(() {
      _isHovered_second = enabled;
    });
  }
}
/*

class hover_dialog extends StatefulWidget {
  const hover_dialog({Key? key}) : super(key: key);

  @override
  _hover_dialogState createState() => _hover_dialogState();
}

class _hover_dialogState extends State<hover_dialog> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Container(
      width: width/2,
      height: height/3,
      color: Colors.transparent,
      child: Container(

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,







            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [

                    Text("Kadın Giyim ve Aksesuvar" , style: TextStyle(  fontFamily: 'Poppins', fontWeight: FontWeight.w800,)),

                    app_bar_dialog_button(text: "Kadın T-shirt",),
                    app_bar_dialog_button(text: "Etek",),
                    app_bar_dialog_button(text: "Pantolon ve Tayt",),
                    app_bar_dialog_button(text: "Büyük Beden",),
                    app_bar_dialog_button(text: "Dış Giyim",),
                    app_bar_dialog_button(text: "Elbise",),





                  ],


                ),
              ),

            SizedBox(width: 20,),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [

                    Text("Erkek Giyim ve Aksesuvar", style: TextStyle(  fontFamily: 'Poppins', fontWeight: FontWeight.w800,)),

                    app_bar_dialog_button(text: "Erkek T-shirt",),
                    app_bar_dialog_button(text: "Gömlek",),
                    app_bar_dialog_button(text: "Pantolon ve Short",),
                    app_bar_dialog_button(text: "Büyük Beden",),
                    app_bar_dialog_button(text: "Dış Giyim",),
                    app_bar_dialog_button(text: "Triko",),






                  ],


                ),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,



                  children: [

                    Text("Ayakkabı ve Çanta" , style: TextStyle(  fontFamily: 'Poppins', fontWeight: FontWeight.w800,)),

                    app_bar_dialog_button(text: "Çocuk Ayakkabı",),
                    app_bar_dialog_button(text: "Çocuk Çanta",),
                    app_bar_dialog_button(text: "Erkek Ayakkabı",),
                    app_bar_dialog_button(text: "Kadın Ayakkabı",),
                    app_bar_dialog_button(text: "Kadın Çanta",),







                  ],


                ),
              ),

              Spacer(),

              Padding(
                padding: const EdgeInsets.all(Constants.kPadding),
                child: Image.asset("images/giyim.jpg" , height: height/3,),
              ),



        ]),

      ),


    );
  }
}

class app_bar_dialog_button extends StatefulWidget {
  final String text;

  const app_bar_dialog_button({super.key, required this.text});

  @override
  _app_bar_dialog_buttonState createState() => _app_bar_dialog_buttonState();
}

class _app_bar_dialog_buttonState extends State<app_bar_dialog_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:   Padding(
        padding: const EdgeInsets.all(2),
        child: Text("${widget.text}", style: TextStyle(fontSize: 15,   fontFamily: 'Poppins', fontWeight: FontWeight.w500, )),
      ),

    );
  }
}



*/

