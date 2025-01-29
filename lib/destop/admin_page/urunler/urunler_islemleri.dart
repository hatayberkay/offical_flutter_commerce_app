import 'dart:html' as html;
import 'dart:io' ;

import 'package:e_commerce_official_app/auth_common/auth_dialog_confirm.dart';
import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/common/form_container_widget.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/firebase_operations/firebase_database.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import 'dart:typed_data';
import 'package:path/path.dart' as Path;
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:html' as html;
import 'package:file_picker/file_picker.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class urunler_islemleri extends StatefulWidget {
  final String purpose;


  const urunler_islemleri({super.key, required this.purpose});

  @override
  _urunler_islemleriState createState() => _urunler_islemleriState();
}

class _urunler_islemleriState extends State<urunler_islemleri> {
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

      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [





              if(widget.purpose.toString()! == "urun ekle")

                urun_ekle(),
              if(widget.purpose.toString()! == "urun guncelle")
               urun_guncelle(),


           /*   if(widget.purpose.toString()! == "urun sil")


              if(widget.purpose.toString()! == "urun guncelle")*/



            ]),
      ),



    );
  }
}

class urun_ekle extends StatefulWidget {
  const urun_ekle({Key? key}) : super(key: key);

  @override
  _urun_ekleState createState() => _urun_ekleState();
}

// https://stackoverflow.com/questions/54683705/flutter-cannot-display-image-from-image-url-firestore
// https://stackoverflow.com/questions/66813152/displaying-image-in-container-using-firebase-storage-in-flutter

class _urun_ekleState extends State<urun_ekle> {


  var _fileBytes;
 // Image _imageWidget;

  File? _pickedImage;
  Uint8List webImage = Uint8List(8);


  File? _image;

  late String imageUrl;
  late String imageUrl1;
  final storaged = FirebaseStorage.instance;


  firestore_database_service _firestore = firestore_database_service();




  @override
  void initState() {
    super.initState();
    // Set the initial value of imageUrl to an empty string
    imageUrl = '';
    imageUrl1 = '';
    //Retrieve the imge grom Firebase Storage
    getImageUrl();

  }


  Future<void> getImageUrl() async {
    // Get the reference to the image file in Firebase Storage
    final ref = storaged.ref().child("mail.png");
    final ref1 = storaged.ref().child("files/faild.png");
    // Get teh imageUrl to download URL
    final url = await ref.getDownloadURL();
    final url1 = await ref1.getDownloadURL();
    setState(() {
      imageUrl = url;
      imageUrl1 = url1;
    });
  }



  Future<void> uploadPic() async {

    final storage = FirebaseStorage.instance;
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //Get the file from the image picker and store it
    if(image != null) {
      var selected = File(image.name);
      print(selected.toString() + "asd");

      try {
        if(kIsWeb){


  final ref = FirebaseStorage.instance.ref().child("images/");
        ref.putFile(selected);


          storage.ref()
              .child('images/imageName')
              .putFile(selected);

        }


      }catch(e){

      }




    }



  }


  TextEditingController _urun_adi_controller = TextEditingController();
  TextEditingController _urun_fiyat_controller = TextEditingController();
  TextEditingController _gorsel_link_bir_controller = TextEditingController();
  TextEditingController _gorsel_link_iki_controller = TextEditingController();
  TextEditingController _gorsel_link_uc_controller = TextEditingController();
  TextEditingController _stok__adedi_controller = TextEditingController();
  TextEditingController _kategori_controller = TextEditingController();
  TextEditingController _kategori_alt_controller = TextEditingController();
  TextEditingController _marka_controller = TextEditingController();
  TextEditingController _durum_controller = TextEditingController();
  TextEditingController _urun_aciklama_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<ListResult>? futureFiles;
    FirebaseStorage storage = FirebaseStorage.instance;



    futureFiles =  storage.ref("files/").listAll();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

      //  NetworkImage("https://firebasestorage.googleapis.com/v0/b/commerce-fe056.appspot.com/o/files%2Flogo.png?alt=media&token=c3dc708d-1724-4fba-a0c2-4ad1ff3473a9"),

Spacer(),

