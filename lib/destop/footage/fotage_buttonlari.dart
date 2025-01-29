import 'package:e_commerce_official_app/common/Constants.dart';
import 'package:e_commerce_official_app/destop/app_bar.dart';
import 'package:e_commerce_official_app/destop/footage/footage.dart';
import 'package:e_commerce_official_app/responsive_layout.dart';
import 'package:flutter/material.dart';

class footage_buttonlar extends StatefulWidget {
  final String button_adi;

  const footage_buttonlar({super.key, required this.button_adi});

  @override
  _footage_buttonlarState createState() => _footage_buttonlarState();
}

class _footage_buttonlarState extends State<footage_buttonlar> {
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

            children: [



              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "hakkımızda")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: hakkimizda()),

                  Spacer(),
              ],),

     Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "Site Kullanım Şartları")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: site_kullanim()),

                  Spacer(),
              ],),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "İADE VE DEĞİŞİM")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: iade_ve_degisim()),

                  Spacer(),
              ],),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "Gizlilik ve Güvenlik Politikası")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: gizlilik()),

                  Spacer(),
              ],),
        Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "Gizlilik ve KVKK Politikası")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: kvkk()),

                  Spacer(),
              ],),


              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "İletişim")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: iletisim()),

                  Spacer(),
              ],),


              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "Teslimat ve İade")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: teslimat()),

                  Spacer(),
              ],),
        Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "Sık Sorulan Sorular")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: sik_sorulanlar()),

                  Spacer(),
              ],),

        Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "Üyelik Sözleşmesi")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: uyelik_sozlesmesi()),

                  Spacer(),
              ],),
     Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Spacer(),

                if("${widget.button_adi}" == "Yasaklı Ürünler")
                  Container(
                      width: 1100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),

                      child: yasakli_urunler()),

                  Spacer(),
              ],),



              SizedBox(height: 20,),

              // footage
              Container(
                width: 1100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                child: Column(
                  children: [
                    footage(),


                    Padding(
                      padding: const EdgeInsets.all(Constants.kPadding),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Mobil Uygulamalarımız", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600,fontSize: 30),),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(Constants.kPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/apple.png", width: 200,),
                          SizedBox(width: 20,),
                          Image.asset("images/google.png" , width: 200,),

                        ],
                      ),
                    )


                  ],
                ),
              ),

            ],


          ),
        ));
  }
}

class hakkimizda extends StatefulWidget {
  const hakkimizda({Key? key}) : super(key: key);

  @override
  _hakkimizdaState createState() => _hakkimizdaState();
}

class _hakkimizdaState extends State<hakkimizda> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.kPadding),
            child: Text("Hakkımızda"),
          ),

          SizedBox(height: 20,),



        ],
      ),

    );
  }
}

class site_kullanim extends StatefulWidget {
  const site_kullanim({Key? key}) : super(key: key);

  @override
  _site_kullanimState createState() => _site_kullanimState();
}

class _site_kullanimState extends State<site_kullanim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20,),

            Text("SİTE KULLANIM ŞARTLARI" , style: Constants.baslik ),

            SizedBox(height: 20,),

            Text("(Lütfen sitemizi kullanmadan önce bu ‘site kullanım şartları’nı dikkatlice okuyunuz.)" , style: Constants.baslik ),

            SizedBox(height: 20,),


            Text("Wnt.com.tr’yi kullanan ve alışveriş yapan müşterilerimiz aşağıdaki şartları okumuş ve kabul etmiş sayılmaktadır:" , style: Constants.baslik),
            SizedBox(height: 20,),
    Text(" Wnt.com.tr sitemizdeki web sayfaları ve ona bağlı tüm sayfalar (‘site’) Tomtom Mah. "
    "İstiklal Cad. Mısır Apt. No:163/4 Beyoğlu/İSTANBUL adresindeki WNT Dış Ticaret ve "
    "Pazarlama A.Ş'nin (WNT) malıdır ve onun tarafından işletilir. Sizler (‘Kullanıcı’) "
    "sitede sunulan tüm hizmetleri kullanırken aşağıdaki şartlara tabi olduğunuzu, sitedeki "
    "hizmetten yararlanmakla ve kullanmaya devam etmekle; bağlı olunan ve yürürlükte bulunan"
    " yasalara göre sözleşme imzalama hakkına, yetkisine ve hukuki ehliyetine sahip ve 18 yaşın üzerinde olduğunuzu,"
    " bu sözleşmeyi okuduğunuzu, anladığınızı ve sözleşmede yazan şartlarla bağlı olduğunuzu kabul etmiş sayılırsınız." , style: Constants.alt_metin),

    Text("  İşbu sözleşme taraflara sözleşme konusu site ile ilgili hak ve yükümlülükler yükler"
          " ve taraflar işbu sözleşmeyi kabul ettiklerinde bahsi geçen hak ve yükümlülükleri eksiksiz,"
          " doğru, zamanında, işbu sözleşmede talep edilen şartlar dâhilinde yerine getireceklerini "
          "beyan ederler." , style: Constants.alt_metin),
            SizedBox(height: 20,),
            Text("1.Sorumluluklar" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.WNT, fiyatlar ve sunulan ürün ve hizmetler üzerinde değişiklik yapma hakkını her zaman saklı tutar."
                " WNT, üyenin sözleşme konusu hizmetlerden, teknik arızalar dışında yararlandırılacağını kabul ve "
                "taahhüt eder." , style: Constants.alt_metin) ,


            Text("b.Kullanıcı, sitenin kullanımında tersine mühendislik yapmayacağını ya da bunların kaynak kodunu bulmak veya elde etmek "
                "amacına yönelik herhangi bir başka işlemde bulunmayacağını aksi halde "
                "ve 3. kişiler nezdinde doğacak zararlardan sorumlu olacağını, hakkında hukuki ve cezai işlem yapılacağını peşinen kabul eder." , style: Constants.alt_metin),


            Text("c.Kullanıcı, site içindeki faaliyetlerinde, sitenin herhangi bir "
                "bölümünde veya iletişimlerinde genel ahlaka ve adaba aykırı, kanuna aykırı,"
                " 3. kişilerin haklarını zedeleyen, yanıltıcı, saldırgan, müstehcen, pornografik, "
                "kişilik haklarını zedeleyen, telif haklarına aykırı, yasa dışı faaliyetleri teşvik eden "
                "içerikler üretmeyeceğini, paylaşmayacağını kabul eder. Aksi halde oluşacak zarardan tamamen"
                " kendisi sorumludur ve bu durumda ‘Site’ yetkilileri, bu tür hesapları askıya alabilir, sona "
                "erdirebilir, yasal süreç başlatma hakkını saklı tutar. Bu sebeple yargı mercilerinden etkinlik "
                "veya kullanıcı hesapları ile ilgili bilgi talepleri gelirse paylaşma hakkını saklı tutar."
                " Sitenin üyelerinin birbirleri veya üçüncü şahıslarla olan ilişkileri kendi sorumluluğundadır.", style: Constants.alt_metin),
            SizedBox(height: 20,),
