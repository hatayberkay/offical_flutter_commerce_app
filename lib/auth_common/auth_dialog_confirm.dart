import 'package:flutter/material.dart';



class auth_result_dialog extends StatefulWidget {

  final String text;
  final String button_text;
  const auth_result_dialog({super.key, required this.text, required this.button_text});

  @override
  _auth_result_dialogState createState() => _auth_result_dialogState();
}

class _auth_result_dialogState extends State<auth_result_dialog> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 350,
        width: 100,
        child: Column(

            children: [
              SizedBox(height: height/20,),
              Positioned(
                  right: 0,
                  top: -60,

                  child: Image.asset("images/confirm.png")),
              SizedBox(height: height/20,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text("${widget.text}", style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black) , ),

                ],
              ),

              SizedBox(height: height/20,),

              Container(
                height: height/20,
                width: 250,
                color: Colors.greenAccent,
                child: OutlinedButton(

                  onPressed: () {


                    setState(() {
                      //    MyApp.crossfade = false;
                      Navigator.pop(context);






                    });



                    //   print(MyApp.crossfade);




                  },
                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all(Colors.green[800]),
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
