import 'package:e_commerce_official_app/auth_common/auth_dialog_confirm.dart';
import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/form_container_widget.dart';
import 'package:e_commerce_official_app/common/options_controller.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/firebase_operations/firebase_database.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class kullanicilar extends StatefulWidget {
  final String purpose;


  const kullanicilar({super.key, required this.purpose});

  @override
  _kullanicilarState createState() => _kullanicilarState();
}

class _kullanicilarState extends State<kullanicilar> {
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





            if(widget.purpose.toString()! == "indirim kuponu tanımla")
              indirim_kuponu_tanimla(),


            if(widget.purpose.toString()! == "indirim kuponu olustur")
              indirim_kuponu_olustur(),

      ]),



    );
  }
}

class indirim_kuponu_tanimla extends StatefulWidget {
  const indirim_kuponu_tanimla({Key? key}) : super(key: key);

  @override
  _indirim_kuponu_tanimlaState createState() => _indirim_kuponu_tanimlaState();
}

class _indirim_kuponu_tanimlaState extends State<indirim_kuponu_tanimla> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Options_controller _options_controller = Get.put(Options_controller());

  String kupon_id = "";

  String kupon_adi = "";
  String kupon_aciklama = "";
  String kupon_harcama_limiti = "";
  String kupon_miktari = "";
  String kupon_son_kullanma_tarihi = "";


 void kupon_bilgilerine_eris(String kupon_id) async {

   FirebaseFirestore.instance.collection("kuponlar").doc(kupon_id)
       .get().then((value) => kupon_id = value.data()?["id"]);


   FirebaseFirestore.instance.collection("kuponlar").doc(kupon_id)
       .get().then((value) => kupon_adi = value.data()?["kupon_adi"]);

   FirebaseFirestore.instance.collection("kuponlar").doc(kupon_id)
       .get().then((value) => kupon_aciklama = value.data()?["kupon_aciklama"]);

   FirebaseFirestore.instance.collection("kuponlar").doc(kupon_id)
       .get().then((value) => kupon_harcama_limiti = value.data()?["kupon_harcama_limiti"]);

   FirebaseFirestore.instance.collection("kuponlar").doc(kupon_id)
       .get().then((value) => kupon_miktari = value.data()?["kupon_miktar"]);

   FirebaseFirestore.instance.collection("kuponlar").doc(kupon_id)
       .get().then((value) => kupon_son_kullanma_tarihi = value.data()?["kupon_son_kullanma_tarihi"]);



 }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: SingleChildScrollView(
        child: Row(
            children: [

              Spacer(),

              Column(


                children: [



  /*    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>( // inside the <> you enter the type of your stream
            stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              print(snapshot.data!.docs.length.toString() + "asd");
              print( snapshot.data!.docs[0].get("adres") + "asd");


              return Container(

                width: 110,
                height: 500,
                color: Colors.green,
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                       "asd" + snapshot.data!.docs[index].get("adres").toString(),
                      ),
                    );
                  },
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

            */

              Container(
                width: 1100,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>( // inside the <> you enter the type of your stream
            stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {


            //  List<String> map = snapshot.data!.docs.cast<String>();

            //    final DataTableSource _allKasas = MyUserData(snapshot.data!.docs);



                return  Container(

                  color: Colors.green,
                  child: PaginatedDataTable(


//      sortColumnIndex: 0,
//    sortAscending: sort,



                    columns:  [


                      DataColumn(label: Text('Ad'),

                      ),

                      DataColumn(label: Text('Soyad',)),
                      DataColumn(label: Text('E-Mail Adresi')),
                      DataColumn(label: Text('Kaç tane Mal almış')),
                      DataColumn(label: Text('Telefon Numarasi')),
                      DataColumn(label: Text('Adres')),

                      DataColumn(label: Text('İşlemler')),


                    ],
                    source: MyUserData(snapshot.data!.docs), //MyKasaData(map),

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


                              Text("${_options_controller.user_e_mail_adress.value}" ),


                              TextButton(
                              child: const Text('Göster'),
                              onPressed: () {setState(() {


                              });}, ),

                              kasa_doviz_spinner(onChanged: ((value) {
                                setState(() async {

                                  kupon_id = value;

                                  kupon_bilgilerine_eris(kupon_id);

                                });

                              })),

                              TextButton(
                                child: const Text('Kupon EKLE'),
                                onPressed: () {setState(() {


                                  FirebaseFirestore.instance.collection('Users').doc(_options_controller.user_e_mail_adress.value).collection('kuponlarim').doc().set({

                                    'id' : kupon_id,
                                    'kupon_adi':  kupon_adi,
                                    'kupon_aciklama' :  kupon_aciklama,

                                    'kupon_harcama_limiti' : kupon_harcama_limiti ,
                                    'kupon_miktari' : kupon_miktari ,
                                    'kupon_son_kullanma_tarihi' : kupon_son_kullanma_tarihi ,



                                  }

                                  );


                                });




                              }, ),



                            ],

                          ),






                          // stream: message(searched),










                ],

              ),


              Spacer(),

        ]),
      ),

    );
  }
}