Text("2.Fikri Mülkiyet Hakları" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.İşbu Site’de yer alan unvan, işletme adı, marka, patent, logo, tasarım, "
                "bilgi ve yöntem gibi tescilli veya tescilsiz tüm fikri mülkiyet hakları "
                "site işleteni ve sahibi WNT’ye veya belirtilen ilgilisine ait olup, ulusal ve"
                " uluslararası hukukun koruması altındadır. "
                "İşbu Site’nin ziyaret edilmesi veya bu Site’deki hizmetlerden yararlanılması söz konusu fikri mülkiyet "
                "hakları konusunda hiçbir hak vermez.", style: Constants.alt_metin),

            Text("b.Site’de yer alan bilgiler hiçbir şekilde çoğaltılamaz,"
                " yayınlanamaz, kopyalanamaz, sunulamaz ve/veya aktarılamaz. "
                "Site’nin bütünü veya bir kısmı diğer bir internet sitesinde izinsiz olarak kullanılamaz." , style: Constants.alt_metin),
            SizedBox(height: 20,),
            Text("3.Gizli Bilgiler" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.WNT, site üzerinden kullanıcıların ilettiği kişisel bilgileri 3. kişilere açıklamayacaktır. "
                "Bu kişisel bilgiler; kişi adı-soyadı, adresi, telefon numarası,"
                " cep telefonu, e-posta adresi gibi Kullanıcı’yı tanımlamaya yönelik"
                " her türlü diğer bilgiyi içermekte olup, kısaca ‘Gizli Bilgiler’ olarak anılacaktır.", style: Constants.alt_metin),

            Text("b.Kullanıcı, sadece tanıtım, reklam, kampanya, promosyon, duyuru vb. "
                "pazarlama faaliyetleri kapsamında kullanılması ile sınırlı olmak üzere,"
                " Site’nin sahibi olan WNT’nin kendisine ait iletişim, portföy durumu ve"
                " demografik bilgilerini iştirakleri ya da bağlı bulunduğu grup şirketleri "
                "ile paylaşmasına muvafakat ettiğini kabul ve beyan eder. Bu kişisel bilgiler WNT bünyesinde müşteri profili belirlemek,"
                " müşteri profiline uygun promosyon ve kampanyalar sunmak ve istatistiksel çalışmalar yapmak amacıyla kullanılabilecektir.", style: Constants.alt_metin),

            Text("c.Gizli Bilgiler, ancak resmi makamlarca usulü dairesinde bu"
                " bilgilerin talep edilmesi "
                "halinde ve yürürlükteki emredici mevzuat hükümleri gereğince "
                "resmi makamlara açıklama yapılmasının zorunlu olduğu durumlarda"
                " resmi makamlara açıklanabilecektir.", style: Constants.alt_metin),
            SizedBox(height: 20,),
            Text("4.Garanti Vermeme Hususu" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.İşbu sözleşme maddesi uygulanabilir kanunun izin verdiği azami ölçüde geçerli olacaktır. WNT tarafından sunulan hizmetler"
                " ""olduğu gibi”" "ve" "mümkün olduğu” temelde sunulmakta ve pazarlanabilirlik, belirli "
            "bir amaca uygunluk veya ihlal etmeme konusunda tüm zımni garantiler de dâhil olmak üzere"
                " hizmetler veya uygulama ile ilgili olarak (bunlarda yer alan tüm bilgiler dâhil) "
                "sarih veya zımni, kanuni veya başka bir nitelikte hiçbir garantide bulunmamaktadır." , style: Constants.alt_metin),
            SizedBox(height: 20,),
            Text("5.Kayıt ve Güvenlik Hususu" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.Kullanıcı, doğru, eksiksiz ve güncel kayıt bilgilerini vermek zorundadır. Aksi halde bu Sözleşme"
                " ihlal edilmiş sayılacak ve Kullanıcı bilgilendirilmeksizin hesap kapatılabilecektir. "
                "Kullanıcı, site ve üçüncü taraf sitelerdeki şifre ve hesap güvenliğinden kendisi sorumludur. "
                "Aksi halde oluşacak veri kayıplarından ve güvenlik ihlallerinden veya donanım ve cihazların zarar"
                " görmesinden WNT sorumlu tutulamaz." , style: Constants.alt_metin),
            SizedBox(height: 20,),
            Text("6.Mücbir Sebepler" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.Tarafların kontrolünde olmayan; tabii afetler, yangın, patlamalar, iç savaşlar, savaşlar, ayaklanmalar, halk hareketleri,"
    " seferberlik ilanı, grev, lokavt ve salgın hastalıklar, altyapı ve internet arızaları, elektrik kesintisi gibi sebeplerden"
    " (aşağıda birlikte " "Mücbir Sebep” olarak anılacaktır.) dolayı sözleşmeden doğan yükümlülükler"
   " taraflarca ifa edilemez hale gelirse, taraflar bundan sorumlu değildir. Bu sürede Taraflar’ın işbu Sözleşme’den doğan hak ve yükümlülükleri askıya alınır.""" , style: Constants.alt_metin),

            SizedBox(height: 20,),
            Text("7.Bütünlük ve Uygulanabilirlik" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.İşbu sözleşme şartlarından biri, kısmen veya tamamen geçersiz hale gelirse, sözleşmenin geri kalanı geçerliliğini korumaya devam eder.", style: Constants.alt_metin),
            SizedBox(height: 20,),
            Text("8.Yapılacak Değişiklikler" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.WNT, dilediği zaman sitede sunulan hizmetleri ve işbu sözleşme şartlarını kısmen veya tamamen değiştirebilir."
                " Değişiklikler yayınlandığı tarihten itibaren geçerli olacaktır. "
                "Değişiklikleri takip etmek Kullanıcı’nın sorumluluğundadır. "
                "Kullanıcı, sunulan hizmetlerden yararlanmaya devam etmekle bu değişiklikleri de kabul etmiş sayılır.", style: Constants.alt_metin),
            SizedBox(height: 20,),
            Text("9.Bildirimler" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.İşbu Sözleşme ile ilgili taraflara gönderilecek olan tüm bildirimler,"
                " WNT’nin bilinen eposta adresi ve kullanıcının üyelik formunda belirttiği "
                "eposta adresi vasıtasıyla yapılacaktır. Kullanıcı, üye olurken belirttiği"
                " adresin geçerli tebligat adresi olduğunu, "
                "değişmesi durumunda 5 gün içinde yazılı olarak diğer tarafa bildireceğini,"
                "aksi halde bu adrese yapılacak tebligatların geçerli sayılacağını kabul eder." , style: Constants.alt_metin),
            SizedBox(height: 20,),
            Text("10.Delil Sözleşmesi" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.Taraflar arasında işbu sözleşme ile ilgili işlemler"
                " için çıkabilecek her türlü uyuşmazlıklarda Taraflar’ın defter,"
                " kayıt ve belgeleri ile ve bilgisayar kayıtları ve faks kayıtları "
                "6100 sayılı Hukuk Muhakemeleri Kanunu uyarınca delil olarak kabul "
                "edilecek olup, kullanıcı bu kayıtlara itiraz etmeyeceğini kabul eder.", style: Constants.alt_metin),

            SizedBox(height: 20,),
            Text("11.Uyuşmazlık Çözümü" , style: Constants.baslik),
            SizedBox(height: 20,),
            Text("a.İşbu Sözleşme’nin uygulanmasından veya yorumlanmasından"
                " doğacak her türlü uyuşmazlığın çözümünde İstanbul (Merkez) "
                "Adliyesi Mahkemeleri ve İcra Daireleri yetkilidir." , style: Constants.alt_metin),

            SizedBox(height: 50,),


          ],
        ),
      ),

    );
  }
}

class iade_ve_degisim extends StatefulWidget {
  const iade_ve_degisim({Key? key}) : super(key: key);

  @override
  _iade_ve_degisimState createState() => _iade_ve_degisimState();
}

