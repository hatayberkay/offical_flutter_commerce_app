import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/adres_bilgileri.dart';
import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/degerlendirmelerim.dart';
import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/duyuru_tercihleri.dart';
import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/hesap_bilgileri.dart';
import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/hesap_pages/hesap_bilgileri_next.dart';
import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/iade_taleplerim.dart';
import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/indirim_kuponlari.dart';
import 'package:e_commerce_official_app/destop/login_destop/options_pages_files/siparislerim.dart';
import 'package:get/get.dart';

class Options_controller extends GetxController{

  RxInt index = 0.obs;
  RxString user_e_mail_adress = "".obs;


  var options_pages = [
  // Ana sayfalar
    hesap_bilgileri(),
    siparislerim(),
    degerlendirmelerim(),
  adres_bilgileri(),
  indirim_kuponlari(),
  iade_taleplerim(),
    duyuru_tercihleri(),


    //Hesabım sayfalar
    hesap_bilgileri_next(),


  ];

}