import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:flutter/material.dart';


class auth_dialog_rejected extends StatefulWidget {
  final String text;
  final String button_text;


  const auth_dialog_rejected({super.key, required this.text, required this.button_text});

  @override
  _auth_dialog_rejectedState createState() => _auth_dialog_rejectedState();
}

class _auth_dialog_rejectedState extends State<auth_dialog_rejected> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 400,
        width: 100,
        child: Column(

            children: [
              SizedBox(height: height/20,),
              Positioned(
                  right: 0,
                  top: -60,

                  child: Image.asset("images/rejected.png")),
              SizedBox(height: height/20,),

              Padding(
                padding: const EdgeInsets.all(Constants.kPadding),
                child: Text("${widget.text}", style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black) , ),
              ),

              SizedBox(height: height/20,),

              Container(
                height: height/20,
                width: 250,
                color: Colors.greenAccent,
                child: OutlinedButton(

                  onPressed: () {


                    setState(() {

                      Navigator.pop(context);






                    });



                    //   print(MyApp.crossfade);




                  },
                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all(Colors.red[800]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) , )),
                  ),
                  child:  Text("${widget.button_text}" , style: TextStyle(color: Colors.white,),),
                ),


              )




            ]),


      ),


    );
  }
}