class _iade_ve_degisimState extends State<iade_ve_degisim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Text("İade ve Değişim" , style: Constants.baslik,),
            ),

            SizedBox(height: 20,),

            Text("Wnt.com.tr’yi tercih ettiğiniz için teşekkür ederiz. Aşağıda iade ve değişim politikamızla"
                " ilgili bilgileri bulabilirsiniz. Herhangi bir soru, öneri veya görüşleriniz için İletisim Formunu kullanarak bizimle iletişime geçebilirsiniz."
                " Tarafımıza ileteceğiniz görüşleriniz bizim için çok değerli olup platformumuzu siz değerli"
                " müşterilerimize daha iyi bir hizmet sunmamıza yardımcı olacaktır."),
            SizedBox(height: 20,),
            Text("İADE VE DEĞİŞİM POLİTİKASI" , style: Constants.baslik,),

            SizedBox(height: 20,),
            Text("Wnt.com.tr den aldığınız ürünleri, anlaşmalı "
                "olduğumuz veya teslim aldığınız kargo firması ile "
                "iade etmeniz gerekmektedir. Ürünlerin tarafınıza teslimi"
                "tarihinden itibaren en geç 15 gün içerisinde üye panelinizden"
                "ürün iade talimatı oluşturarak anlaşmalı kargolarımız ile Satıcıya "
                "iadesi için anlaşmalı kargoya vermeniz gerekmektedir. 15 günü aşan "
                "bildirimlerde maalesef iade kabul edilmemektedir. İade süresi dolan,"
                " faturasız, etiketsiz, yıkanmış, kullanılmış tekrar satılabilir "
                "özelliğini kaybetmiş ya da hasar görmüş ürünlerin iade ve değişimi"
                " kabul edilmeyecek, tarafınıza karşı ödemeli olarak geri gönderilecektir."
                " İadeniz Wnt.com.com.tr ilgili birimleri tarafından incelendikten ve onaylandıktan sonra ürün tutarı, 1-7 iş"
                " günü içerisinde ilgili bankanıza iade edilir. Bundan sonraki süreç tamamen bankanıza bağlıdır ve Wnt.com.tr'"
                "nin bankanıza müdahale etme hakkı yoktur. Taksitli olarak satın almış olduğunuz ürünlerinize ait ürün tutarı "
                "tarafımızdan tek seferde tamamı kredi kartınıza iade edilmektedir, bankanız tarafından, ürün bedeli iadesi çalıştığınız "
                "bankanın prosedürleri çerçevesinde, taksitli yada tek seferde olarak kredi kartınıza geri ödenecektir. Ulaşılamayan irtibat "
                "telefon numaralarından kaynaklı gecikmelerden Wnt.com.tr sorumluluk kabul etmemektedir."
                " Ayrıntılı bilgi için 0850 305 98 17 Müşteri Hizmetlerini arayabilir veya iletişim bölümünden e-mail ile bilgi talep edebilirsiniz."
              , style: Constants.alt_metin,
            ),

            SizedBox(height: 20,),
            Text("HANGİ ÜRÜNLER İADE EDİLEMEZ?" , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("Kozmetik ve kişisel bakım ürünleri, ambalajı açılmış ve denenmiş"
                " iç giyim ürünleri, ambalajı açılmış ve denenmiş mayo ve bikini, "
                "kitap, kopyalanabilir yazılım ve programlar, DVD, VCD, CD ve kasetler "
                "ile kırtasiye sarf malzemeleri (toner, kartuş, şerit vb.) ancak ambalajı"
                " açılmamış, denenmemiş, bozulmamış ve kullanılmamış olmaları halinde iade "
                "edilebilir. Sadece Tasarım ve Abiye ürünlerine özel iade işlemi; ürünün aynı gün içerisinde "
                "iade edilmesi durumunda geçerli olacaktır. Belirtilen sürenin aşılması durumunda ise iade işlemleri "
                "gerçekleşmemektedir. Tek kullanımlık ürünler hızlı bozulan veya son kullanma tarihi geçme ihtimali"
                " olan ürünlerin iadesi kabul edilmemektedir. İade ve değişimlerde sorun yaşanmaması adına ayakkabılarınızı ev ortamında, "
                "tekstil ürünlerinin etiketlerini koparmadan ve yıkamadan denemenizi öneririz. Etiketleri koparılmış "
                "ve yıkanmış ürünler kabul edilmemektedir."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("“Elektronik ürünlerin tesliminden"
            " sonra ambalaj, bant, mühür, paket gibi koruyucu"
            " unsurları açılmış olması halinde” cayma hakkı kapsamı dışında kalacaktır."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("ELİME GEÇEN ÜRÜN KUSURLU, NE YAPMAM GEREKİYOR?" , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("Wnt.com.tr üzerinden almış olduğunuz kusurlu/ayıplı"
                " ürünlerin iadesini kullanıcı panelinizden iade talimatı "
                "oluşturarak anlaşmalı kargo firmalarımızla ilgili tedarikçiye"
                "iadesini gerçekleştirebilirsiniz. Tedarikçilerimizden kaynaklı "
                "yanlış beden, yanlış renk, farklı ürün vb gönderiler nedeniyle"
                " yaşanan aksaklıktan dolayı öncelikle özür dileriz. Belirtmiş olduğunuz ürün tedarikçi firma stoklarında bulunduğu takdirde, "
                "derhal değişim yapılacak ve yeni ürün tarafınıza gönderilecektir, talep edilen ürünün tedarikçilerimizin stoklarında bulunmaması"
                " durumunda siparişiniz iptal edilip ücret iadesin iade prosedürümüz çerçevesinde ilgili bankanıza ücret iadeniz yapılacaktır. "
                "Çeşitli dönemler yapacağımız kampanyalı ürünlerde oluşabilecek iade durumlarında, ürünler stoklarla sınırlı ürünler olmasından dolayı"
                " ilgili kampanyalardan almış olduğunuz ürün/ürünlerin tedarikçi firma stoklarında olmaması durumunda siparişiniz iptal edilerek "
                "para iadesi işlemi gerçekleştirilecektir. Wnt.com.tr üzerinden yapmış olduğunuz alışverişlerde yaşayabileceğiniz bir olumsuzluk olması"
                " durumunda 0850 305 98 17 numaralı Müşteri Hizmetlerini arayabilir veya iletişim bölümünden e-posta "
                "ile temasa geçerek destek talebinde bulunabilirsiniz."  , style: Constants.alt_metin,),
            SizedBox(height: 50,),


          ],
        ),
      ),

    );
  }
}

class gizlilik extends StatefulWidget {
  const gizlilik({Key? key}) : super(key: key);

  @override
  _gizlilikState createState() => _gizlilikState();
}

class _gizlilikState extends State<gizlilik> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Text("Gizlilik ve Güvenlik Politikası", style: Constants.baslik, ),
            ),

            SizedBox(height: 20,),

            Text("1. Wnt.com.tr sanal pazar platformumuzda"
                " verilen tüm servisler ve aşağıda verilen"
                " adreste kayıtlı  WNT Dış Ticaret ve Pazarlama "
                "A.Ş. ünvanına haiz WNT’ye aittir ve WNT tarafından işletilir. " , style: Constants.alt_metin,),

            Text("2. WNT, çeşitli amaçlarla kişisel veriler toplayabilir."
                " Aşağıda, toplanan kişisel verilerin nasıl ve ne şekilde toplandığı, "
                "bu verilerin nasıl ve ne şekilde korunduğu belirtilmiştir. " , style: Constants.alt_metin,),

            Text("3. Üyelik veya üzerindeki çeşitli form ve anketlerin doldurulması "
                "suretiyle üyelerin kendileriyle ilgili bir takım kişisel bilgileri "
                "(ad-soyad, firma bilgileri, telefon, adres veya e-posta adresleri gibi) "
                "Wnt.com.tr sanal pazar platformumuz tarafından işin doğası gereği toplanmaktadır. " , style: Constants.alt_metin,),

            Text("4. WNT bazı dönemlerde müşterilerine ve üyelerine kampanya bilgileri,"
                " yeni ürünler hakkında bilgiler, promosyon teklifleri gönderebilir."
                " Üyelerimiz bu gibi bilgileri alıp almama konusunda her türlü seçimi üye olurken yapabilir, sonrasında "
                "üye girişi yaptıktan sonra hesap bilgileri bölümünden bu "
                "seçimi değiştirilebilir ya da kendisine gelen bilgilendirme iletisindeki linkle bildirim yapabilir. " , style: Constants.alt_metin,),

            Text("5. Wnt.com.tr sanal pazar platformumuz üzerinden veya eposta ile gerçekleştirilen onay sürecinde,"
                " üyelerimiz tarafından Wnt.com.tr sanal pazar platformumuza elektronik ortamdan "
                "iletilen kişisel bilgiler, Üyelerimiz ile"
                " yaptığımız ""Kullanıcı Sözleşmesi"""
                " ile belirlenen amaçlar ve kapsam dışında üçüncü kişilere açıklanmayacaktır. " , style: Constants.alt_metin,),

            Text("6. Sistemle ilgili sorunların tanımlanması ve verilen hizmet ile"
                " ilgili çıkabilecek sorunların veya uyuşmazlıkların hızla çözülmesi"
                " için, WNT, üyelerinin IP adresini kaydetmekte ve bunu kullanmaktadır. "
                "IP adresleri, kullanıcıları genel bir şekilde tanımlamak ve "
                "kapsamlı demografik bilgi toplamak amacıyla da kullanılabilir. ", style: Constants.alt_metin,),

            Text("7. WNT, Üyelik Sözleşmesi ile belirlenen amaçlar ve kapsam dışında da,"
                "talep edilen bilgileri kendisi veya işbirliği içinde olduğu kişiler "
                "tarafından doğrudan pazarlama yapmak amacıyla kullanabilir. "
                "Kişisel bilgiler, gerektiğinde kullanıcıyla temas kurmak için de kullanılabilir. WNT tarafından talep edilen "
                "bilgiler veya kullanıcı tarafından sağlanan bilgiler veya Wnt.com.tr sanal pazar platformumuz üzerinden yapılan "
                "işlemlerle ilgili bilgiler; WNT ve işbirliği içinde olduğu kişiler tarafından,"
                " ""Üyelik Sözleşmesi"" ile belirlenen amaçlar ve kapsam dışında da,"
            " üyelerimizin kimliği ifşa edilmeden çeşitli istatistiksel değerlendirmeler, veri tabanı oluşturma ve pazar araştırmalarında kullanılabilir. "
                "" , style: Constants.alt_metin,),

            Text("8. WNT, gizli bilgileri kesinlikle özel ve gizli tutmayı, bunu bir"
                " sır saklama yükümü olarak addetmeyi ve gizliliğin sağlanması ve sürdürülmesi, gizli"
                " bilginin tamamının veya herhangi bir kısmının kamu alanına girmesini"
                " veya yetkisiz kullanımını veya üçüncü bir kişiye ifşasını önlemek için gerekli"
                " tüm tedbirleri almayı ve gerekli özeni göstermeyi taahhüt etmektedir. " , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("KREDİ KARTI GÜVENLİĞİ" , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("1. WNT, alışveriş sitelerimizden alışveriş yapan kredi kartı sahiplerinin güvenliğini ön planda tutmaktadır. "
                "Kredi kartı bilgileri hiçbir şekilde sistemimizde saklanmamaktadır." , style: Constants.alt_metin,),


            Text("2. Üye olurken verdiğiniz tüm bilgilere sadece siz ulaşabilir ve siz değiştirebilirsiniz. " , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("İSTİSNAİ HALLER " , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("1. Aşağıda belirtilen sınırlı hallerde WNT, işbu ""Gizlilik Politikası"" hükümleri dışında kullanıcılara ait "
                "bilgileri üçüncü kişilere açıklayabilir. Bu durumlar sınırlı sayıda olmak üzere; " , style: Constants.alt_metin,),

            Text("1.a. Kanun, Cumhurbaşkanlığı Kararnamesi, "
                "Yönetmelik vb yetkili hukuki otorite tarafından çıkarılan ve"
                "yürürlülükte olan hukuk kurallarının getirdiği zorunluluklara uymak;" , style: Constants.alt_metin,),

            Text("1.b. Wnt.com.tr sanal pazar platformumuzun kullanıcılarla akdettiği"
                " ""Üyelik Sözleşmesi""'nin ve diğer sözleşmelerin gereklerini yerine getirmek "
            "ve bunları uygulamaya koymak amacıyla; " , style: Constants.alt_metin,),

            Text("1.c. Yetkili idari ve adli otorite tarafından usulüne göre yürütülen bir araştırma "
                "veya soruşturmanın yürütümü amacıyla "
                "kullanıcılarla ilgili bilgi talep edilmesi; kullanıcıların hakları veya güvenliklerini "
                "korumak için bilgi vermenin gerekli olduğu hallerdir.  " , style: Constants.alt_metin,),




          ],
        ),
      ),

    );
  }
}

