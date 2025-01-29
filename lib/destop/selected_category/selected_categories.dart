import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:flutter/material.dart';




class selected_categories extends StatefulWidget {
  const selected_categories({Key? key}) : super(key: key);

  @override
  _selected_categoriesState createState() => _selected_categoriesState();
}

class _selected_categoriesState extends State<selected_categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          children: [
            Spacer(),


            first_category(),
            second_category(),
            third_category(),

            Spacer(),
      ]
      ),

    );
  }
}


class first_category extends StatefulWidget {
  const first_category({Key? key}) : super(key: key);

  @override
  _first_categoryState createState() => _first_categoryState();
}

class _first_categoryState extends State<first_category> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.kPadding),
      child: Container(
        width: 300,
        height: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) , color: Colors.transparent, border: Border.all(color: Colors.blueAccent)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),


                SizedBox(width: 20,),

                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),




              ],


            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),



                SizedBox(width: 20,),
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),


              ],


            ),


          ],
        ),



      ),
    );
  }
}


class second_category extends StatefulWidget {
  const second_category({Key? key}) : super(key: key);

  @override
  _second_categoryState createState() => _second_categoryState();
}

class _second_categoryState extends State<second_category> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(Constants.kPadding),
      child: Container(
        width: 300,
        height: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) , color: Colors.transparent, border: Border.all(color: Colors.blueAccent)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),

                SizedBox(width: 20,),

                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),


              ],


            ),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),

                SizedBox(width: 20,),
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),

              ],


            ),


          ],
        ),



      ),
    );
  }
}

class third_category extends StatefulWidget {
  const third_category({Key? key}) : super(key: key);

  @override
  _third_categoryState createState() => _third_categoryState();
}

class _third_categoryState extends State<third_category> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(Constants.kPadding),
      child: Container(
        width: 300,
        height: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) , color: Colors.transparent, border: Border.all(color: Colors.blueAccent)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),

                SizedBox(width: 20,),

                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),


              ],


            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),

                SizedBox(width: 20,),
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'images/firsat_third.jpg'),
                      fit: BoxFit.fill,
                    ),

                  ),
                ),

              ],


            ),


          ],
        ),



      ),
    );
  }
}

