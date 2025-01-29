import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:flutter/material.dart';




class first_placee extends StatefulWidget {
  const first_placee({Key? key}) : super(key: key);

  @override
  _first_placeeState createState() => _first_placeeState();
}

class _first_placeeState extends State<first_placee> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.kPadding),
      child: Container(


        child: Column(

            children: [

             Padding(
                padding: const EdgeInsets.all(Constants.kPadding),
                child: GridView.count(crossAxisCount: 4,

                  physics: NeverScrollableScrollPhysics(),
                  //     childAspectRatio: (1 / .10),
                  shrinkWrap: true,


                  children: [

                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("images/bilgisayar_kesif.jpg" ,)),
                    Image.asset("images/kadin_kesif.jpg"),
                    Image.asset("images/parfum_kesif.jpg"),
                    Image.asset("images/telefon_kesif.jpg"),

                  ],
                ),
              ),

        ]),
      ),
    );
  }
}