class kvkk extends StatefulWidget {
  const kvkk({Key? key}) : super(key: key);

  @override
  _kvkkState createState() => _kvkkState();
}

class _kvkkState extends State<kvkk> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Text("Gizlilik ve Kişisel Verilerin Korunması Politikası" , style: Constants.baslik,),
            ),

            SizedBox(height: 20,),

            Text("6698 sayılı Kişisel Verilerin Korunması Kanunu (Kanun) kapsamında"
                " WNT Dış Ticaret ve Pazarlama A.Ş. 'nin (WNT) haiz olduğu kişisel verilerin"
                " korunması öncelikli prensiplerimizdendir. İş bu Kanun kapsamında WNT  "
                "'Veri Sorumlusu' sıfatını taşımakta olup bu minvalde kişisel verilerin işlenmesi, silinmesi, aktarılması,"
                " ilgili kişisinin aydınlatılması ve veri güvenliğinin sağlanması görevlerini yerine getirmektedir."
                " Bu yükümlülüklerini yerine getirmek amacıyla Gizlilik ve KVKK Politikasını kişisel verisi işlenen gerçek kişilerin erişimine sunmaktadır." , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1. KVK Politikasının Kapsamı ve Amacı"  , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("İş bu politika gereği kişisel verileri toplama yöntemlerini ve hukuki sebeplerini,"
                " kişisel verileri saklama sürelerini, bu kişisel verilerin hangi süreçlerde ve hangi amaçlarla kullanıldığını,"
                " kimlere ve hangi amaçla aktarılabileceğini, ilgili kişilerin kişisel verileri üzerindeki haklarının neler olduğunu"
                " ve bu hakları nasıl kullanabileceklerini, kişisel verilerin güvenliğini sağlamak amacıyla alınan teknik ve idari tedbirleri, örnek veri türlerini,"
                " resmi makamlarla kişisel veri paylaşımını, Çerez (Cookie) Kullanımı ve Yönetimi açıklamaktadır."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1.a.Kişisel Veri Toplama Yöntemleri ve Hukuki Sebepleri :"  , style: Constants.baslik,),
            SizedBox(height: 20,),

            Text("WNT kişisel verileri, Kanun madde 5 'de belirtilen; kanunlarda açıkça öngörülen hallerde; "
                "bir sözleşmenin kurulması veya ifasıyla ilgili olması kaydıyla, sözleşmenin taraflarına ait kişisel verilerin"
                " işlenmesinin gerekli olması, ilgili kişinin kendisi tarafından alenileştirilmiş olması, ilgili kişinin temel hak ve"
                " özgürlüklerine zarar vermemek kaydıyla veri sorumlusunun meşru menfaatleri için veri işlenmesinin zorunlu olması, bir hakkın tesisi,"
                " bir hakkın kullanılması veya korunması için veri işlemenin zorunlu olması, hukuki sebeplerine dayanarak internet siteleri ve bu sitelerin mobil uygulamaları,"
                " sosyal medya hesapları, çerezler, çağrı merkezi, idari ve adli makamlardan gelen tebligatlar vb  iletişim kanalları aracılığıyla toplamaktadır."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1.b.Kişisel Veri Saklama Süreleri :" , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("WNT kişisel verileri ilgili mevzuatta öngörüldüğü şekilde ve işleme amacına göre şekillenen süre boyunca Kanun ve"
                " yönetmeliklere uygun olarak saklar. "
                "İş bu verilerin saklanma ve silinme süreleri ile ilgili info@wnt.com.tr adresinden 7/24 bilgi ve destek alınabilir."
                " Çerezler yoluyla elde ettiğimiz kişisel verilerin saklama süreleri konusunda Çerez (Cookie) Politikası uygulanır."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1.c.Kişisel Verilerin Hangi İş Süreçlerinde ve Hangi Amaçlarla Kullanıldığı :" , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("Üye Müşterilerin; üyelik işlemlerinin gerçekleştirilmesi, WNT' nin sahibi olduğu Platform ve diğer e-ticaret platformları üzerinden sunulan "
                "hizmetlerin geliştirilmesi, yeni hizmetlerin sunulması ve bunlarla ilgili bilgilendirme yapılması, üyeler ile kurulan üyelik sözleşmesinin "
                "ifası için ticari elektronik ileti onayı mevcut üye müşteriler açısından ise üye müşterinin tercih, beğeni ve ihtiyaçlarının analiz edilmesi"
                " ve üye müşteriye özel tanıtım, fırsat ve fayda sağlanması, üye müşterinin açık rızası doğrultusunda yeniden pazarlama, hedefleme,"
                " profilleme ve analiz yapılarak üye müşteri’nin tercih ve beğenisi doğrultusunda uygulama, mal ve hizmetlerin tanıtımının ve pazarlamasının "
                "yapılması, üye müşteri sorun ve şikayetlerinin çözümlenmesi, üye müşteri deneyiminin iyileştirilmesi, muhasebe ve satın alma işlemlerinin "
                "takibi, hukuki süreçler ve mevzuata uyum, idari ve adli makamlardan gelen bilgi taleplerinin cevaplandırılması, bilgi ve işlem güvenliği "
                "sağlanması ve kötü amaçlı kullanımın önlenmesi, işlenen verilerin güncel ve doğru olmasının sağlanması amacıyla gerekli düzenlemelerin "
                "yapılması. Misafir Müşterilerimizin; Platformlardan “misafir” sıfatıyla alışveriş yapılabilmesi, Platformlar üzerinden sunulan hizmetlerin"
                " iyileştirilmesi, yeni hizmetlerin geliştirilmesi ve bununla ilgili bilgilendirme yapılması, ticari elektronik ileti onayı mevcut misafir "
                "müşteriler açısından; tercih, beğeni ve ihtiyaçlarının analiz edilmesi ve misafir müşteri’ye özel tanıtım, fırsat ve fayda sağlanması, misafir "
                "müşteri’nin açık rızası doğrultusunda yeniden pazarlama, hedefleme, profilleme ve analiz yapılarak misafir müşteri’nin tercih ve"
                " beğenisi doğrultusunda uygulama, mal ve hizmetlerin tanıtımının ve pazarlamasının yapılması, sorun ve şikayetlerinin çözümlenmesi,"
                " misafir müşteri deneyiminin iyileştirilmesi, muhasebe ve satın alma işlemlerinin takibi, hukuki süreçler ve mevzuata uyum, idari ve adli"
                " makamlardan gelen bilgi taleplerinin cevaplandırılması, bilgi ve işlem güvenliği sağlanması ve kötü amaçlı kullanımın önlenmesi, işlenen"
                " verilerin güncel ve doğru olmasının sağlanması amacıyla gerekli düzenlemelerin yapılması, hukuki yükümlülüklerin yerine getirilmesi. Çevrimiçi"
                " Ziyaretçilerimizin; 5651 sayılı Kanun kapsamında çevrimiçi ziyaretçi verilerinin işlenmesi, hukuki süreçler ve mevzuata uyum, idari ve adli "
                "makamlardan gelen bilgi taleplerinin cevaplandırılması, bilgi ve işlem güvenliği sağlanması ve kötü amaçlı kullanımın önlenmesi, "
                "hukuki yükümlülüklerin yerine getirilmesi. Satın Alınan Ürünün Adına Teslim Edileceği Kişilerin; Ürün teslim süreçlerinin yürütülmesi, "
                "muhasebe ve satın alma işlemlerinin takibi, hukuki süreçler ve mevzuata uyum, idari ve adli makamlardan gelen bilgi taleplerinin cevaplandırılması,"
                " bilgi ve işlem güvenliği sağlanması ve kötü amaçlı kullanımın önlenmesi, işlenen verilerin güncel ve doğru olmasının sağlanması amacıyla gerekli "
                "düzenlemelerin yapılması, hukuki yükümlülüklerin yerine getirilmesi. Satıcı/Tedarikçi/Satıcı Adayı/Satıcı veya Tedarikçi Çalışanı veya Yetkilisi Kişisel "
                "Verilerinde; Sözleşme süreçlerinin yürütülmesi, muhasebe ve satın alma işlemlerinin takibi, hukuki süreçler ve mevzuata uyum, idari ve adli makamlardan gelen"
                " bilgi taleplerinin cevaplandırılması, bilgi ve işlem güvenliği sağlanması ve kötü amaçlı kullanımın önlenmesi, "
                "işlenen verilerin güncel ve doğru olmasının sağlanması amacıyla gerekli düzenlemelerin yapılması, hukuki yükümlülüklerin yerine getirilmesi."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1.d.Örnek Veri Türleri:"  , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("Üye Müşteri'lerimizin; ad-soyadı, doğum tarihi, cinsiyet, T.C. kimlik numarası, yaşadığı şehir, ilçe, cep telefonu, e-posta adresi, adres, "
                "posta kodu, sabit telefon, vergi dairesi, fatura bilgileri, üyelik bilgisi, üyelik ID numarası, satın alınan ürünler, alışveriş tutarı, alışveriş tarihi,"
                " çağrı merkezi görüşme kayıtları, ticari iletişim izni, faydalanılan kampanyalar, kullanılan kuponlar, siparişe ilişkin bilgiler, IP adresi, şifre, parola"
                " bilgileri, çerez kayıtları, hedefleme bilgileri, alışkanlık ve beğenileri gösteren değerlendirmeler, verilen hizmetin başlama ve bitiş zamanı, yararlanılan "
                "hizmetin türü, aktarılan veri miktarı, ilgili kişinin elektronik ortamda verdiği ticari elektronik ileti izni, onay verdiği üyelik sözleşmesi,"
                " kurumsal üyelik sözleşmesi, WNT tarafından sunulan hizmetlerden faydalanılmasını sağlayan sair hukuki metinler ve sözleşmeler, ilgili kişinin verdiği "
                "ticari elektronik ileti iznine istinaden gönderilen pazarlama amaçlı sms, e-posta mesajları veya çağrı merkezi tarafından yapılan aramalar, "
                "ilgili kişinin satın almış olduğu ürün veya hizmete ilişkin web sitesi, mobil aplikasyon, sosyal medya hesapları veya çağrı merkezi üzerinden ilettiği "
                "şikayet veya talepler ile bu istemlerin değerlendirilmesi veya yönetimi sürecinde yapılan işlemlere ilişkin kayıtları. Misafir Müşteri'lerimizin;"
                " ad-soyadı, doğum tarihi, T.C. kimlik numarası, yaşadığı şehir, ilçe, cep telefonu, e-posta adresi, adres, posta kodu, sabit telefon, vergi dairesi, "
                "fatura bilgileri, satın alınan ürünler, alışveriş tutarı, alışveriş tarihi, çağrı merkezi görüşme kayıtları, ticari iletişim izni, faydalanılan kampanyalar,"
                " siparişe ilişkin bilgiler, IP adresi, şifre, parola bilgileri, çerez kayıtları, hedefleme bilgileri, alışkanlık ve beğenileri gösteren değerlendirmeler, "
                "çağrı merkezi görüşme kayıtları, verilen hizmetin başlama ve bitiş zamanı, yararlanılan hizmetin türü, aktarılan veri miktarı, ilgili Kişi’nin elektronik "
                "ortamda verdiği ticari elektronik ileti izni, WNT tarafından sunulan hizmetlerden faydalanılmasını sağlayan sair hukuki metinler ve sözleşmeler, ilgili"
                " kişinin verdiği ticari elektronik ileti iznine istinaden gönderilen pazarlama amaçlı sms, e-posta mesajları veya çağrı merkezi tarafından yapılan aramalar, "
                "ilgili kişinin satın almış olduğu ürün veya hizmete ilişkin web sitesi, mobil aplikasyon, sosyal medya hesapları veya çağrı merkezi üzerinden ilettiği şikayet"
                " ve/veya talepler ile bu istemlerin değerlendirilmesi veya yönetimi sürecinde yapılan işlemlere ilişkin kayıtları. Çevrimiçi Ziyaretçi'lerimizin; şifre,"
                "cep telefonu, parola bilgileri, IP adresi, verilen hizmetin başlama ve bitiş zamanı, yararlanılan hizmetin türü, aktarılan veri miktarı."
                " Satın Alınan Ürünün Adına Teslim Edileceği Kişi; ad- soyadı, doğum tarihi, cinsiyet, T.C. kimlik numarası, yaşadığı şehir, ilçe, cep telefonu,"
                " e-posta adresi, adres, posta kodu, sabit telefon, vergi dairesi, fatura bilgileri. Satıcı/Tedarikçi/Satıcı Adayı/Satıcı veya Tedarikçi Çalışanı "
                "veya Yetkilisi'nin;  TC Kimlik No, ad-soyadı, e-posta adresi, telefon, KEP adresi, adres, cep telefonu, hesap numarası, vergi dairesi, "
                "vergi kimlik numarası, "
                "vergi levhası, IBAN, imza sirküler, faaliyet belgesi, imza, fotoğraf."  , style: Constants.alt_metin, ),
            SizedBox(height: 20,),
            Text("1.e.Kişisel Verilerin Güvenliği İçin Alınan Teknik ve İdari Tedbirler:"  , style: Constants.baslik,),
            SizedBox(height: 20,),

            Text("WNT, kişisel verilerinizin gizliliği, bütünlüğü ve güvenliğinin sağlanması için gerekli teknik ve idari her türlü tedbiri almayı "
                "ve gerekli özeni göstermeyi taahhüt eder. WNT, kişisel verilere yetkisiz erişimi, hatalı kullanımı, kişisel verilerin hukuka aykırı"
                " olarak işlenmesini, ifşa edilmesini, değiştirilmesini veya imha edilmesini engellemek için gerekli önlemleri alır. WNT kişisel verileri"
                "işlerken güvenlik duvarları ve Güvenli Soket Katmanı (SSL) şifrelemesi gibi genel kabul görmüş güvenlik teknolojisi standartlarını kullanır."
                " Buna ek olarak, internet sitesi, mobil uygulama ve"
                " mobil sitesi aracılığıyla WNT'ye kişisel verilerinizi gönderirken, bu veriler SSL kullanılarak aktarılmaktadır."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1.f. Kişisel Verilerin Kimlere ve Hangi Amaçla Aktarılabileceği "  , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("WNT kişisel verileri yalnızca işbu Gizlilik ve Kişisel Verilerin Korunması Politikası’nda belirtilen amaçlar"
                " doğrultusunda ve Kanunu’nun 8. ve 9. maddelerine uygun olarak üçüncü kişilere aktarmaktadır. "
                "Bu kapsamda işlenen tüm kişisel verileri, satıcı ve kargo şirketi ile paylaşılmakta ve bu verilere gerektiğinde "
                "çağrı merkezi tarafından da erişilebilmektedir. Adına fatura tanzim edilecek kişi bilgisi faturanın ilgili kişiye"
                " gönderimi amacıyla kargo şirketi ile paylaşılmaktadır. Müşterilere ait cep telefonu numarası veya e-posta adresi; ticari elektronik "
                "ileti onayına istinaden alışveriş tercih, beğeni ve alışkanlıkları doğrultusunda tanıtım, reklam yapılabilmesi, fayda ve fırsat sunulabilmesi "
                "amacıyla ticari elektronik ileti aracı hizmet sağlayıcısı ile paylaşılmaktadır. Üye Müşteri/Misafir Müşteri/ Çevrimiçi Ziyaretçi,"
                " WNT kurumsal Whatsapp hattı üzerinden ulaşması halinde, Whatsapp platformunun yurt dışından sunulan bir hizmet olması dolayısıyla,"
                " kişisel verilerini yurt dışına göndermiş olacaktır bu nedenle ilgili kişi Whatsapp kullanmak yerine, WNT’nin sunduğu diğer iletişim "
                "mkanlarını kullanabilecektir. Belirttilen aktarımlara konu kişisel veriler, güvenliklerini sağlayacak teknik tedbirlerin yanı sıra; hukuki "
                "ilişkinin karşı tarafının veri sorumlusu veya veri işleyen olması dikkate alınarak sözleşmelerimizde yer verilen KVK Kanunu uyumlu hükümler"
                " sayesinde hukuki olarak da korunmaktadır. Türkiye dışındaki ülkelere kişisel bilgileri aktarırken, "
                "verilerin bu politikaya uygun olarak ve veri korumaya ilişkin uygulanacak hukukun izin verdiği şekilde aktarılması sağlanmaktadır."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1.h. Profilleme ve Segmentasyon"  , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("WNT  yukarıda belirtilen kişisel verileri kullanarak; ticari elektronik ileti alma konusunda onay veren"
                " ilgili kişiye yönelik beğeni ve tercihlerine daha uygun içerik hazırlanması, reklam, tanıtım, "
                "indirim yapılabilmesi amacıyla profilleme ve segmentasyon yapar. Eğer ilgili kişi onay vermez ise; "
                "ürün iyileştirmesi yapılması, alışveriş tercihlerinin analiz edilmesi suretiyle modellemeler yapılarak "
                "belirli bir ürünü alma potansiyeli olan müşteri gruplarına "
                "yönelik kampanyalar düzenlenmesi ve sisteme yüklenmesi, satış potansiyelinin artırılmasına yönelik "
                "aksiyonlar alınması gibi çalışmalar yapılmaktadır."  , style: Constants.alt_metin,),


            Text("1.i.İlgili Kişilerin Kişisel Verileri Üzerindeki Hakları ve Bu Hakların Kullanımı"  , style: Constants.baslik,),

            Text("WNT tarafından işlenen kişisel veriler üzerinde ilgili kişinin Kanun madde 11 uyarınca sahip olduğu haklar şu şekildedir:"
                " kişisel veri işlenip işlenmediğini öğrenme, kişisel verileri işlenmişse buna ilişkin bilgi talep etme, kişisel verilerin "
                "işlenme amacını ve bunların amacına uygun kullanılıp kullanılmadığını öğrenme, yurt içinde veya yurt dışında kişisel"
                " verilerin aktarıldığı üçüncü kişileri bilme, kişisel verilerin eksik veya yanlış işlenmiş olması hâlinde bunların düzeltilmesini "
                "isteme. Kanun 7. maddede öngörülen şartlar çerçevesinde; kişisel verilerin silinmesini veya yok edilmesini isteme, (d) ve (e) bentleri "
                "uyarınca yapılan işlemlerin, kişisel verilerin aktarıldığı üçüncü kişilere bildirilmesini isteme, işlenen verilerin münhasıran"
                " otomatik sistemler vasıtasıyla analiz edilmesi suretiyle kişinin kendisi aleyhine bir sonucun ortaya çıkmasına itiraz etme,"
                " kişisel verilerin kanuna aykırı olarak işlenmesi sebebiyle zarara uğraması hâlinde zararın giderilmesini talep etme. "
                "Kişisel verileri üzerindeki hakları kullanmak için WNT "
                "internet sitesi içindeki “Hesabım” bölümünden hesabınıza erişebilir ve gerekli değişiklikler yapılmalıdır"  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1.j.İlgili Kişiler’in Elektronik Ticari İleti Alma Konusundaki Olumlu Veya Olumsuz Tercihlerini Nasıl Değiştirebilecekleri"  , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text(" WNT’nin mülkiyetinde elektronik ticaret platformlarının web sitesi veya mobil uygulamasına üye olurken"
                " veya daha sonraki bir zamanda vermiş olduğunuz ticari elektronik ileti alma konusundaki olumlu veya olumsuz tercihler, "
                "“Hesabım” bölümünden değiştirilebilir. Üyeliğin sona erdirilmesi, ticari elektronik ileti alma konusunda verdiğiniz onayın "
                "geri alınması anlamına gelmez."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1.k.Resmi Makamlarla Kişisel Veri Paylaşımı"  , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("WNT in yasalar karşısındaki yükümlülüğünü ifa etmesi amacıyla yasal"
                " olarak bu bilgileri talep etmeye yetkili olan kamu kurum ve kuruluşları"
                " ile paylaşabilir."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("1.l.Çerez (Cookie) Kullanımı ve Yönetimi"  , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text(" WNT  tarafında kullanılan çerezler,  amaçları, saklama süreleri ve çerez yönetimi ile ilgili "
                "detaylı bilgi için Çerez (Cookie) Politikamızı inceleyebilirsiniz."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("2.Kişisel Verilerin Silinmesi, Yok Edilmesi ve Anonimleştirilmesi Şartları"  , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("WNT ilgili kanunların öngördüğü süreler veya işleme amacının gerekli kıldığı süreler boyunca saklamaktadır. Bu sürelerin sona ermesi "
                "durumunda işlenen kişisel verileri yok edecek veya anonim hale getirecektir. Kişisel verilerin silinmesi, kişisel verilerin ilgili"
                " kullanıcılar için hiçbir şekilde erişilemez ve tekrar kullanılamaz hale getirilmesi işlemini ifade eder. Kişisel verilerin yok edilmesi, "
                "kişisel verilerin hiç kimse tarafından hiçbir şekilde erişilemez, geri getirilemez ve tekrar kullanılamaz hale getirilmesi işlemini ifade eder."
                " Kişisel verilerin anonim hale getirilmesi, kişisel verilerin başka verilerle eşleştirilse dahi hiçbir surette kimliği belirli veya belirlenebilir"
                " bir gerçek kişiyle ilişkilendirilemeyecek hale getirilmesini ifade eder."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("3.Gizlilik/Kişisel Verilerin Korunması Politikası’nda Yapılacak Değişiklikler"  , style: Constants.baslik,),
            SizedBox(height: 20,),
            Text("WNT iş bu metinde her zaman değişiklik yapabilir. Bu değişiklikler yeni metnin yayınlanmasıyla birlikte derhal geçerlilik kazanır. "
                "İşbu değişikliklerden haberdar olunması için üyelere gerekli bilgilendirme yapılacaktır."  , style: Constants.alt_metin,),
            SizedBox(height: 20,),
            Text("Saygılarımızla..."  , style: Constants.baslik,),
            SizedBox(height: 50,),
          ],
        ),
      ),

    );
  }
}

