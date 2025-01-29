import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class siparislerim extends StatefulWidget {
  const siparislerim({Key? key}) : super(key: key);

  @override
  _siparislerimState createState() => _siparislerimState();
}






class _siparislerimState extends State<siparislerim> {
  List<String> liste_adi_id = [];
  List<String>  urun_adi_listem = [];
  List<String> urun_fiyati_listem = [];
  List<String>  urun_gorsel_listem = [];
  List<String> durum_liste = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    liste_adi_id = [];
    urun_adi_listem = [];
    urun_fiyati_listem = [];
    urun_gorsel_listem = [];
    durum_liste = [];

    setState(() {

      siparislerim_indir();
    });

  }
  void  siparislerim_indir() async {


    await for(var snapshots in   FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser?.email.toString())
        .collection("siparislerim")
        .snapshots()){
      for(var message in snapshots.docs){

        liste_adi_id.add(message.data()["id"]);


      }

      // tüm dokumanlara bak
      for (int i = 0; i < liste_adi_id.length; i++) {

        var points = await FirebaseFirestore.instance
            .collection('siparislerim')
            .doc(liste_adi_id[i])
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Map data = (documentSnapshot.data() as Map);


            setState(() {
              durum_liste.add(data['durum']);
              urun_gorsel_listem.add(data['gorsel']);
              urun_fiyati_listem.add(data['fatura_fiyati']);
              urun_adi_listem.add(data['urun_adi']);

            });




            /*     for (var entry in data['durum'].values) {
              print(entry);


              listem_adi.add(entry);
            }

            data.forEach((key, value) {
              print('adding entry' + value["durum"]);

            });
*/


          }
        });


      }

    }




  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 600,
      color: Constants.white,
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Column(

            children: [



              if(liste_adi_id.length == 0)
                Text("Henüz bir şey satın almadığınız için listelenecek ürün yoktur."),

              if(liste_adi_id.length > 0)
          ListView.builder(
          shrinkWrap: true,

          itemBuilder: (context, index) =>

          siparislerim_widget(image_url: urun_gorsel_listem[index].toString(), urun_adi: urun_adi_listem[index].toString(),
          durum: durum_liste[index].toString(), fiyati: urun_fiyati_listem[index].toString(),
          ),



          // Text(durum_liste[index]),
          //   urun_fiyat: snapshot.data!.docs[index].get("urun_fiyati"),

          itemCount: liste_adi_id.length,
        ),






            ]),
      ),

    );
  }
  }

  class siparislerim_widget extends StatefulWidget {
  final String urun_adi;
  final String image_url;
  final String fiyati;
  final String durum;

    const siparislerim_widget({super.key , required this.urun_adi, required this.image_url, required this.fiyati, required this.durum});

    @override
    _siparislerim_widgetState createState() => _siparislerim_widgetState();
  }

  class _siparislerim_widgetState extends State<siparislerim_widget> {
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Container(
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.white),
          child: Column(

            children: [

              Row(children: [


                Container(
                  height: 150,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(Constants.kPadding),
                      child: Image.network( widget.image_url,
                        fit: BoxFit.fill, width: 100, height: 50,),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("${widget.urun_adi} ", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                  ),
                  SizedBox(height: 20,),

                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("${widget.fiyati} ", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                  ),

                ],),

                Spacer(),

                Container(
                  height: 150,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("${widget.durum} ", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),

                    ),
                  ),
                ),


              ],),



            ],


          ),


        ),
      );
    }
  }


