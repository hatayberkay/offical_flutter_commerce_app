import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/product_examine.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class product_widget extends StatefulWidget {



  const product_widget({super.key,});

  @override
  _product_widgetState createState() => _product_widgetState();
}

class _product_widgetState extends State<product_widget> {
/*
  final imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/commerce-fe056.appspot.com/o/mail.png?alt=media&token=6f57a585-25ae-44c9-ad12-15efea5d9163';
*/


  @override
  Widget build(BuildContext context) {
    return Container(


      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: Colors.blue)),
      child: InkWell(
        onTap: () {
          setState(() {
            print("go to the store");
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new products_examine(product_name: "Ürun Adı",)));

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
                  Image.network("ds" , width: 250.0,
                    height: 200.0, fit: BoxFit.fill,),



                  InkWell(
                    onTap: () {
                      setState(() {

                        print("liked");
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
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.all(Constants.kPadding),
                    child: Text("" ,style: TextStyle(color: isHovered ? Colors.green : Colors.black   , fontSize: 20,
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
                child: Text("" ,style: TextStyle(color: Colors.black   , fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,)),
              ),

            ),
          ],
        ),
      ),


    );
  }
}