class iletisim extends StatefulWidget {
  const iletisim({Key? key}) : super(key: key);

  @override
  _iletisimState createState() => _iletisimState();
}

class _iletisimState extends State<iletisim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.kPadding),
            child: Text("İletişim"),
          ),

          SizedBox(height: 20,),


          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Constants.lightblack

            ),
            child: Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Column(

                  children: [


                    Row(
                      children: [

                        Icon(Icons.phone),

                        SizedBox(width: 25,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 25,),
                            Text("Telefon"),
                            SizedBox(height: 25,),

                            Text("0530 450 02 47"),
                            SizedBox(height: 25,),
                          ],
                        ),

                      ],

                    )  ,
                    SizedBox(height: 25,),
                    Row(

                      children: [

                        Icon(Icons.mail),

                        SizedBox(width: 25,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 25,),
                            Text("Mail"),
                            SizedBox(height: 25,),
                            Text("hatayberkay1234@gmail.com"),
                            SizedBox(height: 25,),
                          ],
                        ),

                      ],

                    )


              ]),
            ),

          ),



        ],
      ),

    );
  }
}

class teslimat extends StatefulWidget {
  const teslimat({Key? key}) : super(key: key);

  @override
  _teslimatState createState() => _teslimatState();
}

class _teslimatState extends State<teslimat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.kPadding),
            child: Text("Teslimat ve İade" , style: Constants.baslik,),
          ),

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(Constants.kPadding),
            child: Column(
              children: [

                Text("Talepleriniz sipariş sonunda teslimata hazırlanmak üzere işleme alınır. "
                    "Siparişiniz onaylandıktan sonra en geç 3 (ÜÇ) iş günü sonunda kargo firmasına teslim edilir."
                    " Kargonuzun durumu siparişinizin sonucunda size verilecek kargo takip numarası ile izlenebilir."
                    " Sözleşme konusunu oluşturan ürünler SATICI’nın belirleyeceği kargo firması tarafından ALICI’ya teslim edilir."
                    " Kargo ücreti ve varsa kargo sigorta ücreti fatura bedeline eklenir. ALICI bu bedelleri ödemeyi de peşinen kabul ve taahhüt eder.", style: Constants.alt_metin,),

                Text("Ödeme işlemi yapıldıktan sonra sözleşme konusu ürünlerin  kargoların teslim etme süresi ortalama 1 gün ila 2 hafta sürmektedir." , style: Constants.alt_metin,),


                Text("SATICI Kargo ve Teslimat sırasında üründe meydana gelebilecek olan zararlardan sorumlu değildir."
                    " ALICI kendisine teslim edilen üründe bir hasar gördüğünde kargoyu kabul etmeme hakkına sahiptir. "
                    "Kargo taşıması nedeniyle üründe oluşabilecek hasarlar veya kullanım kayıpları söz konusu ise,"
                    " ALICI teslim anında teslim fişini onaylamadan önce kargo firması yetkilisinden hasar tespit tutanağı (zabıt)"
                    " tutturularak iade edilecek ürün/ürünlere ekleyerek kargo yetkilisine geri teslim etmelidir. Aksi takdirde kargo "
                    "hasarlarından kaynaklanan hasarlardan veya kullanım kayıplarından sorumluluk ALICI’nın olacaktır ve ürün iade edilemez. "
                    "SATICI tarafından üründe meydana gelen hatanın kargo ve teslimattan önce meydana gelmiş olmasının tespiti durumunda hasarlı"
                    " ürün SATICI deposuna ulaştıktan sonra ürünün değiştirilmesi ve tekrar kargoya verilmesi işlemi azami 7 iş günü sürer. "
                    "Ürünün temin edilememesinden kaynaklanan bir durum söz konusu olduğunda, SATICI, ALICI’ ya yapmış olduğu ödemeyi, "
                    "işbu sözleşmede yazan koşullarla iade edecektir." , style: Constants.alt_metin,),
                SizedBox(height: 20,),
                Text("CAYMA(İADE) HAKKI" , style: Constants.baslik,),
                SizedBox(height: 20,),
                Text(" ALICI, sözleşme konusu ürünün kendisine veya gösterdiği adresteki kişi/kuruluşa tesliminden itibaren (7) gün içinde cayma hakkına sahiptir."
                    " Cayma hakkının kullanılması için bu süre içinde satıcı magazaya’a faks, email veya telefon ile"
                    " bildirimde bulunulması ve ürünün ilgili madde hükümleri çerçevesinde kullanılmamış olması şarttır. "
                    "Bu hakkın kullanılması halinde, 3. kişiye veya ALICI'ya teslim edilen ürünün satıcı magazaya'a gönderildiğine ilişkin kargo teslim "
                    "tutanağı örneği ile fatura aslının iadesi zorunludur. Bu belgelerin ulaşmasını takip eden 7 gün içinde ürün bedeli ALICI' ya iade edilir. "
                    "Fatura aslı gönderilmez ise KDV ve varsa sair yasal yükümlülükler iade edilemez. Cayma hakkı nedeni ile iade edilen ürünün kargo bedeli ALICI"
                    " tarafından karşılanır." , style: Constants.alt_metin,),

                Text("Niteliği itibari ile iade edilemeyecek ürünler, tek kullanımlık ürünler, kopyalanabilir yazılım ve programlar, hızlı bozulan"
                    " veya son kullanım tarihi geçen ürünler için cayma hakkı kullanılamaz. Her türlü yazılım ve programlar, sarf malzemeleri "
                    "(Çizgi taşı, İşaret Kalemi v. b) "
                    "ve cayma hakkının kullanılması, ürünün ambalajının açılmamış, bozulmamış ve ürünün kullanılmamış olması şartına bağlıdır." , style: Constants.alt_metin,),

                Text("Ayrıca, tüketicinin özel istek ve talepleri uyarınca üretilen veya üzerinde değişiklik ya da"
                    " ilaveler yapılarak kişiye özel hale getirilen mallarda tüketici cayma hakkını kullanamaz." , style: Constants.alt_metin,),

                Text("Ödemenin kredi kartı veya benzeri bir ödeme kartı ile yapılması halinde tüketici, kartın kendi rızası dışında ve "
                    "hukuka aykırı biçimde kullanıldığı gerekçesiyle ödeme işleminin iptal edilmesini talep edebilir. "
                    "Bu halde, kartı çıkaran kuruluş itirazın kendisine bildirilmesinden itibaren 10 gün içinde ödeme tutarını tüketiciye iade eder." , style: Constants.alt_metin,),

                Text("Gerekli  Durumlarda  alıcı  mağaza (satıcı) ulaşamaması durumunda www.wnt.com.tr ile iletişime geçerek  gerekli destek alabilir." , style: Constants.alt_metin,),

              ],

            ),
          ),



        ],
      ),

    );
  }
}