        Column(
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Ürün Adı" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _urun_adi_controller,
                    hintText: "Ürün Adı.",
                  ),
                ),

                SizedBox(height: 10,),
              ],),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Ürün Fiyat" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _urun_fiyat_controller,
                    hintText: "Kupon Aciklamasi",
                  ),
                ),

                SizedBox(height: 10,),
              ],),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Ürün Gorsel link 1" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _gorsel_link_bir_controller,
                    hintText: "Son kullanma Tarihi.",
                  ),
                ),

                SizedBox(height: 10,),
              ],),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Ürün Gorsel link 2" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _gorsel_link_iki_controller,
                    hintText: "Harcama limiti",
                  ),
                ),

                SizedBox(height: 10,),
              ],),



            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Ürün Gorsel link 3" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _gorsel_link_uc_controller,
                    hintText: "Miktari  Ornek: 150",
                  ),
                ),

                SizedBox(height: 10,),
              ],),


            SizedBox(height: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Stok Adedi" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _stok__adedi_controller,
                    hintText: "Miktari  Ornek: 150",
                  ),
                ),

                SizedBox(height: 10,),
              ],),

            SizedBox(height: 20,),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Kategori" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _kategori_controller,
                    hintText: "Miktari  Ornek: 150",
                  ),
                ),

                SizedBox(height: 10,),
              ],),

            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Kategori" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _kategori_alt_controller,
                    hintText: "Miktari  Ornek: 150",
                  ),
                ),

                SizedBox(height: 10,),
              ],),

            SizedBox(height: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Marka" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _marka_controller,
                    hintText: "Miktari  Ornek: 150",
                  ),
                ),

                SizedBox(height: 10,),
              ],),

            SizedBox(height: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Durum" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _durum_controller,
                    hintText: "Miktari  Ornek: 150",
                  ),
                ),

                SizedBox(height: 10,),
              ],),

            SizedBox(height: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Durum" , style: TextStyle(
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 15
                ),),
                SizedBox(height: 10,),
                Container(
                  width: 1100,
                  child: FormContainerWidget(
                    controller: _urun_aciklama_controller,
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
                child: const Text("Ürün Ekle" , style: TextStyle(color: Constants.lightblack,
                    fontFamily:  'Poppins', fontWeight: FontWeight.w800, fontSize: 20
                ),


                ),
                onPressed: () {
                  setState(() {


                    _firestore.urun_ekle(_urun_adi_controller.text, _urun_fiyat_controller.text, _gorsel_link_bir_controller.text,
                        _gorsel_link_iki_controller.text , _gorsel_link_uc_controller.text, _stok__adedi_controller.text, _kategori_controller.text,
                        _kategori_alt_controller.text, _marka_controller.text, _durum_controller.text, _urun_aciklama_controller.text )
                        .then((value) => {

showDialog(context: context, builder: (BuildContext context) =>
                   auth_result_dialog(text: "Kupon Oluşturuldu." , button_text: "Anladım"),
),


                    });

                    /*  _firestore.kupon_olustur(_kupon_adi_controller.text, _kupon_aciklama_controller.text, _kupon_son_kullanma_tarihi_controller.text,
                    _kupon_harcama_limiti_controller.text, _kupon_miktari_controller.text ).then((value)  {

                  showDialog(context: context, builder: (BuildContext context) =>
                      auth_result_dialog(text: "Kupon Oluşturuldu." , button_text: "Anladım"),


                  );


                });*/

                  });
                },

              ),
            ),


          ],

        ),



        Spacer(),

        /*     CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),

        CachedNetworkImage(
          imageUrl: "https://firebasestorage.googleapis.com/v0/b/commerce-fe056.appspot.com/o/mail.png?alt=media&token=6f57a585-25ae-44c9-ad12-15efea5d9163",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),




        SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            )),
        Card(
          child: SizedBox(
              height: 300,
              child: Image(
                image: NetworkImage(imageUrl1 , ),
                fit: BoxFit.cover,
              )),
        ),*/

    /*    Image(image: const NetworkImage('https://firebasestorage.googleapis.com/v0/b/commerce-fe056.appspot.com/o/logo_turkish.jpg?alt=media&token=6fd703e2-84ef-4a9f-b666-3cc5e008145e'),
        ),


       *//* Image.network('http://rtablada.github.io/ember-profile-upload/profile.jpg',
          errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
            return Text('Your error widget...');
          },
        ),*//*






        Image.network('https://firebasestorage.googleapis.com/v0/b/commerce-fe056.appspot.com/o/logo_turkish.jpg?alt=media&token=6fd703e2-84ef-4a9f-b666-3cc5e008145e',
          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Text('Error');
          },
        ),




        FadeInImage(
          image:NetworkImage("https://firebasestorage.googleapis.com/v0/b/commerce-fe056.appspot.com/o/logo_turkish.jpg?alt=media&token=6fd703e2-84ef-4a9f-b666-3cc5e008145e"),
          placeholder: const AssetImage("your_default_image_path"),
          imageErrorBuilder:(context, error, stackTrace) {
            return Image.asset('your_default_image_path',
                fit: BoxFit.fitWidth
            );
          },
          fit: BoxFit.fitWidth,
        ),


*/








        TextButton(onPressed: ()  {

          setState(()  {

            uploadPic();
           // select_file();

            //_imaged();
       //     uploadFile();
         //   selectImage();
         //   uploadPic();
            /*    if (kIsWeb) {
              FilePickerResult? result =  FilePicker.platform.pickFiles() as FilePickerResult?;
              print("object");

              if (result != null) {

                Uint8List? fileBytes = result.files.first.bytes;
                String fileName = result.files.first.name;

                // Upload file
                 FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes!);
              }*/
            }

          );

        }, child: Text("sad"))


      ],
    );




  }
}