class kasa_doviz_spinner extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? defaultValue;

  const kasa_doviz_spinner({Key? key , this.onChanged, this.defaultValue}) : super(key: key);

  @override
  _kasa_doviz_spinnerState createState() => _kasa_doviz_spinnerState();
}

class _kasa_doviz_spinnerState extends State<kasa_doviz_spinner> {
  String? selectedValue;

  final List<String> items = [


  ];

final List<String> items_kupon_id = [


  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message();
  }










  void message() async {
    await for(var snapshots in  FirebaseFirestore.instance.collection("kuponlar").snapshots()) {
      for (var message in snapshots.docs) {

    //    print(message.data()["kupon_adi"] + "sard");
      //  print(message.id + "sard");


        items.add(message.data()["kupon_adi"].toString());
        items_kupon_id.add(message.id);
      }
    }
  }





  @override
  Widget build(BuildContext context) {
    double witdh = MediaQuery.of(context).size.width;



    return  Container(
      width: 450,
      child: DropdownButtonHideUnderline(

        child: DropdownButton2<String>(

          isExpanded: true,
          hint: const Row(
            children: [
              /*   Icon(
                Icons.list,
                size: 16,
                color: Colors.yellow,
              ),*/
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Kupon Seç',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Constants.lightblack,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: items_kupon_id
              .map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Row(
              children: [


                Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Constants.lightblack,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ))
              .toList(),
          value: selectedValue == null ? widget.defaultValue : selectedValue,
          onChanged: (value) {
            setState(()  {



          //   int selected_index = items.indexOf(value.toString());

            //  items_kupon_id[items]
              selectedValue = value!;
              widget.onChanged!(value!);





            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 300,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              border: Border.all(
                color: Constants.white,
              ),
              color:Constants.white,
            ),
            elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_downward_outlined,
            ),
            iconSize: 20,
            iconEnabledColor: Constants.heavyblack,
            iconDisabledColor: Constants.lightblack,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Constants.white,
            ),
            //    offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(0),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}



/*StreamBuilder(
stream: firestore.collection("Users").doc("hatayberkay1234@gmail.com").snapshots(),

builder: (context, AsyncSnapshot<QuerySnapshot>  snapshot) {



//      List<Map<String, dynamic>> data = snap.data!.docs.map((e) => e.data()).toList();
//   kasalarim = snap.data!.docs;
//    kasalarim = snap.data!.docs.map((e) => Kasalar_object.fromMap(e.data as Map<String, dynamic> )).toList();
//   metin = snap.data!.docs;   //  final DataTableSource _all_kasa = MyKasaData(kasalarim);
//                             //   List<Kasalar_object> asd = [];
//                        //     asd.add(map as Kasalar_object);
//                           //  kasalar_object kasalar_object = new kasalar_object();
//                       //   kasalar_object = snap.data.docs.map((e) => Kasalar.fromMap(e.data)).toList();
//                         //    asd = snap.data!.docs.map((e) => Kasalar_object.fromMap()).toList();



//     if (snap.hasError) return Text ('Error = ${snap.error}');
if(snapshot.hasData){

print(snapshot.toString() + "sadda");

//         _data[index].data()['kasa_adi'])
// final List<QueryDocumentSnapshot<Object?>> value = snap.data!.docs;
//   print(snap.data!.docs[1].data().);



*//*   for(var snaps in  snap.data!.docs){

                                  var data = snaps.data() as Map;

                                  if(data.){
                                    print( data['kasa_adi']);

                                  }
                                }*//*

*//* var doc = snap.data!.docs[1];
                                var data = doc.data() as Map;

                                if(data.containsValue("hatayim")){
                                  print("object");

                                }
*//*

//   print( data['kasa_adi']);





*//*            for(var snapshots in ){
    for(var message in snapshots.docs){
    // kasalarim = snapshots.docs.map((e) => Kasalar_object.fromMap(e.data() as Map<String, dynamic> )).toList();
    print(message.data());

    }*//*

//       QuerySnapshot<Object?>? data = snap.data;



//  valuethatsearched;

// filtreleme   https://www.youtube.com/watch?v=aZ81waFuDXU&list=LL&index=13

List<dynamic> map = snapshot.data as List;




*//*   List<dynamic> map = snap.data!.docs.where((element) => element["kasa_adi"].toString().toLowerCase().contains(valuethatsearched)).toList();

                            List<dynamic> mapa = map.where((element) => element["doviz_cinsi"].toString().toUpperCase().contains(value_doviz)).toList();

                            List<dynamic> maps = mapa.where((element) => element["aktivite"].toString().toLowerCase().contains(valueaktif_pasif_searced)).toList();

*//*

//   List<dynamic> map = snap.data!.docs;

//  print(map.toList());




return Theme(
data: Theme.of(context)
    .copyWith(cardColor: Color(0xff232d37), dividerColor: Colors.green),

child: PaginatedDataTable(


//      sortColumnIndex: 0,
//    sortAscending: sort,



columns:  [


DataColumn(label: Text('Ad'),

),

DataColumn(label: Text('Soyad', style: TextStyle(color: Constants.white),)),
DataColumn(label: Text('E-Mail Adresi')),

DataColumn(label: Text('Telefon Numarasi')),
DataColumn(label: Text('Adres')),


],
source: MyUserData(map), //MyKasaData(map),

columnSpacing: 15,

),
);

}
else {
return Center(child: CircularProgressIndicator());



}




}),*/

class MyUserData extends DataTableSource {





  // List<Kasalar> kasalar = [];

  //MyKasaData(this._data);
  MyUserData(this._data);

  final List<dynamic> _data;


Options_controller _options_controller = Get.put(Options_controller());



  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  DataRow getRow(int index) {


    return DataRow(cells: [


      //  if(_data[index].data()['kasa_adi'].toString().contains("hatay"))





      DataCell(Text(_data[index].data()["ad"])),
      DataCell(Text(_data[index].data()["soyad"])),
      DataCell(Text(_data[index].data()["e_mail"])),
      DataCell(Text(_data[index].data()["kac_urun_satın_aldı"])),
      DataCell(Text(_data[index].data()["telefon"])),
      DataCell(Text(_data[index].data()["adres"])),
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
                                  backgroundColor: MaterialStateProperty.all(Colors.green),


                                ),


                                onPressed: () {

                                  _options_controller.user_e_mail_adress.value = _data[index].data()["e_mail"];

                                  print(_options_controller.user_e_mail_adress);


// hatayberkay1234@gmail.com
                                  }, child: Text("Seç", style: TextStyle(fontSize: 20 ,  fontFamily: 'Poppins', color: Colors.black),) ),






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


class indirim_kuponu_olustur extends StatefulWidget {
  const indirim_kuponu_olustur({Key? key}) : super(key: key);

  @override
  _indirim_kuponu_olusturState createState() => _indirim_kuponu_olusturState();
}

class _indirim_kuponu_olusturState extends State<indirim_kuponu_olustur> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _kupon_adi_controller = TextEditingController();
    TextEditingController _kupon_aciklama_controller = TextEditingController();
    TextEditingController _kupon_son_kullanma_tarihi_controller = TextEditingController();
    TextEditingController _kupon_harcama_limiti_controller = TextEditingController();
    TextEditingController _kupon_miktari_controller = TextEditingController();

    firestore_database_service _firestore = firestore_database_service();


    return Container(
      child: Row(
        children: [
          Spacer(),

          Column(


              children: [



                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Kupon Adı" , style: TextStyle(
                        fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                    ),),
                    SizedBox(height: 10,),
                    Container(
                      width: 1100,
                      child: FormContainerWidget(
                        controller: _kupon_adi_controller,
                        hintText: "Kupon Adı.",
                      ),
                    ),

                    SizedBox(height: 10,),
                  ],),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Kupon Aciklamasi" , style: TextStyle(
                        fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                    ),),
                    SizedBox(height: 10,),
                    Container(
                      width: 1100,
                      child: FormContainerWidget(
                        controller: _kupon_aciklama_controller,
                        hintText: "Kupon Aciklamasi",
                      ),
                    ),

                    SizedBox(height: 10,),
                  ],),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Son kullanma Tarihi" , style: TextStyle(
                        fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                    ),),
                    SizedBox(height: 10,),
                    Container(
                      width: 1100,
                      child: FormContainerWidget(
                        controller: _kupon_son_kullanma_tarihi_controller,
                        hintText: "Son kullanma Tarihi.",
                      ),
                    ),

                    SizedBox(height: 10,),
                  ],),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Harcama limiti" , style: TextStyle(
                        fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                    ),),
                    SizedBox(height: 10,),
                    Container(
                      width: 1100,
                      child: FormContainerWidget(
                        controller: _kupon_harcama_limiti_controller,
                        hintText: "Harcama limiti",
                      ),
                    ),

                    SizedBox(height: 10,),
                  ],),



                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Miktari" , style: TextStyle(
                        fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                    ),),
                    SizedBox(height: 10,),
                    Container(
                      width: 1100,
                      child: FormContainerWidget(
                        controller: _kupon_miktari_controller,
                        hintText: "Miktari  Ornek: 150",
                      ),
                    ),

                    SizedBox(height: 10,),
                  ],),


                SizedBox(height: 20,),

                Container(
                  width: 300,
                  height: 50,
                  child: OutlinedButton(

                    style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all(Colors.yellow[800]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) ,  )),
                    ),
                    child: const Text("Kuponu oluştur" , style: TextStyle(color: Constants.lightblack,
                        fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                    ),


                    ),
                    onPressed: () {
                      setState(() {



                        _firestore.kupon_olustur(    _kupon_adi_controller.text, _kupon_aciklama_controller.text, _kupon_son_kullanma_tarihi_controller.text,
                          _kupon_harcama_limiti_controller.text, _kupon_miktari_controller.text   ).then((value)  {

                          showDialog(context: context, builder: (BuildContext context) =>
                              auth_result_dialog(text: "Kupon Oluşturuldu." , button_text: "Anladım"),


                          );


                        });

                      });
                    },

                  ),
                ),



              ]),

          Spacer(),
        ],
      ),

    );
  }
}