class sik_sorulanlar extends StatefulWidget {
  const sik_sorulanlar({Key? key}) : super(key: key);

  @override
  _sik_sorulanlarState createState() => _sik_sorulanlarState();
}

class _sik_sorulanlarState extends State<sik_sorulanlar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.kPadding),
            child: Text("Sık Sorulan Sorular"),
          ),

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(Constants.kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text("Siparişimin ne zaman kargolanacağını nereden görebilirim?" , style: Constants.baslik,),
                SizedBox(height: 20,),

                Text("Ürün detay sayfasında yer alan “Sipariş Takibi” alanından ürünün en geç ne zaman kargoya verileceği bilgisini görebilir, "
                    "ürünü satın aldıktan sonra Sipariş detaylarını ve kargo durumunu sipariş detayları bölümünden görüntüleyebilirsiniz.", style: Constants.alt_metin,),
                SizedBox(height: 20,),
                Text("Kargom gecikti, ne yapabilirim? " , style: Constants.baslik,),
                SizedBox(height: 20,),
                Text("Bizi Arayın." , style: Constants.alt_metin,),
                SizedBox(height: 20,),
                Text("Siparişimi nasıl iptal edebilirim?" , style: Constants.baslik,),
                SizedBox(height: 20,),
                Text("Siparişlerim sayfasından İptal Et butonuna tıklayarak siparişinizi iptal edebilirsiniz." , style: Constants.alt_metin,),
                SizedBox(height: 20,),
                Text("Aldığım ürün kargoya verildi fakat siparişimi iptal etmek istiyorum. Ne yapmam gerekiyor?" , style: Constants.baslik,),
                SizedBox(height: 20,),
                Text("Ürün kargoya verildiği için iade sürecini başlatmanız gerekiyor. Siparişlerim sayfasından İptal Et butonuna"
                    " tıklayın ve “Ürünü teslim almadan kargo görevlisine iade ettim” seçeneğini işaretleyin." , style: Constants.alt_metin,),
                SizedBox(height: 20,),
                Text("Elime geçen ürün kusurlu, ne yapmam gerekiyor?" , style: Constants.baslik,),
                SizedBox(height: 20,),
                Text("Wnt.com.tr üzerinden almış olduğunuz kusurlu/ayıplı  ürünlerin iadesini kullanıcı panelinizden iade  "
                    "talimatı oluşturarak anlaşmalı kargo firmalarımızla ilgili tedarikçiye iadesini gerçekleştirebilirsiniz."
                    " Tedarikçilerimiz den kaynaklı yanlış beden ,yanlış renk, farklı ürün vb gönderiler nedeniyle yaşanan "
                    "aksaklıktan dolayı öncelikle özür dileriz. Belirtmiş olduğunuz ürün tedarikçi firma stoklarında bulunduğu takdirde,"
                    " derhal değişim yapılacak ve yeni ürün tarafınıza gönderilecektir, talep edilen ürünün tedarikçilerimizin stoklarında "
                    "bulunmaması durumunda siparişiniz iptal edilip ücret iadesin iade prosedürümüz çerçevesinde ilgili bankanıza ücret iadeniz "
                    "yapılacaktır. Çeşitli dönemler yapacağımız kampanyalı ürünlerde oluşabilecek iade durumlarında, ürünler stoklarla sınırlı ürünler "
                    "olmasından dolayı ilgili kampanyalardan almış olduğunuz ürün/ürünlerin tedarikçi firma stoklarında olmaması durumunda siparişiniz "
                    "iptal edilerek para iadesi işlemi gerçekleştirilecektir.  Wnt.com.tr üzerinden yapmış olduğunuz alışverişler de yaşayabileceğiniz "
                    "bir olumsuzluk olması durumunda   (0212) 244 44 60  yada 0850 305 98 17 "
                    "numaralı  Müşteri Hizmetlerini arayabilir veya iletişim bölümünden e-posta ile temasa geçerek destek talebinde bulunabilirsiniz." , style: Constants.alt_metin,),
                SizedBox(height: 20,),
                Text("Kapıda ödeme yapabiliyor muyum?" , style: Constants.baslik,),
                SizedBox(height: 20,),
                Text("Hayır" , style: Constants.alt_metin,),

              ],

            ),
          ),



        ],
      ),

    );
  }
}