class urun_guncelle extends StatefulWidget {
  const urun_guncelle({Key? key}) : super(key: key);

  @override
  _urun_guncelleState createState() => _urun_guncelleState();
}

class _urun_guncelleState extends State<urun_guncelle> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
      return Container(
      child: SingleChildScrollView(
        child: Row(
            children: [



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
                    width: width,
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>( // inside the <> you enter the type of your stream
                      stream: FirebaseFirestore.instance.collection("products").snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {


                          //  List<String> map = snapshot.data!.docs.cast<String>();

                          //    final DataTableSource _allKasas = MyUserData(snapshot.data!.docs);



                          return  Container(
                            width: width,


                            color: Colors.green,
                            child: PaginatedDataTable(


//      sortColumnIndex: 0,
//    sortAscending: sort,



                              columns:  [


                                DataColumn(label: Text('Urun adi'),

                                ),

                                DataColumn(label: Text('Urun Fiyati',)),
                                DataColumn(label: Text('Stok adedi')),

                                DataColumn(label: Text('Marka')),
                                DataColumn(label: Text('Kategori')),
                                DataColumn(label: Text('Alt Kategori')),
                                DataColumn(label: Text('Durum')),
                                DataColumn(label: Text('İşlemler')),


                              ],
                              source: MyProductData(snapshot.data!.docs), //MyKasaData(map),

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

class MyProductData extends DataTableSource {





  // List<Kasalar> kasalar = [];

  //MyKasaData(this._data);
  MyProductData(this._data);

  final List<dynamic> _data;






  FirebaseFirestore _firestore = FirebaseFirestore.instance;



  String urun_adi_string = "";
  String stok_adedi_string = "";
  String marka_string = "";
  String kategori_string = "";
  String kategori_alt_string = "";
  String urun_fiyati_string = "";
  String durum_string = "";



  DataRow getRow(int index) {


    return DataRow(cells: [


      //  if(_data[index].data()['kasa_adi'].toString().contains("hatay"))





    DataCell(TextFormField(initialValue: _data[index].data()["urun_adi"] , onChanged: ((value) {
      urun_adi_string = value;

    })),),
    DataCell(TextFormField(initialValue: _data[index].data()["urun_fiyati"], onChanged: ((value) {
      urun_fiyati_string = value;
    }),)),
    DataCell(TextFormField(initialValue: _data[index].data()["stok_adedi"], onChanged: ((value) {
      stok_adedi_string = value;
    }),)),
    DataCell(TextFormField(initialValue: _data[index].data()["marka"], onChanged: ((value) {
      marka_string = value;
    }),)),
    DataCell(TextFormField(initialValue: _data[index].data()["kategori"], onChanged: ((value) {
      kategori_string = value;
    }),)),
    DataCell(TextFormField(initialValue: _data[index].data()["kategori_alt"] , onChanged: ((value) {
      kategori_alt_string = value;
    }),)),
    DataCell(TextFormField(initialValue: _data[index].data()["durum"], onChanged: ((value) {
      durum_string = value;

    }),)),

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

                                  _firestore.collection("products").doc(_data[index].reference.id)
                                      .update({
                                    "durum": durum_string.isNotEmpty ? durum_string : _data[index].data()["durum"].toString() ,
                                    'urun_adi': urun_adi_string.isNotEmpty ? urun_adi_string : _data[index].data()["urun_adi"].toString(),
                                    'urun_fiyati': urun_fiyati_string.isNotEmpty ? urun_fiyati_string :  _data[index].data()["urun_fiyati"],
                                    'stok_adedi': stok_adedi_string.isNotEmpty ? stok_adedi_string : _data[index].data()["stok_adedi"].toString(),
                                    'marka': marka_string.isNotEmpty ? marka_string : _data[index].data()["marka"].toString() ,
                                    'kategori': kategori_string.isNotEmpty ?  kategori_string : _data[index].data()["kategori"].toString()  ,
                                    'kategori_alt': kategori_alt_string.isNotEmpty ? kategori_alt_string : _data[index].data()["kategori_alt"].toString() ,


                                      })
                                      .then((value) =>   showDialog(context: ctx, builder: (BuildContext context) {

                                    return auth_result_dialog(text: "Ürün güncellendi", button_text: "Tamam");
                                  })
                                      .catchError((error) => print("Failed to update user: $error")));

                 /*                 _options_controller.user_e_mail_adress.value = _data[index].data()["e_mail"];

                                  print(_options_controller.user_e_mail_adress);

*/
// hatayberkay1234@gmail.com
                                }, child: Text("Güncelle", style: TextStyle(fontSize: 20 ,  fontFamily: 'Poppins', color: Colors.black),) ),






                      ),
                    ),

                  SizedBox(width: 20,),

                  Container(
                      width: 150,
                      height: 100,
                      child: StatefulBuilder(
                        builder: (ctx ,setState) =>
                            OutlinedButton(
                                key: GlobalKey(),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) , )),
                                  backgroundColor: MaterialStateProperty.all(Colors.red),


                                ),


                                onPressed: () {

                                  _firestore.collection("products").doc(_data[index].reference.id)
                                      .delete(


                                  )
                                      .then((value) =>   showDialog(context: ctx, builder: (BuildContext context) {

                                    return auth_result_dialog(text: "Ürün Silindi", button_text: "Tamam");
                                  })
                                      .catchError((error) => print("Failed to update user: $error")));

// hatayberkay1234@gmail.com
                                }, child: Text("Sil", style: TextStyle(fontSize: 20 ,  fontFamily: 'Poppins', color: Colors.black),) ),






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


/*
FutureBuilder<ListResult>(
future: futureFiles,
builder: (context, snapshot) {
if(snapshot.hasData) {
final files = snapshot.data!.items;
print(files.length.toString() + "asd");


return Container(
width: 400,
height: 500,
child: ListView.builder(
itemCount: files.length,
itemBuilder: (context, index)  {
final file = files[index];
return ListTile(
leading: Image.network(file.getDownloadURL().toString()),


title:  Text(file.name),

);

},

),
);


} if (snapshot.hasError) {
return const Text('Error');
} else {
return const CircularProgressIndicator();
}



},
),*/




/* Future select_file() async {




    print("works");
  }*/
/*  if (result != null) {
      Uint8List fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;

      // Upload file
      await FirebaseStorage.instance.ref('uploads/$fileName').putData(
          fileBytes);

  }*/




/*
    final result = await FilePicker.platform.pickFiles();

    if(result == null) return;
    setState(() {

      pickedFile = result.files.first;
    });
*/





/*
Future selectImage() async {
  try {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery,);
    File imageFile = File(pickedFile!.name);
    if(imageFile == null ) return 'there is no image';
    print(imageFile.path);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    if(kIsWeb){
      final storageRef = FirebaseStorage.instance.ref().child("UsersProfilePhoto/");

      // await storageRef.putData(imageFile);

    }

  } on FirebaseException catch (e) {
    print(e.message);
  }
}
*/

/*
  Future<void> uploadPic() async {


    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //Get the file from the image picker and store it
    if(image != null) {
      var selected = File(image.name);
      print(selected.toString() + "asd");

      try {
        if(kIsWeb){

          */
/*  final ref = FirebaseStorage.instance.ref().child("images/");
        ref.putFile(selected);*//*


          storage.ref()
              .child('images/imageName')
              .putFile(selected);

        }


      }catch(e){

      }




    }



  }



  Future <void> _imaged() async {


    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery,);
  //  File imageFile = File(pickedFile!.name);
    File imageFile = html.File(pickedFile!.path.codeUnits, pickedFile!.name) as File;


    storage.ref()
        .child('images/imageName')
        .putData(imageFile.readAsBytes() as Uint8List);

*/
/*    PickedFile pickedFile =
    await picker.getImage(source: ImageSource.gallery);

    final fileBytes = pickedFile.readAsBytes();
    var now = DateTime.now().millisecondsSinceEpoch;

    FirebaseStorage.instance.ref().child("images/$now");

    StorageUploadTask uploadTask = reference.putData(fileBytes);*//*


  }



  Future <void> _pickImage() async {
  if(!kIsWeb){
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
    var selected = File(image.path);
    var s = "files/${image.name}";

      setState(() {
        print(selected);

        _pickedImage = selected;

   */
/* final ref =  storage.ref().child(s);
   ref.putFile(image as File);*//*

      });

    }

  }
  if(kIsWeb){
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    File images = (await _picker.pickImage(source: ImageSource.gallery)) as File;
    if(image != null) {

      var f = await image.readAsBytes();
      setState(() {
        webImage = f;
        _pickedImage = File("a");

     final ref = FirebaseStorage.instance.ref().child("_pickedImage");
     ref.putFile(images as File);

      });


    }

  }

}
*/

/*
Future <void> _pickImages() async {
  if(!kIsWeb){
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
    var selected = File(image.path);
    var s = "files/${image.name}";

      setState(() {
        print(selected);

        _pickedImage = selected;

   */
/* final ref =  storage.ref().child(s);
   ref.putFile(image as File);*//*

      });

    }

  }
  if(kIsWeb){
    final picture = recorder.endRecording();
    final img = picture.toImage(640, 360);
    final pngBytes = await img.toByteData(format: ImageByteFormat.png);
    Uint8List finalImage = Uint8List.view(pngBytes.buffer);

    final Directory systemTempDir = Directory.systemTemp;
    final File file = await new File('${systemTempDir.path}/foo.png').create();
    file.writeAsBytes(finalImage);
    final ref = storage.ref().child('images').child('image.png');
    final  uploadTask = ref.putFile(file);

  }

}



  void getImage() async{
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }


Future <void> _pickImagesd() async {




  if(kIsWeb){


    void addImageToFirebase(){


      //CreateRefernce to path.
      StorageReference ref = storageReference.child("yourstorageLocation/");

      //StorageUpload task is used to put the data you want in storage
      //Make sure to get the image first before calling this method otherwise _image will be null.

      StorageUploadTask storageUploadTask = ref.child("image1.jpg").putFile(_image);

      if (storageUploadTask.isSuccessful || storageUploadTask.isComplete) {
        final String url = await ref.getDownloadURL();
        print("The download URL is " + url);
      } else if (storageUploadTask.isInProgress) {

        storageUploadTask.events.listen((event) {
          double percentage = 100 *(event.snapshot.bytesTransferred.toDouble()
              / event.snapshot.totalByteCount.toDouble());
          print("THe percentage " + percentage.toString());
        });

        StorageTaskSnapshot storageTaskSnapshot =await storageUploadTask.onComplete;
        downloadUrl1 = await storageTaskSnapshot.ref.getDownloadURL();

        //Here you can get the download URL when the task has been completed.
        print("Download URL " + downloadUrl1.toString());

      } else{
        //Catch any cases here that might come up like canceled, interrupted
      }

    }

  }

}

*/

/*

Future<UploadTask?> uploadFile() async {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery,);
  File imageFile = File(pickedFile!.name);


  */
/*     if (file == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No file was selected'),
          ),
        );

        return null;
      }
*//*

  UploadTask uploadTask;

  // Create a Reference to the file
  Reference ref = FirebaseStorage.instance
      .ref()
      .child('flutter-tests')
      .child('/some-image.jpg');

  final metadata = SettableMetadata(
    contentType: 'image/jpeg',
    customMetadata: {'picked-file-path': imageFile.path},
  );

  if (kIsWeb) {
    uploadTask = ref.putData(await imageFile.readAsBytes(), metadata);
  } else {
    uploadTask = ref.putFile(File(imageFile.path), metadata);
  }

  return Future.value(uploadTask);
}



*/
