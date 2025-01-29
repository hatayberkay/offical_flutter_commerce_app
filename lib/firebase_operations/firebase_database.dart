import 'dart:async';
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class firestore_database_service {


  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;


  //final _firestore_id = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.email).collection('kasalar').doc();
 // String id_string = "";

  Future<void> uyelik_kayit_ilk_kez(String ad, String soyad, String telefon,String e_mail, String kampanya_mesajlari) async {


//  FirebaseAuth.instance.currentUser?.email

// print(sideBarController.user_email.value);

       await _firestore.collection('Users').doc(e_mail).set({

          'ad':  ad,
          'soyad' :  soyad,
          'telefon' :  telefon,
          'e_mail' :  e_mail,
          'kampanya_mesajlari' :  kampanya_mesajlari,
          'kac_urun_satın_aldı' : "0" ,

        });
        }

  final _firestore_id = FirebaseFirestore.instance.collection('kuponlar');
  String id_string = "";

        Future<void> kupon_olustur( String kupon_adi, String kupon_aciklama, String kupon_son_kullanma_tarihi, String kupon_harcama_limiti, String kupon_miktar) async {

          id_string = _firestore_id.id;

    await _firestore_id.doc().set({
      'id':  id_string,
      'kupon_adi':  kupon_adi,
      'kupon_aciklama' :  kupon_aciklama,
      'kupon_son_kullanma_tarihi' :  kupon_son_kullanma_tarihi,
      'kupon_harcama_limiti' :  kupon_harcama_limiti,
      'kupon_miktar' :  kupon_miktar,




    });




        }




        Future<void> urun_ekle(String urun_adi, String urun_fiyati, String gorsel_link_first, String gorsel_link_second, String gorsel_link_third
            , String stok_adedi, String kategori, String kategori_alt, String marka, String durum, String urun_aciklama ) async {

    await _firestore.collection("products").doc().set({
      'urun_adi':  urun_adi,
      'urun_fiyati' :  urun_fiyati,
      'gorsel_link_first' :  gorsel_link_first,
      'gorsel_link_second' :  gorsel_link_second,
      'gorsel_link_third' :  gorsel_link_third,
      'stok_adedi' :  stok_adedi,
      'kategori' :  kategori,
      'kategori_alt' :  kategori_alt,
      'marka' :  marka,
      'durum' :  durum,
      'urun_aciklama' :  urun_aciklama,




    });




        }



}

    //value.data()?["kasa_id"]

    /*await _firestore.collection("Users").doc( "hatayberkay1234/kasalar"    ).set({



  });*/