class uyelik_sozlesmesi extends StatefulWidget {
  const uyelik_sozlesmesi({Key? key}) : super(key: key);

  @override
  _uyelik_sozlesmesiState createState() => _uyelik_sozlesmesiState();
}

class _uyelik_sozlesmesiState extends State<uyelik_sozlesmesi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.kPadding),
            child: Text("Üyelik Sözleşmesi"),
          ),

          SizedBox(height: 20,),

          Column(
            children: [




          ],),



        ],
      ),

    );
  }
}

class yasakli_urunler extends StatefulWidget {
  const yasakli_urunler({Key? key}) : super(key: key);

  @override
  _yasakli_urunlerState createState() => _yasakli_urunlerState();
}

class _yasakli_urunlerState extends State<yasakli_urunler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(Constants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Text("Yasaklı Ürünler" , style: Constants.baslik,),
            ),

            SizedBox(height: 20,),

            Text("Satılmaya Uygun Olmayan Ürünler" , style: Constants.baslik,),

            Text("1. Yasaklı Ürünler Listesi" , style: Constants.baslik,),

            Text("Yasadışı Ürünler" ),

            Text("Çalıntı mallar"),
            Text("Kaçak ve ithalatı yasak ürünler"),
            Text("Sahte para ve belgeler"),
            Text("Web ortamında saldırma ve program kırma yazılımları"),
            Text("Şifreli yayın çözücüler"),
            Text("İlaç testlerini geçmeye yönelik yardımcı maddeler"),
            Text("Yasaklı kitap ve yayınlar"),
            Text("İnsan sağlığına zararlı ürünler"),
            Text("Uyuşturucu maddeler"),
            Text("Alkollü içecekler"),
            Text("Tütün mamulleri, elektronik sigaralar ve elektronik sigaraların tamamlayıcı parçaları"),
            Text("İlaçlar, tıbbi cihazlar ve diğer benzeri sağlık ürünleri"),
            Text("Reçeteli ve reçetesiz ilaçlar, geleneksel bitkisel tıbbi ürünler, homeopatik tıbbi ürünler,"
                " enteral beslenme ürünleri, özel tıbbi amaçlı diyet gıdalar, özel tıbbi amaçlı bebek mamaları"),
            Text("İşitme cihazı merkezlerinde, ısmarlama protez ve ortez merkezlerinde,  optisyenlik müesseselerinde veya "
                "diş protez laboratuvarlarında satışı, uyarlaması veya uygulaması yapılan cihazlar ve b) Münhasıran sağlık "
                "profesyonelleri tarafından kullanılması veya uygulanması öngörülen ya da tıbbi cihaz satış merkezlerinde "
                "uygulama gerektiren cihazlar (bu cihazlar haricinde kalan cihazlar kapsamına girmeyen tıbbi cihazların internet"
                " ortamında satışı yetkilendirilen satış merkezlerince yapılabilir. Diş macunu, diş protez bakım ürünleri, kondom, hasta altı bezi, "
                "inkontinans pedi, topikal uygulanan sıcak soğuk kompres, yara bandı, "
                "flaster, pamuk, ağız çalkalama suyu, nefes açıcı burun bantlarının internet ortamında satışında ise yetkilendirilme şartı aranmaz). "),
          Text("Numaralı gözlük camları ve numaralı lensler"),
            Text("İşitme cihazları, ortopedik protez ve ortezleri"),
            Text("Veteriner tıbbi ürünler"),
            Text("Sağlık Bakanlığı tarafından satışı yasaklanmış ürünler (Türkiye İlaç ve Tıbbi Cihaz Kurumu’ndan izin alınmaksızın sağlık "
                "beyanıyla satışa sunulan ürünler, zayıflama hapları, etken madde içeren ürünler, yasak cinsel ilaçlar vb.)"),
            Text("Silahlar, patlayıcı maddeler ve tehlike arz eden diğer ürünler"),
            Text("Ateşli silahlar"),
            Text("Kama, hançer, saldırma, şişli baston, sustalı çakı, pala, kılıç, kasatura, süngü, sivri uçlu ve "
                "oluklu bıçaklar, topuz, topuzlu kamçı, boğma teli veya zinciri,"
                " muşta ile salt saldırı ve savunmada kullanılmak üzere özel nitelikteki benzeri aletler"),

            Text("Yanıcı ve patlayıcı maddeler" , style: Constants.baslik,),
            Text("Biber gazı"),
            Text("Elektroşok cihazları"),
            Text("PCB (poliklorlu bifeniller) ve bunu içeren ürünler"),
            Text("Amonyum Nitrat ve kütlece %28’den daha fazla amonyum nitrattan gelen azot içeren gübreler"),
            Text("Kanun ve mevzuat kapsamında satışı (veya internet üzerinden satışı) yasak veya denetime tabi olan ürünler"),
            Text("Alım-satımı devlet iznine tabi olan ürünler"),
            Text("Telsizler (Kısa Mesafe Erişimli Telsiz (KET) Cihazları Hakkında Yönetmelik kapsamında kalan"
                " kısa mesafe erişimli alçak güçlü telsiz cihaz ve sistemler hariç"),
            Text("Askeri teçhizat"),
            Text("Resmi kıyafetler ve üniformalar"),
            Text("Radar dedektörleri"),
            Text("Airbag ve ekipmanları"),
            Text("Emniyet kemeri adaptörü"),
            Text("Taşıtların yönetim sistemine müdahale amacıyla kullanılan cihaz ve teçhizat"),
            Text("Maymuncuk ve kilit açıcılar"),
            Text("Şans oyunları biletleri"),
            Text("Sertifikasız tohumlar"),
            Text("Kültür ve tabiat varlıkları"),
            Text("Madalya ve nişanlar"),
            Text("Kişisel verilere ilişkin kuralları ihlal eder nitelikteki ürünler"),
            Text("Sitemiz  üzerinden satışı yasak olan diğer ürünler"),
            Text("Mucizevi tedavi ürün veya hizmetleri, falcılık ve büyücülük ve sair hizmetler"),
            Text("Yönlendirme içeriği olan ürün ilanları"),
            Text("İkinci el ürünler"),
            Text("Ürün özelliği taşımayan satışlar"),
            Text("Diğer kurum, kuruluş ve e-ticaret platformlarına ait hediye çeki ya da indirim kuponları"),
            Text("Deneme Boyu / numune (tester) ve kutusuz veya teşhir ürünü olan parfüm ve sair kozmetik ürünleri"),
            Text("Hisse senedi, tahvil, bono"),
            Text("Pornografik içerikli malzemeler"),
            Text("Casus kamera ve dinleme cihazları"),
            Text("Canlı hayvanlar"),
            Text("Tüm Liste Sağlık Bakanlığı üzerinden kontrol edilebilir." , style: Constants.baslik,),
          ],
        ),
      ),

    );
  }
}



