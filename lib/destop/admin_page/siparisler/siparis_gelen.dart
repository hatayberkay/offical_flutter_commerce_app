import 'package:e_commerce_official_app/auth_common/auth_dialog_confirm.dart';
import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class siparis_gelen extends StatefulWidget {
  final String purpose;

  const siparis_gelen({super.key, required this.purpose});

  @override
  _siparis_gelenState createState() => _siparis_gelenState();
}

class _siparis_gelenState extends State<siparis_gelen> {
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

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [





         if(widget.purpose.toString()! == "siparis_gelen")
             siparis_first(),


          //  if(widget.purpose.toString()! == "siparis gerceklesen")
            //  indirim_kuponu_olustur(),

          ]


      ),



    );
  }
}

class siparis_first extends StatefulWidget {
  const siparis_first({Key? key}) : super(key: key);

  @override
  _siparis_firstState createState() => _siparis_firstState();
}
String query_string = "Saticiya iletildi.";
class _siparis_firstState extends State<siparis_first> {
  @override
  Widget build(BuildContext context) {



    double width = MediaQuery.of(context).size.width;

    return Container(
      child: SingleChildScrollView(
        child: Row(
            children: [



              Column(


                children: [

                  TextButton(onPressed: () {
                    setState(() {

                      query_string = "Teslim edildi.";

                    });

                  }, child: Text("Teslim edilenler")),

                  TextButton(onPressed: () {
                    setState(() {

                      query_string = "";

                    });

                  }, child: Text("Normal")),




                  Container(
                    width: width,
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>( // inside the <> you enter the type of your stream
                      stream: FirebaseFirestore.instance.collection("siparislerim").snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {

                          List<dynamic> map = snapshot.data!.docs.where((element) => element["durum"].toString().contains(query_string)).toList();

                          print(snapshot.data!.docs.length);
                          //  List<String> map = snapshot.data!.docs.cast<String>();

                          //    final DataTableSource _allKasas = MyUserData(snapshot.data!.docs);



                         return  Container(
                            width: 1100,


                            color: Colors.green,
                            child: PaginatedDataTable(


//      sortColumnIndex: 0,
//    sortAscending: sort,



                              columns:  [


                                DataColumn(label: Text('siparis_id'),),

                                DataColumn(label: Text('fatura_fiyati',)),
                                DataColumn(label: Text('urun_adi')),
                                  DataColumn(label: Text('Durum')),
                               DataColumn(label: Text('İslemler')),





                              ],
                              source: MySiparisData(map), //MyKasaData(map),

                              columnSpacing: 15,

                            ),
                          );




                        }
                        if (snapshot.hasError) {
                          return const Text('Error');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),



                  Row(

                    children: [







                    ],

                  ),






                  // stream: message(searched),










                ],

              ),




            ]),
      ),

    );
  }
}

class MySiparisData extends DataTableSource {





  // List<Kasalar> kasalar = [];

  //MyKasaData(this._data);
  MySiparisData(this._data);

  final List<dynamic> _data;






  FirebaseFirestore _firestore = FirebaseFirestore.instance;




  String durum_string = "";



  DataRow getRow(int index) {


    return DataRow(cells: [


      //  if(_data[index].data()['kasa_adi'].toString().contains("hatay"))


      DataCell(Text(_data[index].data()["siparis_id"])),
      DataCell(Text(_data[index].data()["fatura_fiyati"])),
      DataCell(Text(_data[index].data()["urun_adi"])),
      DataCell(TextFormField(initialValue: _data[index].data()["durum"], onChanged: ((value) {durum_string = value;}),)),


     // DataCell(_data[index].data()["fatura_fiyati"]),




      DataCell(

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 50,
                child: Row(
                  children: [

                    Container(
                      width: 150,
                      height: 100,
                      child: StatefulBuilder(
                        builder: (ctx ,setState) =>
                            OutlinedButton(
                                key: GlobalKey(),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) , )),
                                  backgroundColor: MaterialStateProperty.all(Colors.yellow),


                                ),


                                onPressed: () {




                                  //   _data[index].reference.id

                                  _firestore.collection("siparislerim").doc(_data[index].reference.id)
                                      .update({
                                    "durum": durum_string.isNotEmpty ? durum_string : _data[index].data()["durum"].toString() ,


                                  })
                                      .then((value) =>   showDialog(context: ctx, builder: (BuildContext context) {

                                    return auth_result_dialog(text: "Sipariş durumu güncellendi", button_text: "Tamam");
                                  })
                                      .catchError((error) => print("Failed to update user: $error")));


// hatayberkay1234@gmail.com
                                }, child: Text("Güncelle", style: TextStyle(fontSize: 20 ,  fontFamily: 'Poppins', color: Colors.black),) ),






                      ),
                    ),





                  ],



                )),
          )),


    ]);


  }

  Color _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    //return Colors.green; // Use the default value.
    return Constants.heavyblack;
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}