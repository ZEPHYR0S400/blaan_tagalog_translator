import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Dictionary entries
  final List<DictionaryEntry> _entries = [
    DictionaryEntry(
      word: 'Afdata',
      translation: 'Paibabaw',
      definition:
          'tumutukoy sa pag-unawa o pagkilala na hindi tumatagos sa tunay na esensya o kalagayan, at hindi nagpapakita ng malalim na aspeto o diwa.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Afgule',
      translation: 'Pagaling',
      definition:
          'proseso o estado ng pagbuti o pagbabalik sa normal na kalusugan ng katawan o isipan mula sa karamdaman o pinsala.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Afkarew',
      translation: 'Paiyakin',
      definition:
          ' Pagpapalabas ng luha sa isang tao sa pamamagitan ng pagdulot ng kalungkutan, sakit, o matinding emosyon..',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Aflingo',
      translation: 'Pakitang-tao',
      definition:
          'pagkukunwari, pagbabalat kayo. ang ugaling pakitang tao ay malalantad din. ',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Afmite',
      translation: 'Pakita',
      definition:
          ' Palabas, iksibit,panoorin. Ang pakita sa pelikula ay nakaeengganyo na panoorin',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Afngalam',
      translation: 'Pailalim',
      definition:
          'sa paraang lihim at hindi hayag, nang walang kaalaman o pahintulot ng iba, upang itago ang gawain o balak.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Aftabo',
      translation: 'Pagpapatubo',
      definition:
          'proseso ng pag-aalaga at pagpapaunlad ng halaman mula sa buto hanggang sa ito ay lumaki at mamunga.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Aftaku',
      translation: 'Pakawalan',
      definition:
          'ang pagbibigay kalayaan sa isang tao, hayop, o bagay mula sa pagkakagapos, pagkakahawla, o anumang pumipigil sa malayang paggalaw.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Aftud',
      translation: 'Pahinga',
      definition:
          'panahon o sandali ng pagtigil sa mga gawain o trabaho, upang magkaroon ng katahimikan, magpahingalay, at maalis ang pagod o stress.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Aftunda',
      translation: 'Pahatid',
      definition:
          'isang proseso ng pagpapadala ng mensahe, impormasyon, o bagay mula sa isang tao patungo sa itinakdang lugar o taong pag-aabutan nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Akfandas',
      translation: 'Pagsasakit',
      definition:
          'ang kalagayan ng pagtitiis o pag-aalay ng sarili sa kabila ng pisikal o emosyonal na hirap upang makamit ang layunin o para sa kapakanan ng iba.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Akfule',
      translation: 'Pagsasauli',
      definition:
          'proseso ng pagbabalik o pagpapanumbalik ng isang bagay sa orihinal nitong kalagayan, may-ari, o nawala o nasirang katayuan, porma, o posisyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Aksaye',
      translation: 'Pag ibig',
      definition:
          'isang malalim at masidhing damdamin ng kagustuhan at emosyonal na koneksyon sa tao, lugar, o bagay, na may kaakibat na pagnanais na makapiling, mag-alaga, at magsakripisyo.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Alfo',
      translation: 'Niyog',
      definition:
          'isang tropikal na puno na may mahabang tangkay at malalapad na dahon, kilala sa bunga nitong may matigas na balat, malambot na laman, at tubig, ginagamit sa ibat ibang paraan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Alo',
      translation: 'Daloy',
      definition:
          'ang tuluy-tuloy o unti-unting paggalaw ng likido, gas, o iba pang bagay sa isang direksyon, karaniwang patungo sa mas malaking anyong tubig o lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ambal',
      translation: 'Paalam',
      definition:
          'isang pahayag na ginagamit sa paghihiwalay o pagtatapos ng pag-uusap, umaalis, o nagpapahiwatig ng pansamantalang o pangmatagalang paglisan sa tao, lugar, o pangyayari.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Amngifi',
      translation: 'Nipis',
      definition:
          'katangian ng pagkakaroon ng maliit na kapal o sukat, karaniwang nagpapahiwatig ng pagiging manipis at kakulangan sa kapal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amse',
      translation: 'Bigas',
      definition:
          'Giniling na butil ng palay. Mahalin ang bigas dahil bawat butil nito ay pinaghirapan ng magsasaka.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amtek',
      translation: 'Bangon',
      definition:
          'pagkilos mula sa pagkakahiga patungo sa pagtayo o pag-upo bilang tugon sa pangangailangan o pag-alis sa posisyon ng paghiga.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Anbu',
      translation: 'Operasyon',
      definition:
          'isang serye ng mga hakbang o gawain, kasama ang paggamit ng makina, kagamitan, at tauhan, para makamit ang tiyak na layunin o resulta sa medisina, negosyo, o militar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ani',
      translation: 'Ngayon',
      definition:
          'ang punto sa oras o araw na ito; tumutukoy sa kasalukuyang panahon o sa panahong ito.',
      partOfSpeech: 'Pangngalan / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Aswila',
      translation: 'Paaralan',
      definition:
          ' isang institusyon kung saan ginagabayan ang mga kabataan at mag-aaral ng mga guro upang matuto ng ibat ibang asignatura, kaalaman, kasanayan, at mabuting asal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Baltik',
      translation: 'Mabilis',
      definition:
          'mabilis ay ang kakayahan o sitwasyon kung saan ang isang tao ay hindi mabagal, maliksi kumilos at natatapos niya ang kanyang mga gawain sa mas maagang oras. ',
      partOfSpeech: 'Pangngalan / Pang-uri / Panghalip',
    ),
    DictionaryEntry(
      word: 'Banwe',
      translation: 'Mundo',
      definition:
          'Sangkalupaan,daigdig,sandaigdigan,sansinukuban. Ang mundo ay kailangan nating pangalagaan. ',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bawe',
      translation: 'Mukha',
      definition:
          'Bahagi ng katawan na kinalalagyan ng bibig, ilong,mata, atbp.Ang mukha ni Corazon ay hugis puso. ',
      partOfSpeech: 'Pangngalan / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Baya',
      translation: 'Pabayaan',
      definition:
          ' hayaang magpatuloy ang isang bagay o sitwasyon nang walang pagkilos, pagpansin, o kalinga, na nagpapakita ng kakulangan sa responsibilidad at maaaring magresulta sa hindi magandang kalabasan.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Bleng',
      translation: 'Pagitan',
      definition:
          'ang espasyo o panahon na namamagitan sa dalawang bagay, lugar, o pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bli',
      translation: 'Paa',
      definition:
          'bahagi ng katawan na ginagamit sa paglakad at pagtayo, at tumutukoy din sa bakas na naiiwan sa lupa o sahig matapos maglakad.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bu',
      translation: 'Opera',
      definition:
          'isang sining na pagtatanghal kung saan ang mga kwento ay ipinapahayag sa pamamagitan ng pag-awit at musika kasama ang pagsasayaw at pag-arte sa isang entablado.',
    ),
    DictionaryEntry(
      word: 'Dagit',
      translation: 'Ngalan',
      definition:
          'kataga o salita para sa pagkilala, pagtukoy, o tawag sa pagkakakilanlan ng tao, lugar, bagay, o pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dalmeh',
      translation: 'Ngiti',
      definition:
          ' kataga o salita para sa pagkilala, pagtukoy, o tawag sa pagkakakilanlan ng tao, lugar, bagay, o pangyayari. ',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Di dungan',
      translation: 'Pababa',
      definition:
          'tumutukoy sa kilos, direksyon, o galaw patungo sa mas mababang lugar, antas, o sa bandang ilalim.',
      partOfSpeech: 'pang-uri / pang-abay',
    ),
    DictionaryEntry(
      word: 'Diye',
      translation: 'Nariyan',
      definition:
          'nagpapahiwatig ng pagkakaroon o pagkakalagay sa isang tiyak na lugar o posisyon.',
      partOfSpeech: 'pang-abay',
    ),
    DictionaryEntry(
      word: 'Dotu',
      translation: 'Naroon',
      definition:
          'isang salitang tumutukoy sa lokasyon o pagkakaroon ng isang bagay o tao sa isang lugar na hindi kalapit o agarang katabi.',
      partOfSpeech: 'pandiwa',
    ),
    DictionaryEntry(
      word: 'Duh',
      translation: 'Ngunit',
      definition:
          'isang pangatnig na ginagamit para ipahiwatig ang pagkakaiba, pagkontra, o di-pagsang-ayon sa naunang pahayag o sitwasyon.',
      partOfSpeech: 'Pangatnig',
    ),
    DictionaryEntry(
      word: 'Ee',
      translation: 'Opo',
      definition:
          ' isang pormal na tugon na nagpapakita ng pagsang-ayon at paggalang, lalo na sa mga nakatatanda at awtoridad, na nagpapahiwatig ng pagsunod o pagtanggap.',
      partOfSpeech: 'pang-abay',
    ),
    DictionaryEntry(
      word: 'Fagbet',
      translation: 'Pakupya',
      definition:
          'tandang ginagamit sa pagsulat na inilalagay sa ibabaw ng patinig upang ipahiwatig ang biglaang paghinto ng boses at diin sa huling pantig ng salita.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fag tilew',
      translation: 'Pagsubok',
      definition:
          'isang sitwasyon, gawain, o proseso na susukat sa kakayahan, tibay ng loob, pag-unawa, o kalidad ng isang bagay upang matukoy ang kahusayan o pagiging epektibo nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Falad',
      translation: 'Pagaw',
      definition:
          'ang kilos ng biglaang pagkuha o pagkontrol sa isang tao o bagay nang hindi kusang-loob o malayang naibigay.',
      partOfSpeech: 'Pang-uri / Pangngalan',
    ),
    DictionaryEntry(
      word: 'Falninge',
      translation: 'Pakinggan',
      definition:
          'bigyang pansin ang sinasabi, tunog, o payo ng iba; makinig at tumugon nang may layon.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Famlinge',
      translation: 'Pakinig',
      definition:
          'ang kakayahan at proseso ng pagtanggap, pagsusuri, at pag-unawa sa mga tunog o salita mula sa kapaligiran o kausap upang makabuo ng kahulugan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fan',
      translation: 'Pain',
      definition:
          'isang bagay o paraan na ginagamit upang akitin, tuksuhin, o iligaw ang isang hayop o tao patungo sa bitag o panganib bilang bahagi ng paghuli o paghikayat dito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fan gasam',
      translation: 'Paksiw',
      definition:
          'isang lutuin na niluto sa suka, bawang, asin, paminta, at iba pang pampalasa, na maaaring may kasamang gulay o karne, na nagbibigay ng asim at linamnam.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fangbon',
      translation: 'Pabango',
      definition:
          'likidong ginagamit sa katawan o damit, gawa sa bulaklak, halaman, o ibang sangkap, upang magbigay ng kaaya-ayang amoy.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fanyalu',
      translation: 'Pakiramdam',
      definition:
          'ang tugon o karanasan ng isip o katawan ng isang tao sa ibat ibang sitwasyon, bagay, o pangyayari, na may kaugnayan sa pisikal o emosyonal na estado.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Feet',
      translation: 'Pait',
      definition:
          'ang sensasyon o lasa na hindi kaaya-aya sa dila, karaniwang resulta ng pagtikim ng mga bagay na hindi matamis o maasim, na nagdudulot ng pag-ngiwi.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'File',
      translation: 'Pahiga',
      definition:
          'sa posisyon o paraang ang katawan ay nakadapa, nakatihaya, o ang buong likod ay nakasayad sa ibabaw tulad ng kama o sahig, karaniwang habang nagpapahinga.',
      partOfSpeech: 'Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Flingo',
      translation: 'Pakunwari',
      definition:
          'ang pagiging hindi totoo o tunay sa ipinapakita, sinasabi, o ginagawa, at kawalan ng katapatan sa nararamdaman o iniisip.',
      partOfSpeech: 'Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Fuleh',
      translation: 'Muli',
      definition:
          'isang salita na ginagamit upang ipahayag ang pag-uulit o pagpapatuloy ng isang gawain, sitwasyon, o pagbabalik sa isang bagay na naganap na dati.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Fuket',
      translation: 'Pabalat',
      definition:
          'panlabas na bahagi o materyal na ginagamit bilang proteksyon o dekorasyon sa nilalaman ng isang bagay, tulad ng libro, pakete, pagkain, o regalo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gami',
      translation: 'Namin',
      definition:
          'tumutukoy sa pag-aari o gawain na ginawa o pagmamay-ari ng nagsasalita kasama ang hindi bababa sa isa pang tao sa grupo.',
      partOfSpeech: 'Panghalip',
    ),
    DictionaryEntry(
      word: 'Gamu',
      translation: 'Ninyo',
      definition:
          'panghalip panao sa pangmaramihang anyo ng ikalawang panauhan na ginagamit bilang pamalit sa pangalan ng kausap, lalo na sa pagpapahayag ng pag-aari, aksyon, o katangian.',
      partOfSpeech: 'Panghalip',
    ),
    DictionaryEntry(
      word: 'Gito',
      translation: 'Natin',
      definition:
          'panghalip na tumutukoy sa pag-aari o pagkilos ng grupo ng nagsasalita kasama ang kausap, hindi kasama ang kinakausap lamang.',
      partOfSpeech: 'Panghalip',
    ),
    DictionaryEntry(
      word: 'Gumifu',
      translation: 'Pahiran',
      definition:
          'ang paglalagay o pag-aaplay ng materyal tulad ng pintura o mantika sa ibabaw ng isang bagay upang takpan, protektahan, o palamutihan ito.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Kabtas',
      translation: 'Pahalagahan',
      definition:
          ' ibigay ang nararapat na importansya, kilalanin ang kahalagahan ng isang tao, bagay, o pangyayari, at tratuhin ito nang may paggalang at pag-aalaga.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Kafdana',
      translation: 'Pakumbaba',
      definition:
          'hindi mayabang o mapagmataas, nagpapakita ng totoong kababaan ng loob at hindi itinuturing ang sarili na mas mahalaga kaysa iba.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kafleet',
      translation: 'Pagtagal',
      definition:
          'sa paglipas o dulo ng isang tiyak na panahon, kalaunan, o habang tumatagal ang oras.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kanen',
      translation: 'Niya',
      definition:
          'tumutukoy sa pagmamay-ari, tagaganap, o paksa ng isang hindi tinukoy na tao, hayop, o bagay sa pangungusap.',
      partOfSpeech: 'Panghalip',
    ),
    DictionaryEntry(
      word: 'Kanfulong',
      translation: 'Pagsasanay',
      definition:
          'proseso ng paghahanda at pagpapahusay ng kakayahan sa pamamagitan ng paulit-ulit na aktibidad upang maging bihasa sa isang larangan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kanleb',
      translation: 'Ngatngat',
      definition:
          ' ang pagkilos ng paggamit ng ngipin upang putulin, durugin, o paulit-ulit na lapatan ang isang bagay, karaniwan sa pagkain, upang ito ay maliitin o mahati.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kastifun',
      translation: 'Okasyon',
      definition:
          'isang espesyal na kaganapan o panahon na ipinagdiriwang dahil sa mahalagang araw o pangyayari, na may partikular na kahalagahan sa isang tao o grupo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kifan',
      translation: 'Ngipin',
      definition:
          'matigas na kalipunan ng maliliit na buto sa loob ng bibig, nakakabit sa panga, ginagamit sa pagnguya ng pagkain at mahalaga sa pagsasalita.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kifu',
      translation: 'Ngitngit',
      definition:
          'matinding galit o inis na nararamdaman dahil sa labis na pagkadismaya o pagkagalit sa isang sitwasyon o tao, na may sobrang intensidad ng emosyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Knaye man',
      translation: 'Opinyon',
      definition:
          'paniniwala o pahayag ng isang tao tungkol sa isang paksa, na maaaring hindi nakabatay sa katotohanan, at maaring mag-iba batay sa karanasan at damdamin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Laflal',
      translation: 'Ngalangala',
      definition:
          'bahagi ng itaas na loob ng bibig na nagsisilbing daanan ng pagkain at hangin patungo sa lalamunan, at lugar kung saan nararamdaman ang lasa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Langi',
      translation: 'Noo',
      definition:
          'bahagi ng mukha na nasa itaas ng mga mata at nasa ilalim ng buhok, at lugar kung saan madalas pinapawisan kapag mainit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mayeh',
      translation: 'Nood',
      definition:
          'ang gawain ng pagtutok, pagtingin, at pag-unawa sa palabas, pelikula, o nilalaman sa screen para sa libangan o edukasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mlungay',
      translation: 'Pagod',
      definition:
          'pakiramdam ng sobrang kapaguran at kakulangan sa enerhiya mula sa labis na pisikal o mental na gawain, na humahantong sa kawalan ng kakayahang magpatuloy.',
      partOfSpeech: 'Pang-uri / Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mugod',
      translation: 'Ngawit',
      definition:
          'pakiramdam ng pangangalay o hindi kumportableng pagod sa mga paa, binti, o iba pang bahagi ng katawan dahil sa matagalang pagtayo o paggamit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mugud',
      translation: 'Ngalay',
      definition:
          'pakiramdam ng pagkapagod, kakulangan ng lakas, o hindi maigalaw ang bahagi ng katawan dulot ng matagal na pagkakapuwesto, sobrang paggamit, o pagod.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mukat',
      translation: 'Mulat',
      definition:
          'may kaalaman at pag-unawa sa mga bagay dahil sa edukasyon, pagsasanay, at gising sa katotohanan o realidad ng paligid.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Munan',
      translation: 'Noon',
      definition:
          'sa oras o panahong lumipas na at mga sandaling nagdaan, bago ang kasalukuyan.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Ne en',
      translation: 'Nasaan',
      definition:
          'tanong ukol sa eksaktong lugar o pook kung saan matatagpuan ang isang bagay o tao.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Nga libon',
      translation: 'Neneng',
      definition:
          'Katawagan sa magdadalagang babae. Si neneng ay hindi na bata pero hindi padin dalaga. ',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sanang',
      translation: 'Nunal',
      definition:
          'isang likas, maliit, at madilim na marka sa balat na may ibat ibang laki, hugis, at kulay, karaniwang mula pagkapanganak.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sanfa',
      translation: 'Nguya',
      definition:
          'proseso o aksyon ng paggamit ng ngipin at bibig upang durugin o hatiin ang pagkain sa mas maliliit na piraso bilang paghahanda sa paglunok.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tnako',
      translation: 'Nakaw',
      definition:
          'ang pagkuha ng bagay nang walang pahintulot mula sa may-ari, na hindi naibalik o ibinigay ng kusa ng taong nanghiram o kumuha.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tunda',
      translation: 'Paghatid',
      definition:
          'ang proseso o kilos ng pagdala o paglipat ng bagay o mensahe mula sa isang lugar patungo sa pinag-uukulan nito',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tutuk',
      translation: 'Pako',
      definition:
          'isang maliit, matulis na metal na ginagamit sa pagkabit, pagtatayo, o pagkukumpuni ng mga bagay sa pamamagitan ng paghampas ng martilyo upang maipasok sa kahoy o iba pang materyales.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Yaan Toh',
      translation: 'Nobya',
      definition:
          'babaeng kasintahan na may romantikong relasyon o ikakasal na sa isang lalaki.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ye',
      translation: 'Nanay',
      definition:
          'ang babaeng nagbigay buhay, nag-aalaga, sumusuporta, at nagmamahal sa kanyang anak at pamilya nang walang kondisyon mula pagkabata hanggang paglaki.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Banwe',
      translation: 'Lugar',
      definition:
          'isang espasyo, pook, o rehiyon na may tiyak na heograpikal na katangian o pagkakakilanlan kung saan may partikular na pangyayari, bagay, o tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mutab',
      translation: 'Bulong',
      definition:
          'isang mahinang pagbigkas o pagsasalita ng salita sa mababang tono, karaniwang malapit sa tainga ng ibang tao, na hindi madaling marinig ng iba.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bulong',
      translation: 'Lunas',
      definition:
          'paraan, gamot, o solusyon na ginagamit sa pagpapagaling ng sakit, karamdaman, o sa pagresolba ng problema o isyu.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Banwe',
      translation: 'Lungga',
      definition:
          'isang butas o kweba sa lupa o ibang estruktura kung saan maaaring manirahan o magtago ang mga hayop bilang tirahan o kanlungan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mlidu',
      translation: 'Lungkot',
      definition:
          'ang damdamin ng kabigatan sa kalooban at hindi pagiging masaya, bunga ng hindi kanais-nais na pangyayari, kalungkutan, o pagkabigo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Saif',
      translation: 'Lunod',
      definition:
          'ang kalagayan ng hindi makahinga o kakulangan ng oxygen dahil sa pagpasok ng tubig sa mga daanan ng hangin habang nasa ilalim ng tubig.',
    ),
    DictionaryEntry(
      word: 'Afloh',
      translation: 'Lunok',
      definition:
          'pagkilos o mabilis na pagpasok ng pagkain o inumin mula sa bibig papunta sa tiyan sa pamamagitan ng paggalaw ng lalamunan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tana',
      translation: 'Lupa',
      definition:
          'ang ibabaw ng mundo na pinagtatayuan ng istruktura at pinagmumulan ng mga halaman, at lugar na may kultura at posibleng sakop ng pamahalaan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fnildi',
      translation: 'Lupig',
      definition:
          'ang kalagayan ng pagkatalo at pagkakaroon ng ganap na tagumpay ng iba, nangangahulugang nasa ilalim ng kanilang kapangyarihan o kontrol matapos ang labanan o tunggalian.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amno',
      translation: 'Lusaw',
      definition:
          'ang proseso ng pagiging likido mula sa solidong estado dahil sa init o ang pagkawala ng katatagan sa pamamagitan ng paghalo sa ibang likido.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fmusok',
      translation: 'Lusob',
      definition:
          'ang pag-atake o pagsugod nang sapilitan sa isang lugar o posisyon ng kalaban na may layuning sakupin o kontrolin ito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lamtaw',
      translation: 'Lutang',
      definition:
          'ang kalagayan ng pagiging nasa ibabaw ng likido o tubig nang hindi lumulubog at gumagalaw nang walang tiyak na direksyon.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tagah',
      translation: 'Luto',
      definition:
          'sining at proseso ng paghahanda ng pagkain gamit ang init o apoy upang itoy maging masarap at ligtas kainin sa ibat ibang paraan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tayk flafus',
      translation: 'Maaga',
      definition: 'bago o nauna sa takdang oras o inaasahang pagkakataon.',
      partOfSpeech: 'Pang-uri / pang-abay',
    ),
    DictionaryEntry(
      word: 'Agmare',
      translation: 'Maalam',
      definition:
          'nakababatid at may malawak na kaalaman o impormasyon tungkol sa ibat ibang paksa, marunong, at may pag-unawa sa maraming bagay.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Amlifo',
      translation: 'Maapoy',
      definition:
          'tumutukoy sa katangian o damdamin na naglalagablab o sumisiklab dahil sa init, liwanag, o sigla na kahawig ng apoy, tulad ng galit o pag-ibig.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Too Kamdoh',
      translation: 'Maawain',
      definition:
          'handang magpatawad, hindi mabilis magalit, at nagpapakita ng labis na kabutihan at pag-unawa sa kapwa, lalo na sa panahon ng pagkakamali o kapighatian.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Amdana',
      translation: 'Mababa',
      definition:
          'hindi mataas; nasa ibabang antas o posisyon, o tumutukoy sa tunog na malalim at hindi mataas ang tono.',
      partOfSpeech: 'pangngalan /Pang-uri',
    ),
    DictionaryEntry(
      word: 'Leet',
      translation: 'Mabagal',
      definition:
          'hindi mabilis ang pag-usad, kilos, o pagtupad, at tumatagal ng mahabang panahon bago matapos o makarating sa patutunguhan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Few balo',
      translation: 'Mabait',
      definition:
          'may magandang asal at ugali, handang tumulong nang walang hinihinging kapalit sa pakikitungo sa kapwa.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Too labe',
      translation: 'Mabangis',
      definition:
          'tumutukoy sa pagiging malupit, marahas, at may kakayahang magdulot ng takot o pinsala, karaniwang nagpapakita ng labis na kahayupan o kalupitan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Few bon',
      translation: 'Mabango',
      definition:
          'nag-aanyaya at nagpapahiwatig ng kaaya-ayang halimuyak na kalugod-lugod at magandang samyo sa pang-amoy.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Salay',
      translation: 'Mag asawa',
      definition:
          'ang proseso ng pagpili ng kapareha para makasama sa buhay, bumuo ng pamilya, at pumasok sa sagradong kasunduan ng pag-ibig at pagtutulungan.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Sando',
      translation: 'Maghapon',
      definition:
          'sa buong araw, mula pagbubukang-liwayway hanggang paglubog ng araw o mula umaga hanggang gabi.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Faglut',
      translation: 'Maginoo',
      definition:
          'isang lalaking marangal, matapat, may mabuting asal, dignidad, kagalang-galang, at respeto sa kapwa sa lahat ng pagkakataon.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Man fileh',
      translation: 'Magkano',
      definition:
          'tanong upang alamin ang halaga o presyo ng isang bagay o serbisyo na nais bilhin o bayaran.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Atmaku',
      translation: 'Magnanakaw',
      definition:
          'isang tao na kumukuha o umangkin ng mga bagay na hindi sa kanya nang walang pahintulot, maaaring sa pamamagitan ng pagpasok sa mga bahay o establisyemento.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dad tua',
      translation: 'Magulang',
      definition:
          'taong responsable sa pag-aalaga at pagpapalaki ng anak, at may karanasan at kaalaman sa ibat ibang sitwasyon sa buhay.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kando',
      translation: 'Mahal',
      definition:
          'isang tao, bagay, o damdamin na napakahalaga, pinapahalagahan ng lubos, at nagpapakita ng mataas na pagtingin o presyo.',
      partOfSpeech: 'Pangngalan / Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Agwe',
      translation: 'Makamit',
      definition:
          'ang pagkakaroon o pag-abot sa isang bagay, layunin, estado, o kondisyon sa pamamagitan ng pagsisikap, pagpupunyagi, o pagkilos.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Sukaf',
      translation: 'Makitid',
      definition:
          'hindi malawak o sapat ang sukat at kapasidad mula sa isang gilid patungo sa kabilang gilid; may limitasyon sa dami o saklaw.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Mageng',
      translation: 'Makunat',
      definition:
          'tumutukoy sa pagkain na may katigasan o kakapalang texture, na nangangailangan ng mas matagal na oras sa pagnguya bago malunok.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Mlikat',
      translation: 'Malagkit',
      definition:
          'tumutukoy sa katangian ng pagiging lapot at hirap tanggalin kapag dumikit o kumakapit sa ibang bagay.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Gare',
      translation: 'Malaman',
      definition:
          'makakuha ng impormasyon o kaalaman at magkaroon ng kamalayan sa isang katotohanan o pangyayari.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Kantaen',
      translation: 'Malikmata',
      definition:
          'isang ilusyon o pagkakamali ng paningin na nagdudulot ng maling pagkaunawa sa nakikita, kung saan ang di-totoo ay tila totoo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ye / Mamang',
      translation: 'Mama',
      definition:
          'pangkalahatang tawag o di-pormal na termino para sa isang hindi kilalang lalaki o lalaking estranghero.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Karang',
      translation: 'Mamaya',
      definition:
          'hindi agad-agad, ngunit sa ilang sandali o oras mula ngayon, pagkatapos ng maikling panahon.',
      partOfSpeech: 'Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Bong ye',
      translation: 'Manang',
      definition:
          'babae na nakakatanda sa kanyang mga kapatid o ate na tinatawag bilang paggalang sa isang babaeng mas matanda.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mabeh',
      translation: 'Maneho',
      definition:
          'ang pagkontrol at pagpapatakbo ng sasakyan gamit ang manibela, pedals, at iba pang kagamitan upang lumipat sa nais na destinasyon.',
    ),
    DictionaryEntry(
      word: 'Mulong',
      translation: 'Manggagamot',
      definition:
          'propesyonal sa medisina na may lisensya sa diagnosing, paggamot, at pag-iwas sa sakit, gamit ang siyensya at sining ng pagpapagaling para sa kalusugan ng tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lande kdu',
      translation: 'Manhid',
      definition:
          'hindi nakararamdam o walang reaksyon sa pisikal na pandama at emosyonal na karanasan, kulang sa damdamin sa mga pangyayaring dapat may epekto sa isip o puso.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fasnawang',
      translation: 'Manipulahin',
      definition:
          'gumamit ng paraan para kontrolin o baguhin ang isang bagay, sitwasyon, o pag-uugali, sa hindi halata o lihim na paraan, upang makamit ang nais na layunin.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Miye/ maye',
      translation: 'Manood',
      definition:
          'ang paggugol ng oras sa pagtutok o pagbibigay pansin sa palabas, pelikula, programa, o pangyayari gamit ang mata para sa aliw, impormasyon, o edukasyon.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Using',
      translation: 'Mantsa',
      definition:
          'marka o simbolo na naiiwan sa isang bagay o reputasyon ng tao matapos itong madumihan, mabahiran, o magkaroon ng negatibong kahulugan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Feet',
      translation: 'Mapait',
      definition:
          'lasa na hindi kaaya-aya at salungat sa tamis, kalimitang nagdudulot ng hindi komportableng pakiramdam sa dila, tulad ng ampalaya, at nag-iiwan ng hindi kanais-nais na sensasyon sa bibig.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Bukay',
      translation: 'Maputi',
      definition:
          'kulay na katulad ng gatas, niyebe, o hindi madilim at malapit sa kulay ng araw.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Amganag',
      translation: 'Marahan',
      definition:
          'sa paraang hindi mabilis o biglaan, nagpapakita ng pagmamalasakit, kahinahunan, at pag-iingat upang di magdulot ng sakit o discomfort.',
      partOfSpeech: 'Pang-uri / pang-abay',
    ),
    DictionaryEntry(
      word: 'Tungan',
      translation: 'Marami',
      definition:
          'paglalarawan sa kalagayan kung saan ang bilang o sukat ng bagay, tao, o pangyayari ay higit sa isa, karaniwan, o inaasahan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Se aldam',
      translation: 'Madamot',
      definition:
          'hindi bukas-palad at ayaw magbahagi o ipahiram ng anuman, kahit sa mga nangangailangan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Bak bak',
      translation: 'Martilyo',
      definition:
          'isang kasangkapan na may matigas na ulo at mahabang hawakan, ginagamit sa pagpukpok, pagpako, pagtanggal ng pako, o paghubog ng metal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Magsik',
      translation: 'Marumi',
      definition:
          'hindi malinis, puno ng dumi, hindi kaaya-aya sa paningin, o naglalaman ng hindi angkop o bastos na mga bagay o pahayag.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fulong',
      translation: 'Marunong',
      definition:
          'may kakayahan at malalim na kaalaman o kasanayan sa pag-unawa o paggawa ng isang bagay nang mahusay sa tiyak na larangan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Lumak',
      translation: 'Marupok',
      definition:
          'madaling masira o mabali, hindi matibay, at hindi matatag ang loob o madaling magpaimpluwensya.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tamdok',
      translation: 'Masakit',
      definition:
          'nagdudulot ng di kaaya-ayang sensasyon at hirap, pisikal man o emosyonal, bunga ng sugat, karamdaman, o matinding damdamin.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tase',
      translation: 'Masama',
      definition:
          'makasali o maging bahagi ng isang gawain, grupo, pangkat, o pangyayari.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Few nem',
      translation: 'Masarap',
      definition:
          'nagbibigay ng kasiyahan sa panlasa at kaaya-aya sa dila; nakalulugod dahil sa magandang kalidad o katangian nito.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Lahew',
      translation: 'Masaya',
      definition:
          'nagpapahayag ng damdamin ng kagalakan, kontento, at sigla, na may pagpapahayag ng positibong emosyon.',
      partOfSpeech: 'Pang-uri / pang-abay',
    ),
    DictionaryEntry(
      word: 'Malgad',
      translation: 'Masipag',
      definition:
          'taong patuloy na nagpupunyagi sa trabaho o pag-aaral, hindi umaatras sa hamon, at nagpapakita ng sipag at tiyaga upang makamit ang mga layunin.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Se balu',
      translation: 'Masungit',
      definition:
          'hindi magiliw at madaling magalit; mahigpit at seryoso sa pagkilos, na nagpapahiwatig ng kawalan ng pasensya at pagiging hindi bukas sa iba.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Amdata',
      translation: 'Mataas',
      definition:
          'nangangahulugang higit sa karaniwang sukat o antas paitaas at nagpapakita ng mas nakatataas na posisyon o kalagayan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Mabo',
      translation: 'Mataba',
      definition:
          'may malaking sukat o dami ng taba sa katawan, higit sa normal na laki dahil sa sobrang laman o taba.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Ande nem',
      translation: 'Matabang',
      definition:
          'walang lasa, hindi masarap, o kulang sa pampalasa at asim, kayat hindi kaaya-aya sa dila.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Leet',
      translation: 'Matagal',
      definition:
          'tumutukoy sa paglipas ng mahabang panahon bago maganap o matapos ang isang bagay, o kapag ang pangyayari ay lumampas sa karaniwang inaasahang tagal.',
      partOfSpeech: 'Pang-uri / pang-abay',
    ),
    DictionaryEntry(
      word: 'Fitam',
      translation: 'Maitim',
      definition:
          'kulay na katulad ng gabi o uling, hindi maputi at malapit sa pinakamadilim na tono.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Atyan',
      translation: 'Matakaw',
      definition:
          'taong labis ang pagnanais sa pagkain o iba pang bagay, hindi nakokontento sa sapat na dami at higit sa kinakailangan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Gamban',
      translation: 'Matalas',
      definition:
          'may kakayahang bumutas o maghiwa nang madali at mabilis, tumpak sa pag-unawa o paglutas ng mga problema dahil sa hindi mapurol na gilid o talino.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Agmare',
      translation: 'Matalino',
      definition:
          'nagpapakita ng kakayahang matuto, umunawa, at magdesisyon batay sa lohika at kaalaman sa mabilis at epektibong paraan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Atmabe / Mabu',
      translation: 'Matambok',
      definition:
          'tumutukoy sa pagiging bilugan at nakausli ng hugis o anyo ng isang bagay o bahagi ng katawan, na kapansin-pansin ang paglobo o pag-umbok.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Mi',
      translation: 'Matamis',
      definition:
          'lasa na hindi maalat o maasim, karaniwang mula sa asukal o pulot; pagkaing panghimagas na nagdudulot ng kasiyahan dahil sa tamis.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Mlungay nawa',
      translation: 'Matamlay',
      definition:
          'kulang sa sigla, lakas, o enerhiya; nakakaramdam ng pagod, hindi masigla, masigabo, o maliksi.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fadnoh',
      translation: 'Matampuhin',
      definition:
          'madaling masaktan at agad na nagtatampo sa mga biro, puna, o sa kaunting hindi pagkakaintindihan, sensitibo kahit sa hindi sinasadyang mga gawa o salita.',
    ),
    DictionaryEntry(
      word: 'Tua',
      translation: 'Matanda',
      definition:
          'isang tao na may malaking bilang ng edad o isang bagay/konsepto na mula pa sa nakaraang panahon.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Taha',
      translation: 'Matangos',
      definition:
          'tumutukoy sa isang bagay na mahaba, tulis, at may pahabang anyo na may matalim o tuktok na dulo.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Labe',
      translation: 'Matapang',
      definition:
          'hindi nagpapatinag sa panganib o kahirapan, may lakas ng loob harapin ang hamon at hindi madaling sumuko o matakot.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Ambagal',
      translation: 'Matatag',
      definition:
          'hindi nagbabago o natitinag at may kakayahang manatiling buo, hindi madaling mabuwal o masira sa kabila ng mga pagsubok o kahirapan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Mageng',
      translation: 'Matatag',
      definition:
          'hindi madaling yumuko, masira, o palambutin dahil sa kakulangan ng lambot at tumutukoy sa pagiging matatag o hindi agad sumusuko.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Nun',
      translation: 'May',
      definition:
          'nagpapahiwatig ng pagkakaroon, pagmamay-ari, o pag-iral ng isang bagay, katangian, pangyayari, o sitwasyon.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Karang',
      translation: 'Maya',
      definition:
          'isang maliit na ibong karaniwang itim at puti, kilala sa pagiging karaniwan sa urban at rural na lugar, at sa pagkanta lalo na sa umaga habang naghahanap ng pagkain sa lupa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fagyag',
      translation: 'Mayabang',
      definition:
          'taong labis na ipinagmamalaki ang sarili o kayamanan sa nakakaabala o nakakainis na paraan, kahit walang sapat na dahilan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amlabong',
      translation: 'Mayabong',
      definition:
          'tumutukoy sa pagiging sagana, masigla, at makapal ng halaman o lugar, pati na rin sa estado ng pagiging puno ng buhay at kulay luntian.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fon',
      translation: 'May ari',
      definition:
          'indibidwal na legal na nagtataglay at may buong karapatan at kapangyarihan sa paggamit, pagbenta, o pagpapamahala ng isang bagay, lugar, o negosyo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Non',
      translation: 'Mayroon',
      definition:
          'nagsasaad ng pag-aari, pagtataglay, o presensya ng isang tao, bagay, katangian, o kondisyon.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Tamdok',
      translation: 'Masakit',
      definition:
          'nagdudulot ng di kaaya-ayang sensasyon at hirap, pisikal man o emosyonal, bunga ng sugat, karamdaman, o matinding damdamin.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Dad bulong / Bulong',
      translation: 'Medisina',
      definition:
          'substansya o gamot para sa paggamot, pag-iwas sa sakit, o anumang bagay na nagdudulot ng lunas sa pisikal, mental, o emosyonal na karamdaman.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Atnikeng',
      translation: 'Milagro',
      definition:
          'isang hindi maipaliwanag na pangyayari o kaganapan na itinuturing gawa ng makapangyarihang pwersa o Diyos, nagdudulot ng malaking pagbabago, kagalingan, pag-asa, at inspirasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Libon non yaan',
      translation: 'Misis',
      definition:
          'babaeng ikinasal sa lalaki at may legal na kasunduan sa pagitan nila bilang asawa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lagi non yaan',
      translation: 'Mister',
      definition:
          'lalaking ikinasal at may legal na pagkakakilanlan bilang asawa, may responsibilidad at tungkulin sa kanyang pamilya bilang haligi ng tahanan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tmarag',
      translation: 'Kinatawan',
      definition:
          'isang tao na itinalaga o napili para kumatawan at magsalita sa ngalan ng iba o isang grupo sa ibat ibang pagpupulong, usapin, o sa pamahalaan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kanmet',
      translation: 'Kindat',
      definition:
          'isang mabilis na pagpikit ng isa sa dalawang mata bilang senyas o para ipahiwatig ang biro, lihim, o pagkakaintindihan nang hindi nagsasalita.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'mlaneb',
      translation: 'Kinis',
      definition:
          'katangian ng pagiging makinis, walang gaspang o depekto, at may pulidong kalidad na nagpapakita ng kaaya-ayang hitsura at tekstura.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'tamdok',
      translation: 'Kirot',
      definition:
          'isang biglaan, matindi, at matalim na sakit na pabugsu-bugso at tila ba tinutusok o kinukurot sa ibat ibang bahagi ng katawan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Muraf',
      translation: 'Kislap',
      definition:
          'maliwanag at makinang na liwanag na saglit lang tumatagal at nakakakuha ng pansin sa pamamagitan ng pag-reflect nito ng liwanag.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gite',
      translation: 'Kita',
      definition:
          'ipinapahayag ang taong kausap bilang tumatanggap o paksa sa sinasabi, ginagamit sa konteksto ng pagbibigay, pagtanggap, o pagpapahayag ng damdamin.',
      partOfSpeech: 'Pandiwa / Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Glabat',
      translation: 'Klaro',
      definition:
          'madaling maunawaan o makita, diretso at hindi komplikado ang pagpapahayag, walang harang o pagkalabo.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Do / Deg',
      translation: 'ko',
      definition:
          'panghalip na ginagamit upang tukuyin ang sarili o ipahayag ang pag-aari o koneksyon ng nagsasalita sa isang bagay, ideya, o tao.',
      partOfSpeech: 'Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Snakay',
      translation: 'Kotse',
      definition:
          'isang sasakyan na may apat na gulong at de motor, ginagamit sa paglalakbay sa kalsada para magdala ng isa o higit pang tao para sa ibat ibang layunin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Flirong',
      translation: 'Kubli',
      definition:
          'hindi madaling makita o mahalata at nakatago mula sa paningin o kaalaman ng nakararami; lihim.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Anwe',
      translation: 'Kuha',
      definition:
          'pagtanggap o pag-aari ng isang bagay mula sa iba, o ang proseso ng pagrekord ng larawan o video gamit ang kamera.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'klunget',
      translation: 'Kulangot',
      definition:
          'matigas o malambot na butil ng dumi sa ilong na nabubuo mula sa alikabok, mikrobyo, at iba pang partikulo sa uhog, karaniwang tinatanggal gamit ang daliri.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fatdok / Abnaog',
      translation: 'Kulata',
      definition:
          'bahagi ng baril na hinahawakan at isinandal sa balikat habang pinapaputok, at ito ang dulo na kabaligtaran ng pinanggagalingan ng bala.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kmarok',
      translation: 'Kulo',
      definition:
          'ang proseso o kalagayan ng pag-init ng likido hanggang sa paglitaw ng mga bula sa ibabaw dahil sa mataas na temperatura.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Blanggo',
      translation: 'Kulong',
      definition:
          'nasa loob ng isang limitadong espasyo, napapalibutan ng matataas na bakod o harang, at hindi makagalaw o makalabas nang malaya.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kumot',
      translation: 'Kumot',
      definition:
          'isang piraso ng manipis o makapal na tela na ginagamit upang takpan at painitin ang katawan, nagbibigay ginhawa at proteksyon laban sa lamig habang natutulog o nagpapahinga.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Smalig',
      translation: 'Kumpiyansa',
      definition:
          'ang matibay na paniniwala at tiwala sa sariling kakayahan, desisyon, at sa iba, na walang pag-aalinlangan o takot sa kahinatnan ng mga aksyon.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kuh',
      translation: 'Kung',
      definition:
          'pangatnig na ginagamit sa pagtukoy ng kondisyon o posibilidad, hindi para magtanong, at nagsisilbi sa pagpapahayag ng mga hindi tiyak na sitwasyon.',
    ),
    DictionaryEntry(
      word: 'Flingo',
      translation: 'Kunwari',
      definition:
          'ginagamit para ipahiwatig ang pagpapanggap o pag-aakalang totoo ng isang bagay o sitwasyon kahit hindi ito aktwal na nangyayari.',
      partOfSpeech: 'Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Muraf',
      translation: 'Kurap',
      definition:
          'mabilis na sandaling pagsara at pagbukas ng isa o parehong mata bilang tugon, senyales ng pagod, o paraan ng komunikasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Se aldam',
      translation: 'Kuripot',
      definition:
          'hindi bukas-palad sa paggastos o pagbabahagi ng pera at ari-arian, madalas ay pinipili ang pinakamatipid na paraan sa paggastos at pagbibigay.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Da',
      translation: 'Kusa',
      definition:
          'pagkilos o pagpili na nagmumula sa sariling desisyon o nais, at nangyayari nang walang utos o tulong mula sa iba, hindi dahil sa sapilitan.',
      partOfSpeech: 'Pangngalan / Pang-uri/ Pang-abay',
    ),
    DictionaryEntry(
      word: 'Nures',
      translation: 'Kuskos',
      definition:
          'isang pagkilos na ginagamitan ng pisikal na pwersa at paulit-ulit na paggalaw gamit ang kamay o kasangkapan sa ibabaw ng isang bagay upang linisin o alisin ang dumi.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Knusang',
      translation: 'Kusot',
      definition:
          'hindi maayos at puno ng gusot o likaw na tela o papel, na nagmumukhang bagong gising dahil sa pagkakalukot o di maingat na paghawak.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kulit',
      translation: 'Kutis',
      definition:
          'ito ang panlabas na sapin ng katawan na nagpoprotekta sa mga organo sa loob, at ang natural na kulay at kondisyon nito ay batayan ng kagandahan at kalusugan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fandam',
      translation: 'Kutob',
      definition:
          'isang malakas na pakiramdam o hinuha tungkol sa hinaharap o isang sitwasyon na walang malinaw na batayan ngunit may malaking epekto sa isipan at damdamin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Salirut',
      translation: 'Kutsara',
      definition:
          'isang kasangkapan sa pagkain o paghahanda nito, may bilog na hugis at mahabang hawakan, ginagamit sa pagkuha o paglipat ng likido o malalambot na pagkain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bansong',
      translation: 'Kutsilyo',
      definition:
          'isang pangunahing kasangkapan sa kusina, yari sa metal, na may matulis na talim para sa paghihiwa at pagtatadtad ng pagkain tulad ng karne at gulay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Twage lagi',
      translation: 'Kuya',
      definition:
          'tawag sa lalaking mas matanda, itinuturing na kapatid o pinapakitaan ng respeto at pagmamahal, dahil sa pagmamalasakit at pagiging gabay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amfok',
      translation: 'Laba',
      definition:
          'gawain ng paglinis ng mga damit, kurtina, at iba pang tela sa pamamagitan ng pagkuskos o paghuhugas gamit ang sabon at tubig upang tanggalin ang dumi at mantsa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Matu',
      translation: 'Laban',
      definition:
          'isang pagtutunggali, paligsahan, o pagsisikap na may layuning mapagtagumpayan ang isang hamon, adversidad, o kalaban, kung saan may dalawa o higit pang panig.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Malwa',
      translation: 'Labas',
      definition:
          'isang utos o sigaw na nangangahulugang kailangang umalis o lisanin ng isang tao o hayop ang kasalukuyang kinaroroonan.',
    ),
    DictionaryEntry(
      word: 'Tooh',
      translation: 'Labis',
      definition:
          'higit sa kinakailangan, sukat, o antas at lumalampas sa normal o inaasahang limitasyon; sobra.',
      partOfSpeech: 'Pangngalan / Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Ftu',
      translation: 'Laga',
      definition:
          'isang uri ng kagamitan sa pagluluto na karaniwang yari sa metal at ginagamit sa pagpapainit o pagpakulo ng tubig at iba pang likido.',
    ),
    DictionaryEntry(
      word: 'Magsu',
      translation: 'Lagas',
      definition:
          'tumutukoy sa kalagayan ng pagkalas o pagkahulog mula sa pinagmulan, karaniwan dahil sa natural na proseso tulad ng pagtanda, paglanta, o pagtuyo.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Ka',
      translation: 'Lagay',
      definition:
          'kalagayan o posisyon ng isang bagay o sitwasyon; o halaga/bagay na ibinibigay bilang suhol para sa isang layunin o pusta.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Taloh',
      translation: 'Lagi',
      definition:
          'sa lahat ng pagkakataon o sa bawat oras, nangyayari o ginagawa nang walang tigil, patid, o pagkukulang.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Amduf',
      translation: 'Lagnat',
      definition:
          'isang kondisyong medikal kung saan tumaas ang temperatura ng katawan higit sa normal, bilang tugon sa impeksyon o ibang sakit, na nagpapakita ng paglaban ng katawan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tatek',
      translation: 'Laglag',
      definition:
          'tumutukoy sa pag-alis o pagbagsak ng isang bagay o tao mula sa orihinal na posisyon, kasama ang hindi na paghawak o pagkasali sa naunang kalagayan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Ankam',
      translation: 'Lagyan',
      definition:
          'tumutukoy sa paglalagay o pag-aabot ng isang bagay, pera, o halaga sa loob, ibabaw, o sa isang tao bilang kapalit ng serbisyo o pabor.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Agbet',
      translation: 'Lahok',
      definition:
          'isang bagay o sangkap na idinadagdag sa pagkain upang mapabuti ang lasa o hitsura, o kahit ano na isinasali sa paligsahan o kompetisyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Takfatim',
      translation: 'Lagot',
      definition:
          'tumutukoy sa pagkaputol o pagkasira na nagreresulta sa problema, o nasa alanganing sitwasyon na maaaring magdulot ng kapahamakan o kagalitan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Akgis',
      translation: 'Lakas',
      definition:
          'kakayahan ng isang tao na magpatupad ng pisikal o mental na gawain nang may kahusayan, o ang antas ng tunog o intensidad na naririnig.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Magu',
      translation: 'Lakad',
      definition:
          'ang paggalaw o pagtungo sa isang lugar gamit ang mga paa para sa ibat ibang layunin, tulad ng pagbisita, pagtuklas, o pagsasagawa ng gawain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kree',
      translation: 'Lahat',
      definition:
          'tumutukoy sa kabuuan na kinabibilangan ng bawat isa o bagay sa isang grupo, walang pinalalampas o naiiwan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Bong',
      translation: 'Laki',
      definition:
          'ang sukat, dimensyon, o kapasidad na nagpapakita ng pagiging mas malaki, malawak, o marami kumpara sa karaniwan o inaasahan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fanali',
      translation: 'Lala',
      definition:
          'ang kalagayan o katangian ng pagiging mahigpit o seryoso sa antas, kalubhaan, o bigat ng isang sitwasyon, kondisyon, o karamdaman.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Gumka',
      translation: 'Lalagyan',
      definition:
          'isang kagamitan na ginagamit sa pag-iimbak o pagtatago ng ibat ibang uri ng mga bagay, likido, o solido para sa pansamantala o pangmatagalang layunin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lagi',
      translation: 'Lalaki',
      definition:
          'isang indibidwal na may katangiang biolohikal at panlipunang kinikilala bilang kasapi ng kasarian na kabaligtaran ng babae at may kakayahang mag-ama sa aspetong reproduktibo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Abkakong',
      translation: 'Lalamunan',
      definition:
          'bahagi ng katawan na nagsisilbing daanan ng pagkain at inumin mula sa bibig papunta sa tiyan, at nag-uugnay sa bibig at sikmura.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Narong',
      translation: 'Lamayan',
      definition:
          'isang tradisyonal na seremonya o pagtitipon bilang paggalang at pag-alala sa yumaong mahal sa buhay, kung saan magkakasama ang mga pamilya, kaibigan, at nakikiramay upang magdasal, magbigay suporta, at magbahagi ng alaala.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fatlaweng',
      translation: 'Lambitin',
      definition:
          'isang paraan ng pagkakabit o pagbitin gamit ang kamay o paa sa bagay na mas mataas, tulad ng sanga o baras, bilang ehersisyo o laro, nakaangat sa lupa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lumak',
      translation: 'Lambot',
      definition:
          'katangian ng pagiging madaling iakma sa ibat ibang hugis at pagiging malambing o makinis na nagdudulot ng kaaya-ayang pandama.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kamol',
      translation: 'Lamon',
      definition:
          'ang sobra-sobra at walang prenong pagkain hanggang sa maramdaman ang matinding kabigatan o busog, kadalasan ay pagpapakasasa sa pagkain.',
      partOfSpeech: 'Pangngalan',
    ),

    DictionaryEntry(
      word: 'Frayen',
      translation: 'Landi',
      definition:
          'pag-uugali o pagpapakita ng interes sa isang tao sa pamamagitan ng espesyal na atensyon, kilos, o pagsasalita na may halong pambobola o pagpapacute upang makaakit o magpa-impress.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Gulam',
      translation: 'Langgam',
      definition:
          'isang maliit na insekto na may anim na paa, karaniwang itim o pula, kilala sa pagbuo ng kolonya, mahusay sa paghahanap ng pagkain at pagdala ng mabibigat na bagay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mabal',
      translation: 'Lapad',
      definition:
          'ang sukat o kalawakan mula sa isang gilid patungo sa kabilang gilid, na sumasaklaw sa kabuuang puwang ng isang bagay sa isang direksyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fwasa',
      translation: 'Lapag',
      definition:
          'ibabaw ng lupa o sahig na maaaring pagtayuan, paglakaran, o paglagyan ng mga bagay; pinakamababang bahagi ng gusali na kaagad naabot mula sa labas.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bankeh',
      translation: 'Lapastangan',
      definition:
          'nagpapakita ng kawalan ng respeto sa mga bagay o tao na itinuturing na sagrado, umaalipusta sa kanilang dignidad.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tularan',
      translation: 'Larawan',
      definition:
          'isang biswal na representasyon ng hitsura ng tao, lugar, o bagay, na nilikha sa pamamagitan ng pagguhit, pagpinta, o pagkuha ng litrato.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sagwas',
      translation: 'Laro',
      definition:
          'isang libangan o paligsahan na may mga tuntunin, kinapapalooban ng pisikal o isipang pagsasanay, na naglalayong magbigay-aliw o magpalakas ng katawan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nem',
      translation: 'Lasang',
      definition:
          'ang katangian ng pagkain o inumin na nakikilala at nararanasan sa dila sa pamamagitan ng pagtikim o pag-inom.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fannem',
      translation: 'Lasap',
      definition:
          'ang karanasan o pagkilala sa kaaya-aya o hindi kaaya-ayang katangian ng isang bagay o sitwasyon sa pamamagitan ng pandama ng dila o pakiramdam.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Langal',
      translation: 'Lasing',
      definition:
          'kalagayan ng sobrang pag-inom ng alak, na nagdudulot ng hindi maayos na pag-iisip, pagkilos, at pagsasalita.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'kiloh',
      translation: 'Lason',
      definition:
          'isang mapanganib na substansya o kemikal na nakakapinsala sa kalusugan o kapakanan, maaaring magdulot ng sakit o kamatayan kapag napasok sa sistema.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lanaw',
      translation: 'Lawa',
      definition:
          'isang anyong tubig na hindi umaagos at napapaligiran ng lupa, mas maliit kaysa sa dagat, at maaaring mag-iba sa laki at lalim, tahanan ng ibat ibang isda, halaman, at hayop.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'tatongh',
      translation: 'Lata',
      definition:
          'isang uri ng magaang at manipis na metal na sisidlan, karaniwang ginagamit sa pag-iimbak ng pagkain, inumin, at iba pang gamit sa bahay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Flasa',
      translation: 'Latag',
      definition:
          'isang manipis na sapin o bagay na ginagamit upang takpan, protektahan, o bigyan ng bagong anyo ang ibabaw ng isang lugar o bagay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kabal',
      translation: 'Lawak',
      definition:
          'sukat, dimensyon, o distansya ng isang lugar o bagay na nagpapakita ng laki, dami, o kabuuang sakop nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ibal',
      translation: 'Laway',
      definition:
          'likidong nasa loob ng bibig na lumalabas kapag natutulog o kumakain, at tumutulong sa pagtunaw ng pagkain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mili',
      translation: 'Layas',
      definition:
          'taong mahilig sa paglalakbay at pagtuklas ng ibat ibang lugar, at may ugali rin ng pag-iwas o pagtakas mula sa tahanan o responsibilidad.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Gu kambang',
      translation: 'Libingan',
      definition:
          'lugar o pook kung saan inililibing o pinaglalagakan ng mga labi o abo ng mga namayapa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gulalah',
      translation: 'Libangan',
      definition:
          'isang gawain na pampalipas oras, nagbibigay-aliw, kasiyahan, at relaksasyon, hindi esensyal sa kabuhayan ngunit mahalaga para sa personal na kaginhawaan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lalah',
      translation: 'Libang',
      definition:
          'isang aktibidad o gawain na nagbibigay aliw, saya, at sigla ng damdamin, pansamantalang nakakalimutan ang mga problema at nag-aalis ng pagkabagot.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mlibot',
      translation: 'Libot',
      definition:
          'ang kabuuang espasyo o kapaligiran na nakapalibot sa isang punto, bagay, o lokasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Glifet',
      translation: 'Limot',
      definition:
          'hindi na naaalala o naiisip dahil sa paglipas ng panahon at wala na sa gunita o memorya.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Amtio',
      translation: 'Linaw',
      definition:
          ' ang katangian ng pagiging madaling maunawaan o makita na walang sagabal o pagkalito, nagpapahintulot ng malinaw na pagtanggap ng impormasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Linol',
      translation: 'Lindol',
      definition:
          'isang natural na pangyayari na nagdudulot ng biglaang pagyanig o pag-uga sa ibabaw ng lupa sanhi ng paglipat ng mga plato sa ilalim, na maaaring magresulta sa pagkasira ng estruktura.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bingey',
      translation: 'Lingon',
      definition:
          'ang kilos ng pagtingin sa likuran o pagbabalik-tanaw sa nangyari sa nakaraan habang nagpapatuloy sa paglalakad o pag-usad.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lahew',
      translation: 'Ligaya',
      definition:
          'ang kalagayan o pakiramdam ng malalim na kasiyahan at kagalakan na nararanasan dahil sa magagandang pangyayari o karanasan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fulong',
      translation: 'Lider',
      definition:
          'taong namumuno sa grupo, organisasyon, o samahan, na may kakayahang magbigay ng direksyon, inspirasyon, at gabay upang maabot ang layunin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lahew',
      translation: 'Ligaya',
      definition:
          'ang kalagayan o pakiramdam ng malalim na kasiyahan at kagalakan na nararanasan dahil sa magagandang pangyayari o karanasan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mligaw',
      translation: 'Ligaw',
      definition:
          'hindi maamo, malayang gumagala nang walang tiyak na direksyon, tahanan, o hindi makahanap ng daan pabalik sa pinanggalingan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Adjoh',
      translation: 'Ligo',
      definition:
          'ang proseso ng paglilinis ng katawan gamit ang tubig at sabon sa banyo upang alisin ang dumi, pawis, at mikrobyo para sa kalinisan at preskong pakiramdam.ang proseso ng paglilinis ng katawan gamit ang tubig at sabon sa banyo upang alisin ang dumi, pawis, at mikrobyo para sa kalinisan at preskong pakiramdam.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Galwa',
      translation: 'Ligtas',
      definition:
          'nakaligtas o hindi nahaharap sa panganib, banta, at kapahamakan, at samakatuwid ay nasa kalagayang walang anumang panganib.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fantifas',
      translation: 'Ligpit',
      definition:
          'ang proseso ng pag-aayos at pag-alis ng kalat upang magkaroon ng maayos at tamang pagkakahanay ng mga bagay sa paligid.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tukek',
      translation: 'Liit',
      definition:
          'ang kalagayan o katangian ng pagiging maliit sa sukat o kawalan ng dami, laki, o lawak ng isang bagay o nilalang.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mili',
      translation: 'Likas',
      definition:
          'katutubo at kabilang sa mga pangunahing katangian ng isang bagay o nilalang mula sa simula, at ayon sa batas ng kalikasan, hindi ginawa o binago ng tao.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Mayeng',
      translation: 'Lipad',
      definition:
          'pagkilos o paggalaw sa hangin mula sa isang lugar patungo sa iba, gamit ang mga pakpak, teknolohiya, o anumang paraan na nagpapahintulot na mag-angat mula sa lupa, karaniwan sa konteksto ng mga ibon o sasakyang panghimpapawid.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gadsal',
      translation: 'Lipas',
      definition:
          'hindi na ginagamit, sinusunod, o tinatangkilik dahil sa pagbabago ng panahon, teknolohiya, o uso.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'lanah',
      translation: 'Lisan',
      definition:
          'ang pag-alis o pagtatalikod mula sa isang lugar, posisyon, bagay, o tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lamtalo',
      translation: 'Litaw',
      definition:
          'madaling makita o mapansin dahil sa pagiging kapansin-pansin, malinaw, at maliwanag na nakikita o nahahalata sa unang tingin.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Lamwah',
      translation: 'Liwanag',
      definition:
          'kalagayan o kalidad ng pagiging maliwanag, na nagpapahintulot sa mga bagay na madaling makita, maunawaan, at nagpapakita ng ilaw upang makita ang paligid.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Admine',
      translation: 'Liyab',
      definition:
          'isang malaki, maliwanag, at marahas na apoy na biglaang sumiklab, mabilis kumalat, at may kasamang matinding init, sumisimbolo sa lakas o galit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lamnok',
      translation: 'Lobo',
      definition:
          '1. Uri ng mabangis na hayop sa pamilya ng canidae, may mahabang buntot, matatalim na ngipin, naninirahan sa kagubatan. 2. Manipis na bagay gawa sa plastik o goma, pinupuno ng hangin o helium, ginagamit sa pagdiriwang.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gusabla',
      translation: 'Lokasyon',
      definition:
          'isang partikular na lugar o eksaktong pwesto kung saan matatagpuan ang isang bagay o pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lam',
      translation: 'Loob',
      definition:
          'ang kalooban o intensyon ng isang tao na maipapahayag sa mga kilos, desisyon, o anumang ibinibigay bilang tanda ng pagmamahal o pagpapahalaga.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ikat',
      translation: 'Lubid',
      definition:
          ' isang mahabang kagamitan yari sa magkakasamang hibla o sinulid, ginagamit sa pagtali, pagkabit, igapos, o iangat ng mga bagay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'tumak',
      translation: 'lublob',
      definition:
          'ang paglalagay, paghuhulog, o pagpapalubog ng isang bagay o parte ng katawan sa likido o anumang substansya.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Galnab',
      translation: 'Lubog',
      definition:
          'nasa ilalim ng tubig o anumang likido at patuloy na bumababa o naglalaho sa paningin.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'tasubra',
      translation: 'lubha',
      definition:
          'isang paraan o kalagayan na higit sa karaniwan o inaasahan, nagpapakita ng mataas na antas ng intensidad, panganib, o kahalagahan.',
      partOfSpeech: 'Pangngalan / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Baya',
      translation: 'Abandonada',
      definition:
          'nagpapakita ng kakulangan sa pag-aalaga o atensyon at hindi ginagampanan ang mga responsibilidad o tungkulin.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fatan',
      translation: 'Abang',
      definition:
          'isang tao na naghihintay, nagmamasid, at nakatuon ang pansin sa pagdating o pangyayari para sa isang tiyak na layunin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bantay',
      translation: 'Abante',
      definition:
          'paggalaw o pag-usad pasulong; o utang na loob, senyas na magpatuloy sa isang gawain.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kanfulong',
      translation: 'Abilidad',
      definition:
          'ang kakayahan o kapasidad ng isang tao na mahusay na gawin ang ibat ibang gawain o tungkulin, sumasalamin sa antas ng kasanayan o kahusayan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Non nus',
      translation: 'Abnormal',
      definition:
          'hindi pangkaraniwan; lumalayo sa normal na kalagayan, katangian, pamantayan, kondisyon, o pag-uugali.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Salnalu',
      translation: 'Adaptasyon',
      definition:
          'ang proseso ng pagbabago o pag-ajuste upang maging akma at angkop sa bagong kapaligiran o sitwasyon, na nagpapahintulot sa isang organismo, ideya, o bagay na umunlad o magtagumpay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Anwe',
      translation: 'Agaw',
      definition:
          'isang kilos ng mabilis at biglaang pagkuha ng bagay mula sa may-ari nito nang walang pahintulot.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tanfan mati',
      translation: 'Agaw buhay',
      definition:
          'nasa kalagayan kung saan ang isang tao ay nakikipaglaban para manatiling buhay, at maaaring malapit na sa kamatayan.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Ulad',
      translation: 'Ahas',
      definition:
          'isang reptilyang mahaba, walang paa, at kilala sa makamandag na kagat o mahigpit na pagkakayakap sa biktima; o isang taong hindi tapat at mapanlinlang.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fuldo',
      translation: 'Akala',
      definition:
          'isang paniniwala o opinyon na walang sapat na ebidensya at hindi tiyak o siguradong totoo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Deg',
      translation: 'Akin',
      definition:
          'panghalip na paari na tumutukoy sa pagmamay-ari o pag-aangkin ng nagsasalita sa isang bagay o ideya.',
      partOfSpeech: 'Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Fanrayen',
      translation: 'Akitin',
      definition:
          'gumamit ng paraan upang magkaroon ng interes o hikayatin ang isang tao sa iyo, bagay, o ideya, sa anumang dahilan tulad ng pag-ibig o paghanga.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Liblu',
      translation: 'Aklat',
      definition:
          'isang binubuo ng pinagsama-samang pahina na may nakasulat na salita o larawan para sa edukasyon, libangan, o pananaliksik, pisikal man o elektroniko.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Do',
      translation: 'Ako',
      definition:
          'unang panauhang isahan na tumutukoy sa sarili ng tagapagsalita o tagapagbigay ng impormasyon sa usapan.',
      partOfSpeech: 'Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Amyak',
      translation: 'Akyat',
      definition:
          'ang paggalaw o pag-angat mula sa isang mababang lugar patungo sa mas mataas na posisyon, tulad ng sa itaas na palapag ng gusali.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Agtulen',
      translation: 'Alaala',
      definition:
          'isang bagay, pangyayari, o karanasan na nagpapaalala at nag-iingat ng mahahalagang sandaling nakalipas at tanda o patunay ng hindi malilimutang nakaraan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nifat',
      translation: 'Alagaan',
      definition:
          'ang pagbibigay ng pangangalaga, proteksyon, pagmamahal, at pagtugon sa mga pangangailangan ng isang tao, hayop, o bagay upang sila-y lumaki, umunlad, at manatiling malusog.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Tnabeng',
      translation: 'Alalayan',
      definition:
          'tumutukoy sa pagbibigay ng tulong o suporta sa isang tao o bagay upang maiwasan ang pagkahulog, mawalan ng balanse, at mapanatili ang kaligtasan o kaginhawaan.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Gare',
      translation: 'Alam',
      definition:
          'pagkakaroon ng kaalaman, impormasyon, o pag-unawa sa isang bagay, detalye, o sitwasyon na naihayag o naging bukas sa isip ng tao.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Gnare em',
      translation: 'alamin',
      definition:
          'tuklasin at unawain ang mga impormasyon o katotohanan tungkol sa isang bagay, paksa, o usapin.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Akfung',
      translation: 'Alikabok',
      definition:
          'mga pinong butil o partikulong dumi mula sa lupa, balat, buhok, at iba pang materyales, na naipon sa ibabaw ng mga bagay dahil sa hindi paglilinis.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'tami',
      translation: 'Ama',
      definition:
          'lalaking magulang ng isang anak at itinuturing na pinakapuno ng pamilya, nagbibigay ng proteksyon at suportang pinansyal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'tabeng',
      translation: 'Ambag',
      definition:
          'ito ay kusang loob na tulong, suporta, o pagbibigay ng oras, kaalaman, o yaman ng isang tao o grupo para sa ikabubuti ng isang layunin, proyekto, o samahan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tulen',
      translation: 'Amin',
      definition:
          'pagpapahayag ng pagkakasala, pag-ako sa isang bagay, o tumutukoy sa pag-aari o lugar na kinabibilangan ng nagsasalita at ng kanyang mga kasama.',
      partOfSpeech: 'Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Nako',
      translation: 'Aminin',
      definition:
          'pagpapahayag o pagtanggap ng isang bagay o katotohanan na dati ay itinatago o hindi ipinaaalam tungkol sa sarili o sa iba.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Bon',
      translation: 'Amoy',
      definition:
          'ang natatanging halimuyak o bango na nalalanghap at napapansin sa isang bagay, tao, o lugar sa pamamagitan ng pang-amoy.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tanlamu',
      translation: 'Ampunin',
      definition:
          'kunin at ituring na sariling anak o miyembro ng pamilya at bigyan ng proteksyon o kanlungan laban sa anumang panganib o kapahamakan.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Nga',
      translation: 'Anak',
      definition:
          'supling o indibidwal na bunga ng pagmamahalan ng magulang, walang pinipiling kasarian, at nagmula sa kanila.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'E',
      translation: 'ang',
      definition:
          'isang salitang ginagamit bilang pantukoy sa tiyak na bagay o tao at upang bigyang-diin o palakasin ang kahulugan ng pang-uri o pang-abay.',
      partOfSpeech: 'Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Smakay',
      translation: 'Angkas',
      definition:
          'ang pagiging pasahero sa likuran ng motorsiklo o bisikleta na pinapatakbo at kontrolado ng ibang tao.',
      partOfSpeech: 'Pang uri',
    ),
    DictionaryEntry(
      word: 'Anfun',
      translation: 'Angkin',
      definition:
          'likas o natural na kakayahan, katangian mula pagkasilang, o karapatang hinihingi o ipinaglalaban bilang nararapat na pag-aari ng isang tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Alung',
      translation: 'Anino',
      definition:
          'madilim na hugis o anyo na nabubuo sa ibabaw ng isang bagay o makikita sa tubig, salamin, kapag tinatamaan ng liwanag.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Molkurang',
      translation: 'Antok',
      definition:
          'pakiramdam ng pangangailangan na magpahinga o matulog sanhi ng kakulangan ng enerhiya, kung saan nahihirapan ang isang tao na manatiling gising at alerto.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fu',
      translation: 'Apo',
      definition:
          'isang matandang lalaki o babae na may dugong kaugnayan, mas nakatatanda sa magulang, at maituturing na ninuno o katutubong pinagmulan ng pamilya.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Albes',
      translation: 'Apaw',
      definition:
          'ang kalagayan ng likido o anumang bagay na lumalampas sa gilid, hangganan, o nakalaang espasyo, hindi na nagkakasya sa lalagyan o lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lifo',
      translation: 'Apoy',
      definition:
          'isang elemento na nagbibigay init at liwanag, nagmumula sa pagsindi ng materyales tulad ng kahoy, ginagamit sa pagluluto, at dapat kontrolin upang hindi kumalat.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Swela',
      translation: 'Aral',
      definition:
          'mga kaalaman, impormasyon, o leksyon na natutunan mula sa pag-aaral o karanasan, na naglalayong magbigay kaalaman at gabay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Du',
      translation: 'Araw',
      definition:
          'ang bituin na nasa sentro ng solar system na nagbibigay liwanag at init sa mundo at ang panahon ng kanyang paglitaw hanggang paglubog.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Agey tamdok',
      translation: 'Aray',
      definition:
          'isang bigkas o ekspresyon na ginagamit bilang reaksyon sa biglaang kirot, sakit, o discomfort.',
    ),
    DictionaryEntry(
      word: 'Kasafye',
      translation: 'Areglo',
      definition:
          'isang kasunduan o pagkakasundo sa pagitan ng mga partido o ang pag-aayos ng mga detalye upang maabot ang tiyak na layunin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kanfe',
      translation: 'Aresto',
      definition:
          'ang proseso ng pagkakahuli at pagpipigil sa isang tao dahil sa paggawa ng maling gawain o paglabag sa batas, upang dalhin sa korte at panagutin sa akusasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tinggal',
      translation: 'Armas',
      definition:
          'kasangkapan o kagamitan na ginagamit sa pagtatanggol o pagsalakay, nagpapalabas ng bala, o maaaring makasakit o makapatay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kafne',
      translation: 'Arte',
      definition:
          'isang paraan ng pagpapahayag na naglalayong magpakita ng natatangi o di-pangkaraniwang katangian, sa sining o kilos, o ang labis na pagpapahalaga sa sarili na maaaring magmukhang pilit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Baluh',
      translation: 'Asal',
      definition:
          'ang paraan ng pagkilos, pagpapakita ng sarili, at mga nakagawiang gawi na ipinapakita sa pang-araw-araw na pamumuhay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Yaan',
      translation: 'Asawa',
      definition:
          'taong legal na nakatali sa pamamagitan ng kasal, may responsibilidad, karapatan, at katuwang sa buhay na pinagsasaluhan ang mga pangarap, problema, at tagumpay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Masam',
      translation: 'Asim',
      definition:
          'kalagayan o lasa ng pagkain, inumin, o prutas na may matinding lasa na katulad ng suka, kalamansi, o may mataas na lebel ng sitriko o asidiko na sangkap.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kahi',
      translation: 'Asin',
      definition:
          'isang uri ng pampalasa na kristalina at puti, ginagamit upang magdagdag ng lasa sa pagkain at mahalaga rin sa pagpapanatili nito, nagmula sa dagat o bato.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Maltare',
      translation: 'Asintado',
      definition:
          'isang taong may kahusayan at kawastuhan sa pagtama ng target, lalo na sa paggamit ng baril o sandata, na naaayon sa tamang sukat o direksyon.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Ayem',
      translation: 'Aso',
      definition:
          'isang domestikadong hayop na may apat na paa at buntot, kilala sa pagiging tapat na kasama at madalas alagaan ng tao bilang pet o ginagamit sa pagbantay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mamis',
      translation: 'asukal',
      definition:
          'isang uri ng puti o kayumangging butil mula sa tubo o beet, karaniwang ginagamit bilang pangpatamis sa pagkain at inumin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nake',
      translation: 'At',
      definition:
          'isang pang-ugnay na ginagamit sa pagdugtong ng ideya, pangyayari, o bagay, at sa pagpapakilala ng rason o paliwanag na sumusuporta sa naunang pahayag.',
    ),
    DictionaryEntry(
      word: 'Furol',
      translation: 'Atras',
      definition:
          'direksyon o posisyon na kabaligtaran ng pag-usad pasulong, nasa likuran o hulihan ng isang bagay o lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sala',
      translation: 'Atraso',
      definition:
          'hindi pa naaayos na problema o gusot sa pagitan ng mga tao, o ang pagiging huli sa oras o pagtupad ng mga gawain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sanlalu',
      translation: 'Atupag',
      definition:
          'gawain o trabaho na nangangailangan ng pansin, oras, at dapat isakatuparan o tapusin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kdu',
      translation: 'Awa',
      definition:
          'isang damdamin ng malasakit at pag-unawa sa paghihirap ng iba, na nag-uudyok tumulong o magpakita ng kabutihan nang walang hinihinging kapalit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tatung',
      translation: 'Awat',
      definition:
          'ang proseso ng pagkontrol o pagpapahinto sa damdamin, aksyon, o sitwasyon upang maiwasan ang karagdagang gulo at mapanatili ang kapayapaan o katiwasayan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sdaas',
      translation: 'Away',
      definition:
          'isang sitwasyon ng hindi pagkakasundo o pagtatalo sa pagitan ng mga tao na maaaring humantong sa salita o gawaing nakakasakit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lingag',
      translation: 'Awit',
      definition:
          'isang sining na may salita at melodiya para sa pagpapahayag ng damdamin, pananampalataya, o pagkakakilanlan sa ibat ibang okasyon, at ekspresyon ng pakikiramay sa di-kanais-nais na sitwasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tabeng',
      translation: 'Ayuda',
      definition:
          'pananalapi o suportang ibinibigay upang mapagaan at matulungan ang kalagayan o sitwasyon ng isang tao, grupo, o organisasyon na nangangailangan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dungan',
      translation: 'Baba',
      definition:
          'isang bahagi ng mukha sa ilalim ng bibig at itinuturing na mababang punto nito; o isang kalagayan na mas mababa kumpara sa iba.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gutufa',
      translation: 'Babaan',
      definition:
          'ang proseso ng pag-alis ng sarili mula sa mas mataas na lugar o sasakyan patungo sa mas mababang lugar.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Malam',
      translation: 'Babad',
      definition:
          'tumutukoy sa pagkakalantad o pagkalubog ng isang bagay sa tubig o anumang likido sa mahabang panahon hanggang sa ito-y ganap na mabasa.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Libon',
      translation: 'Babae',
      definition:
          'isang tao na may kakayahang magdalang-tao, karaniwang may XX chromosomal na komposisyon, at may mga katangiang pisikal at biyolohikal na naiiba sa lalaki.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Isde',
      translation: 'Baboy',
      definition:
          'isang apat na paa na hayop na alaga para sa karne, kilala sa pagiging matakaw, at ginagamit din sa paglalarawan sa maruming o magulong bagay o lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bluyot',
      translation: 'Bag',
      definition:
          'isang sisidlan na may hawakan, karaniwang gawa sa tela, plastik, o balat, ginagamit sa pagdala, pag-imbak, o pagbili ng mga bagay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Akfe',
      translation: 'Baga',
      definition:
          'mainit na piraso ng uling o tira ng nasunog na bagay mula sa kahoy o ibang materyales, ginagamit sa pagluluto, pagbibigay-init, at maaaring magliyab kung hahanginan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'lulen',
      translation: 'Bagabag',
      definition:
          'isang estado o pakiramdam ng hindi pagkakomportable, pangamba, o pag-aalala dahil sa isang sitwasyon, na nagdudulot ng kawalan ng katiyakan.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Leet',
      translation: 'Bagal',
      definition:
          'ang kalagayan ng pagiging mabagal o kakulangan sa bilis at agaran na pagtugon sa pagkilos, paggawa, o anumang sitwasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kalyak',
      translation: 'Bagay',
      definition:
          'anumang materyal o di-materyal na maaaring hawakan, gamitin, o pag-usapan, at tumutukoy din sa pagiging akma, angkop, o may magandang kombinasyon sa isang konteksto.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tilok',
      translation: 'Bagot',
      definition:
          'ang pakiramdam ng pagkainip, pagkasawa, o pagkadismaya dahil sa kakulangan ng interes, aliw, o dahil sa paulit-ulit na gawain o sitwasyon.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Dunok',
      translation: 'Baha',
      definition:
          'kondisyon kung saan ang tubig mula sa ulan, ilog, o ibang pinagmulan ay umaapaw, tinatakpan ang karaniwang tuyong lugar at humahadlang sa normal na gawain o paglalakbay.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Blunto',
      translation: 'Bahaghari',
      definition:
          'isang natural na kababalaghan na nagpapakita ng arko ng ibat ibang kulay sa kalangitan, lalo na pagkatapos umulan, binubuo ng pula, kahel, dilaw, berde, bughaw, indigo, at lila.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Manibon',
      translation: 'Baho',
      definition:
          'amoy na hindi kaaya-aya, karaniwang nagmumula sa dumi, nabubulok, o hindi malinis na bagay, at dulot ng sensasyon sa ilong.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gumne',
      translation: 'Bahay',
      definition:
          'isang gusali o estruktura kung saan nakatira ang mga tao, karaniwang pamilya, at lugar ng kaginhawaan, seguridad, at pagmamahal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Safi',
      translation: 'Baka',
      definition:
          'isang salita na nagpapahiwatig ng hindi katiyakan o posibilidad na mangyari o hindi mangyari ang isang pangyayari o situwasyon.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Lankas',
      translation: 'Baklas',
      definition:
          'natanggal o sadyang pinaghiwalay mula sa pagkakakabit, pagkakaugnay, o kabuuan ng isang bagay dahil sa puwersa, lakas, o intensyonal na aksyon.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Labat',
      translation: 'Bakod',
      definition:
          'istrakturang gawa sa kahoy, metal, o iba pang matibay na materyales, itinatayo bilang proteksyon at pagtatakda ng hangganan upang pigilan ang hindi awtorisadong pagpasok o paglabas.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Awek',
      translation: 'Balakang',
      definition:
          'bahagi ng katawan sa magkabilang gilid, itaas ng hita at ibaba ng baywang, kung saan nagkikita ang itaas na binti at ibabang torso, sumusuporta sa katawan kapag nakaupo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kulit',
      translation: 'Balat',
      definition:
          'ang panlabas na sapin ng katawan ng tao, hayop, puno, at iba pang bagay, na nagpoprotekta at nagbibigay anyo, at materyal para sa gamit gaya ng sapatos.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kumi',
      translation: 'Balbas',
      definition:
          'buhok na tumutubo sa ibabang bahagi ng mukha ng isang lalaki o sa mukha ng ilang hayop, lalo na sa paligid ng baba at pisngi.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Slaleh',
      translation: 'Baldado',
      definition:
          'hirap sa pagkilos at hindi maayos na gumagana dahil sa pisikal na kapansanan o napinsala sa labis na paggamit o aksidente.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Balnabed',
      translation: 'Balibag',
      definition:
          'aksyon ng paghagis o pagtapon ng anumang bagay mula sa isang lugar patungo sa iba gamit ang puwersa ng kamay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fule',
      translation: 'Balik',
      definition:
          'ang proseso ng muling pagpunta o pagpapanumbalik sa pinanggalingang lugar, situwasyon, o sa orihinal na kalagayan o posisyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Abal',
      translation: 'Balikat',
      definition:
          'bahagi ng katawan na nasa pagitan ng leeg at braso, nag-uugnay sa braso sa ibabang bahagi ng leeg, at ginagamit sa pag-angat o pagdala ng mga bagay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tulen',
      translation: 'Baliw',
      definition:
          'isang tao na nawalan ng katinuan o nagpapakita ng kilos na labas sa normal o karaniwang asal.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fantas',
      translation: 'Balkonahe',
      definition:
          'bahagi ng bahay o gusali na nakaangat, nasa labas, may harang para sa kaligtasan, at lugar para tamasahin ang tanawin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Toh Mati',
      translation: 'Bangkay',
      definition:
          'katawan ng tao o hayop na wala nang buhay at hindi na humihinga o gumagalaw.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gusoreng',
      translation: 'Bangko',
      definition:
          'isang institusyong pinansyal na tumatanggap ng deposito, nagpapahiram ng pera, at nag-aalok ng ibat ibang serbisyong may kinalaman sa pananalapi.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bon',
      translation: 'Bango',
      definition:
          'ang kaaya-ayang amoy o samyo mula sa isang bagay o lugar na nakakapagbigay kasiyahan sa pang-amoy.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amtek',
      translation: 'Bangon',
      definition:
          'pagkilos mula sa pagkakahiga patungo sa pagtayo o pag-upo bilang tugon sa pangangailangan o pag-alis sa posisyon ng paghiga.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bnantak',
      translation: 'Banta',
      definition:
          'isang paalala o pagpapahayag ng posibleng panganib o di-kanais-nais na kahihinatnan bilang babala.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kasilyas',
      translation: 'Banyo',
      definition:
          'isang silid sa bahay na may lababo, inidoro, at karaniwang may shower o paliguan, para sa pagligo at paglilinis ng katawan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sang',
      translation: 'Bara',
      definition:
          'isang sitwasyon kung saan may harang o pagpigil sa normal na daloy o paggalaw ng isang bagay o proseso.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dad sagbet',
      translation: 'Barkada',
      definition:
          'isang grupo ng mga taong matalik na magkakaibigan, madalas na magkasama at gumugol ng oras sa ibat ibang gawain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sambi',
      translation: 'Barya',
      definition:
          'maliit na pirasong metal na hindi papel na pera, ginagamit sa pagbabayad ng mababang halaga ng bagay o serbisyo, may halaga mula pinakamababa hanggang medyo mataas.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sinafang',
      translation: 'Baril',
      definition:
          'isang aparato o kagamitan na ginagamit sa pagpapaputok ng bala para sa depensa, pag-atake, o pamamaril sa tinutukoy na target.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amdana',
      translation: 'Barato',
      definition:
          'hindi mahal; abot-kaya ang presyo; hindi pa hinog; bata pa o kulang sa karanasan; mura o salitang ginagamit bilang mura o pagpapahayag ng galit o pagkainis',
    ),
    DictionaryEntry(
      word: 'Agmufit',
      translation: 'Barbero',
      definition:
          'propesyonal na bihasa sa paggupit, pag-ayos ng buhok at balbas ng kalalakihan, at nagbibigay serbisyo sa paglinis at pagpapaganda ng mukha gamit ang ibat ibang kasangkapan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sagbet',
      translation: 'Barkada',
      definition:
          'isang grupo ng mga taong matalik na magkakaibigan, madalas na magkasama at gumugol ng oras sa ibat ibang gawain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'La gulit',
      translation: 'Barumbado',
      definition:
          'taong madaling magalit sa maliliit na bagay, hindi sumusunod sa alituntunin, at kadalasang sangkot sa mga gawaing labag sa batas.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fabatik',
      translation: 'Agad',
      definition:
          'nangangahulugang pagkilos o pagtugon nang walang pag-aatubili at sa lalong madaling panahon, hindi naghihintay ng ibang oras.',
      partOfSpeech: 'Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Fabatikam',
      translation: 'Agad agad',
      definition:
          'pagkilos o paggawa ng isang bagay nang walang anumang pagkaantala, pagpapahiwatig na itoy dapat isagawa kaagad at sa lalong madaling panahon.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Fafe',
      translation: 'Basa',
      definition:
          'kondisyon ng pagkakaroon ng kahalumigmigan dahil sa pagkakahantad sa o pagsipsip ng tubig o anumang likido, kabaligtaran ng tuyo.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Basu',
      translation: 'Baso',
      definition:
          'isang maliit na lalagyan, karaniwang gawa sa salamin, plastik, o ibang materyal, na ginagamit sa pag-inom ng tubig, juice, o iba pang likido.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Balet',
      translation: 'Basura',
      definition:
          'mga bagay na itinatapon dahil hindi na kailangan o magagamit, kasama ang sasakyan para sa pagkolekta at paghakot ng mga ito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kat',
      translation: 'Bawat',
      definition:
          'ginagamit upang ituro ang isa-isa o lahat-lahat na pagturing, pagkilala, o pagkakapantay-pantay ng mga indibidwal o bagay, na walang naiiwan o nakakaligtaan.',
    ),
    DictionaryEntry(
      word: 'We',
      translation: 'Benta',
      definition:
          'proseso o halaga ng pera na natatanggap sa pagpapalit ng produkto o serbisyo sa pera.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dule',
      translation: 'Beses',
      definition:
          'sukat ng dami ng pagkakataon na naganap o kadalasan ng isang pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ba',
      translation: 'Bibig',
      definition:
          'bahagi ng mukha na ginagamit sa pagkain, pagsasalita, at pagpapahayag ng salita at damdamin, kung saan pumapasok ang pagkain at inumin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amse',
      translation: 'Bigas',
      definition:
          'hindi pa lutong butil ng palay na nalinis at tinanggalan ng ipa, handa nang lutuin upang maging kanin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Man',
      translation: 'Bigkas',
      definition:
          'ang paraan o estilo ng pagbitaw o paglabas ng mga salita mula sa bibig.',
      partOfSpeech: 'Pangngalan / panghalip',
    ),
    DictionaryEntry(
      word: 'Kumi',
      translation: 'Bigote',
      definition:
          'balahibo sa itaas ng labi ng mga lalaki na tumutubo pagkatapos magbinata at simbolo ng pagtanda, na inaalagaan o ginugupitan para sa kaayusan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mili',
      translation: 'bihis',
      definition:
          'nakahanda at maayos ang suot na damit, kasama ang pang-itaas at pang-ibaba na angkop sa okasyon o pang-araw-araw.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Amse',
      translation: 'Bilang',
      definition:
          'paraan ng pagtukoy sa dami o kabuuan at resulta ng pagkwenta ng mga yunit o elemento.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Vlek',
      translation: 'Biro',
      definition:
          'isang pahayag o kilos na naglalayong magdulot ng aliw o saya sa pamamagitan ng masasayang salita o gawain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Falami kel',
      translation: 'Bisita',
      definition:
          'isang tao o ang pagkilos ng pagpunta sa lugar ng iba, tahanan man o kaganapan, upang makisalamuha o para sa tiyak na layunin bilang panauhin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bantu',
      translation: 'Biyak',
      definition:
          'ang kalagayan o proseso ng pagiging nahati o paghahati ng isang bagay o konsepto sa dalawa o higit pang bahagi.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Tawe libon',
      translation: 'Biyenan',
      definition:
          'mga magulang ng iyong asawa na nagiging kamag-anak mo sa pamamagitan ng pagpapakasal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sen man',
      translation: 'Bukambibig',
      definition:
          'isang salitang o parirala na kilalang-kilala at madalas gamitin sa araw-araw na pag-uusap upang magpahayag ng ideya o emosyon dahil sa tanyag o malalim na kahulugan nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nawah',
      translation: 'Buhay',
      definition:
          'ang estado ng pagkakaroon ng biyolohikal na proseso tulad ng paghinga, paglaki, at pagpaparami, kasama ang kabuuan ng karanasan at pag-iral mula kapanganakan hanggang kamatayan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Faya',
      translation: 'Bukas',
      definition:
          'ang araw na kasunod ngayon o oras sa hinaharap, hindi kasama ang kasalukuyang araw.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nuka',
      translation: 'Bukas',
      definition:
          'ang pagkilos o estado kung saan ang isang bagay ay nagiging maluwag mula sa pagkakasara, nakalantad sa pagpasok o paglabas.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mutab',
      translation: 'Bulong',
      definition:
          'isang mahinang pagbigkas o pagsasalita ng salita sa mababang tono, karaniwang malapit sa tainga ng ibang tao, na hindi madaling marinig ng iba.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dalan',
      translation: 'Daan',
      definition:
          'bilang na katumbas ng sampung beses ng sampu at lugar na nilalakaran upang makarating sa ibang pook.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mas',
      translation: 'Daig',
      definition:
          'higit sa inaasahan, karaniwan, o nalampasan sa kakayahan at nagawa.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Nabe',
      translation: 'Dala',
      definition:
          'ang mga bagay o kabuuang bigat na inililipat, inihahatid, o inaakay mula sa isang lugar patungo sa iba, lalo na sa paglalakbay.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Du',
      translation: 'Dahil',
      definition:
          'isang salita na ginagamit sa pag-uugnay ng isang kaganapan sa sanhi o rason ng pagkakaroon o pagyari nito.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Dugang',
      translation: 'Dagdag',
      definition:
          'isang elemento o detalye na idinagdag sa isang bagay, teksto, o dokumento upang mapabuti, mapalawak, o mapalaki ang kabuuan o nilalaman nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fanganag',
      translation: 'Dahan',
      definition:
          'ang kalagayan o katangian ng pagiging mabagal ang pag-usad, pagkilos, o pag-unlad, at hindi agad-agad nangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Banweh',
      translation: 'Daigdig',
      definition:
          'ang planeta na tahanan ng lahat ng nabubuhay na organismo tulad ng tao, hayop, at halaman, kung saan umiikot ang buhay at nangyayari ang ibat ibang pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'kanfe',
      translation: 'Dakip',
      definition:
          'aksyon ng paghuli o pagkuha sa isang tao, bagay, o hayop dahil sa paglabag, krimen, o iba pang layunin gamit ang kamay o kasangkapan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dasal',
      translation: 'Dalangin',
      definition:
          'isang taos-puso at matimyas na hiling o pakiusap sa Maykapal o anumang makapangyarihang entidad para sa tulong, gabay, o biyaya.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lal',
      translation: 'Daloy',
      definition:
          'ang tuluy-tuloy o unti-unting paggalaw ng likido, gas, o iba pang bagay sa isang direksyon, karaniwang patungo sa mas malaking anyong tubig o lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Too Fulong',
      translation: 'Dalubhasa',
      definition:
          'isang indibidwal na may mataas na antas ng kaalaman, kasanayan, at malalim na pag-unawa sa isang tiyak na larangan, disiplina, o sining.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Alyalu',
      translation: 'Dama',
      definition:
          '1. Babaeng malapit na kaibigan o kamag-anak ng ikakasal na tumutulong sa kanya sa kasal; 2. Laro sa board na layuning alisin ang piyesa ng kalaban.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fandaeh',
      translation: 'Damihan',
      definition:
          'ang proseso ng paggawa ng isang bagay upang ito ay maging mas marami o lumaki ang sukat o dami.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Maro',
      translation: 'Daya',
      definition:
          'ang paggamit ng hindi tapat na paraan, karaniwan sa pamamagitan ng panlilinlang o pagtatago ng katotohanan, na nagreresulta sa kawalan ng pantay na pagtrato o katarungan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Damkat',
      translation: 'Dikit',
      definition:
          'ang paggamit ng materyal para magkabit ng bagay o ang pagiging malapit ng posisyon o lokasyon ng isang bagay sa isa pa.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Kifu',
      translation: 'Dilim',
      definition:
          'kalagayan ng kawalan o mababang antas ng liwanag kung saan mahirap makita ang paligid.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mukat',
      translation: 'Dilat',
      definition:
          'malawak at bukas ang mga mata, nakatutok sa isang bagay o sitwasyon, at may sapat na kaalaman o pagsasanay.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Linge',
      translation: 'Dinig',
      definition:
          'ang kakayahang naririnig o malinaw at sapat ang lakas o taas ng tunog upang umabot sa pandinig.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Toom knaye',
      translation: 'Desidido',
      definition:
          'tiyak at matatag sa pagpili o adhikain, hindi nag-aalinlangan o nagdadalawang-isip sa mga napagdesisyunan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Anngak',
      translation: 'Disiplina',
      definition:
          'ang pagsasanay at pagkontrol sa sarili upang sundin ang mga tuntunin at pamantayan, kasama ang pagpapatibay ng prinsipyo at etika sa indibidwal o grupo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dini',
      translation: 'Dito',
      definition:
          'sa lugar o bagay na malapit at tinutukoy o binabanggit na malapit sa posisyon ng nagsasalita.',
      partOfSpeech: 'Pangngalan / panghalip',
    ),
    DictionaryEntry(
      word: 'Ditu',
      translation: 'Doon',
      definition:
          'tumutukoy sa lugar, sitwasyon, o bagay na hindi malapit o agad nararating ng nag-uusap, ginagamit sa pagturo sa hindi nakikitang pook.',
      partOfSpeech: 'Pangngalan / panghalip',
    ),
    DictionaryEntry(
      word: 'Kafaglabat',
      translation: 'Eksplenasyon',
      definition:
          'pagbibigay ng paliwanag, detalye, o dahilan upang mas maging malinaw at maunawaan ang isang paksa, sitwasyon, pangyayari, o konsepto.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mlayef',
      translation: 'Gaan',
      definition:
          'katangian ng pagiging magaan, walang bigat sa damdamin o pisikal, at pakiramdam ng kagaanan na walang pasanin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kifu',
      translation: 'Gabi',
      definition:
          'oras o bahagi ng araw pagkatapos ng hapon at bago mag-umaga, kung saan nangingibabaw ang kadiliman at karaniwang natutulog ang mga tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Liwa',
      translation: 'Gala',
      definition:
          'ang paglalakbay o paglilibot sa ibat ibang lugar nang walang tiyak na destinasyon o layunin, para sa kasiyahan o pagtuklas.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Minguk',
      translation: 'Galaw',
      definition:
          'aksyon o kilos ng katawan o bahagi nito upang magpahayag ng kaisipan, damdamin, reaksyon, o intensyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tayk fulong',
      translation: 'Galing',
      definition:
          'ang antas ng husay o kakayahan sa paggawa ng isang bagay na higit sa karaniwan, gamit ang natatanging abilidad upang makamit ang nakakabilib at nakakahangang resulta.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Malbot',
      translation: 'Galit',
      definition:
          'isang damdamin ng poot, pagkasuklam, o inis sa isang tao, sitwasyon, pangyayari, o kilos ng iba dahil sa hindi pagkakasundo.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kamas',
      translation: 'Galos',
      definition:
          'isang maliit na sugat o marka sa balat na dulot ng kalmot o hiwa, at maaaring maiwanan ng marka matapos maghilom.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kalyak',
      translation: 'Gamit',
      definition:
          'mga bagay, kagamitan, o ari-arian na ginagamit sa ibat ibang layunin, gawain, o pag-aari ng isang tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bulong',
      translation: 'Gamot',
      definition:
          'substansiyang inilalagay sa katawan para iwasan, gamutin, o pagalingin ang sakit, labanan ang mikrobyo, at ibalik ang kalusugan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Few bawe libon',
      translation: 'Ganda',
      definition:
          'katangian ng pagiging kaaya-aya at kaakit-akit sa paningin na nakapagbibigay ng positibong damdamin at kaluguran sa mga nakakakita.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mimo',
      translation: 'Gawa',
      definition:
          'ang bunga o produkto ng pagsisikap, kasanayan, sining, o pagpapahayag ng isipan at damdamin ng isang tao o grupo.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Gmegeng',
      translation: 'Gigil',
      definition:
          'isang matinding emosyon na nagdudulot ng panginginig, labis na kagalakan, o di mapigilang reaksyon, kasama ang malakas na urge na kumilos, tulad ng pagkagat sa labi o pagkuyom ng mga kamay, bunga ng sobrang tuwa, inis, o paghanga.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Taknal',
      translation: 'Gulat',
      definition:
          'isang biglaang damdamin o reaksyon sa hindi inaasahang pangyayari, na nagdudulot ng takot, pagkamangha, o pagkaalarma.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kliling',
      translation: 'Gulong',
      definition:
          'bilog na bagay, karaniwang gawa sa goma, na umiikot sa ilalim ng mga sasakyan para sa maayos na paggalaw.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bitil',
      translation: 'Gutom',
      definition:
          'ang pakiramdam ng pangangailangan na kumain dahil sa kakulangan ng pagkain sa tiyan, na nagdudulot ng hindi komportableng sensasyon.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Taha',
      translation: 'Haba',
      definition:
          'sukat o kalagayan ng isang bagay mula sa isang dulo patungo sa kabilang dulo, na tumutukoy sa pagiging mahaba o sa tagal ng panahon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Adloh',
      translation: 'Habol',
      definition:
          'pagmamadali o pagtakbo upang maabutan ang isang layunin, tao, bagay, o sitwasyon na pinagtutuunan ng pansin sa pagtugis.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Akmated',
      translation: 'Habilin',
      definition:
          'isang bagay, tungkulin, salita, o utos na ipinagkatiwala o iniwan bilang gabay o paalala ng isang tao sa iba bago umalis o pumanaw.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Abtas',
      translation: 'Halaga',
      definition:
          'ang presyo, kabuuang gastos, o ang kahalagahan at importansya ng isang tao, lugar, o bagay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lafa',
      translation: 'Hakbang',
      definition:
          'isang galaw o paglipat ng paa pasulong, pataas, o patungo sa ibang lugar upang umusad mula sa kasalukuyang posisyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nakat',
      translation: 'Halungkay',
      definition:
          'ang masusing pagkilos ng paghahanap, pagkalkal, o paghalughog sa isang lugar o mga bagay upang makahanap ng nais na bagay o impormasyon.',
    ),
    DictionaryEntry(
      word: 'Nabal',
      translation: 'Hanap',
      definition:
          'ang proseso o gawain ng pagtuklas, pagtingin, o paglalakbay upang matagpuan ang isang bagay, lugar, impormasyon, o solusyon na ninanais o kailangan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Safkaan',
      translation: 'Handaan',
      definition:
          'isang pagtitipon o pagsasalo-salo ng magkakasama upang ipagdiwang ang isang mahalagang okasyon, tulad ng kaarawan, anibersaryo, o pista, kasama ang pagkain, inumin, at minsan ay musika o sayawan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sen',
      translation: 'Hanggan',
      definition:
          'ang lugar, punto, o limitasyon kung saan natatapos ang isang bagay o hindi na maaaring magpatuloy, o ang pinakamataas o pinakamalayong abot na maaaring marating.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kel',
      translation: 'Hanggang',
      definition:
          'ginagamit para sa kondisyon o limitasyon sa oras, distansya, o dami, at nagpapahiwatig ng simula at katapusan ng panahon kung saan may bisa ang isang bagay.',
    ),
    DictionaryEntry(
      word: 'Nigef',
      translation: 'Haplos',
      definition:
          'isang magaan na kilos o pagdampi ng kamay sa katawan na may layuning magbigay ng ginhawa, pagmamahal, o pag-aalaga, upang pagaanin ang pakiramdam.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Flabi',
      translation: 'Hapon',
      definition:
          'ang bahagi ng araw mula pagkatapos ng tanghali, 12:00 ng tanghali, hanggang mga 6:00 ng gabi bago dumilim.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sasaluh',
      translation: 'Harapan',
      definition:
          'bahagi o lugar na agad nakikita o nararating sa unang tingin at kung saan inaasahan ang pagdating o pagsalubong sa tao o pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sagwe',
      translation: 'Harurot',
      definition:
          'tunog o ugong na nililikha ng bagay na mabilis na dumadaan, gaya ng sasakyan na nag-aarangkada o eroplanong lumilipas, na karaniwang malakas at biglaan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dyol',
      translation: 'Hatak',
      definition:
          'isang aksyon o proseso ng paggalaw o pagdala ng isang bagay palapit sa sarili sa pamamagitan ng paggamit ng lakas.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Atad',
      translation: 'Hatid',
      definition:
          'ang proseso ng pagdala o pagsama sa isang tao o bagay mula sa isang lugar patungo sa iba, kasama ang pagiging katuwang sa paglalakbay o paglipat.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nagot',
      translation: 'Hawak',
      definition:
          'ang paggamit ng kamay o mga daliri para sa pagkontrol, pag-iingat, o pagkakaroon ng isang bagay upang itoy hindi mahulog o mawala.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kanfit',
      translation: 'Hawa',
      definition:
          'kondisyon ng pagkalat ng sakit o mikrobyo mula sa isang indibidwal patungo sa iba, karaniwang sa pamamagitan ng direktang pakikipag-ugnayan, na nagdudulot ng pagkakasakit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Salngad',
      translation: 'Hawig',
      definition:
          'ang kalagayan ng pagkakaroon ng pagkakatulad o pagiging magkamukha sa anyo, hitsura, o katangian ng isang bagay o tao sa iba.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Aye',
      translation: 'Hayan',
      definition:
          'ginagamit bilang pagtukoy, pagpapakilala, o pagpapahayag ng pagkakita sa isang bagay, hayop, o tao na nasa malapit o kasalukuyang pinag-uusapan.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Mile',
      translation: 'Higa',
      definition:
          'ang posisyon o estado kung saan ang katawan ay nakahalang at nakapatong sa ibabaw, tulad ng kama o sahig, para sa pahinga, tulog, o may mukha pataas o pababa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gumile',
      translation: 'Higaan',
      definition:
          'ang paggamit ng ibabaw tulad ng kama o sofa bilang suporta sa katawan para makapag-relax, magpahinga, o matulog.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Subra',
      translation: 'Higit',
      definition:
          'nangangahulugang lumalampas sa tinakdang dami o sukat at mas marami o mas mataas kumpara sa iba.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Niluf',
      translation: 'Higop',
      definition:
          'ang pagkilos ng paghatak ng likido o sabaw mula sa lalagyan papunta sa bibig gamit ang bibig at labi, nang hindi gumagamit ng kubyertos.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tluyab',
      translation: 'Hikab',
      definition:
          'isang hindi sinasadyang reaksiyon kung saan nagbubukas ang bibig at humihinga nang malalim, nagpapakita ng pangangailangan sa oxygen, karaniwang dahil sa pagkapagod o inaantok.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Anlak',
      translation: 'Hikayat',
      definition:
          'ang proseso ng paghimok, pag-udyok, o pagbibigay ng sapat na dahilan sa isang tao upang siya ay maniwala o kumilos ayon sa nais ng nanghihimok.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dyol',
      translation: 'Hila',
      definition:
          'ang paggamit ng pwersa o lakas para akayin, galawin, o ilipat ang isang bagay mula sa isang lugar patungo sa ibang direksyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Flauf',
      translation: 'Hilamos',
      definition:
          'ang paglilinis o pag-aalis ng dumi at langis sa mukha gamit ang tubig at sabon o ibang panglinis upang itoy maging sariwa at malinis.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mlang',
      translation: 'Hilik',
      definition:
          'tunog na nililikha sa pagtulog dulot ng pag-vibrate ng daanan ng hangin, senyales ng mahimbing na pagtulog, karaniwang maririnig kapag barado ang ilong.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'kaye',
      translation: 'Hiling',
      definition:
          'ang pagpapahayag o pakiusap para sa tulong, gabay, o anumang naisin na maabot, maaaring sa paraang tahimik o sa pagbabahagi sa iba.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lifung',
      translation: 'Himatay',
      definition:
          ' ang pansamantalang pagkawala ng malay, na maaaring dahil sa labis na pagod, gutom, sakit, matinding emosyon, o hindi sapat na daloy ng dugo sa utak.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amganag',
      translation: 'Hina',
      definition:
          'katangian ng kakulangan sa lakas, tibay, at ang pagiging madaliang masira o mapagod.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'La',
      translation: 'Hindi',
      definition:
          'salitang nagpapahayag ng pagtanggi, di-pagsang-ayon, di-pagkakatotoo, o di-pagkakaroon ng isang bagay, pangyayari, o aksyon.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Nawa',
      translation: 'Hinga',
      definition:
          'proseso ng pagpasok at paglabas ng hangin sa baga at ang paggalaw ng hangin o gas sa isang espasyo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amni',
      translation: 'Hingi',
      definition:
          'ang proseso ng pagtanggap o pagkakamit ng isang bagay mula sa iba sa pamamagitan ng pagpapahayag ng kahilingan o pangangailangan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bawu',
      translation: 'Hitsura',
      definition:
          'ang kabuuan ng pisikal na katangian at panlabas na anyo ng isang tao o bagay na nakikita ng mata.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amdem',
      translation: 'Hiram',
      definition:
          'tumutukoy sa anumang bagay, salita, ideya, o konsepto na hindi orihinal na pag-aari o likha, ngunit pansamantalang ginagamit o inaangkin mula sa iba.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Amlus',
      translation: 'Hubad',
      definition:
          'walang saplot, takip, o anumang karaniwang nakalapat o nakabalot sa katawan o bagay.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Mugas',
      translation: 'Hugas',
      definition:
          'paggamit ng tubig at sabon upang alisin ang dumi sa ibat ibang bagay, kasama ang pagkuskos para tanggalin ang kontaminasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Manak',
      translation: 'Hupa',
      definition:
          'ang pagtigil o pagliit ng lakas ng likas na kalamidad at ang panahon ng pagbabalik sa normal na kalagayan matapos ang unos o sakuna.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gabla',
      translation: 'Husto',
      definition:
          'tumutukoy sa dami o lebel na eksaktong tumutugon sa pangangailangan o inaasahan, walang kulang at walang sobra, naaayon sa kagustuhan.',
      partOfSpeech: 'Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Dita',
      translation: 'Ibabaw',
      definition:
          'bahagi o lugar sa pinakamataas na punto ng isang bagay, kung saan inilalagay ang mga nais panatilihin sa nakikitang estado o madaling maabot.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Firang',
      translation: 'Idlip',
      definition:
          'maikling panahon ng pagtulog, karaniwang sa gitna ng araw, upang magpahinga at maibsan ang pagod.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tle',
      translation: 'Ihi',
      definition:
          'likido na dilaw ang kulay, inilalabas mula sa pantog, at nagtataglay ng mga dumi, pagkatapos salain ng mga bato ang dugo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Falibot',
      translation: 'Ikot',
      definition:
          'ang paggalaw o aksyon ng pag-ikid sa palibot ng isang punto o aksis, na nagbabalik sa orihinal na posisyon matapos ang buong sirkulo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mlikay',
      translation: 'Ilag',
      definition:
          'isang aksyon ng pag-iwas o paglayo sa tao, bagay, sitwasyon, o panganib upang maiwasan ang posibleng hindi kanais-nais na kahihinatnan o komplikasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dungan',
      translation: 'Ilalim',
      definition:
          'ang bahagi, puwesto, o espasyo na nasa baba o mas mababa kaysa sa itaas na parte ng isang bagay o estruktura.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Fille',
      translation: 'Ilan',
      definition:
          'salitang ginagamit sa pagtatanong o paglalarawan ng hindi tiyak na dami o bilang ng mga bagay, tao, o pangyayari na higit sa isa.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Salo',
      translation: 'Ilan',
      definition:
          'bagay o kagamitan na nagbibigay liwanag, karaniwang nakakabit sa kuryente, upang maaninagan ang kapaligiran sa oras ng dilim.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Mang / Ye',
      translation: 'Ina',
      definition:
          'babaeng nagbigay buhay o tumatayong magulang sa isang bata, nagmamahal at nag-aaruga.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Satu Ma',
      translation: 'Inaama',
      definition:
          'taong pinili sa binyag o kumpil bilang pangalawang magulang ng bata, o sa kasal bilang tagasuporta at tagapayo ng mag-asawa, na may tungkuling gabayan at suportahan sila.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Satu Nga',
      translation: 'Inaanak',
      definition:
          'ang bata na espirituwal na tinanggap at ginagabayan ng hindi magulang bilang bahagi ng seremonya tulad ng binyag o kumpil.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amlan',
      translation: 'Inahin',
      definition:
          'babaeng hayop na responsable sa pagpaparami, maaaring mangitlog o mag-anak.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kugak',
      translation: 'Ingay',
      definition:
          'anumang tunog o kalabog na maaring magdulot ng abala, hindi kanais-nais sa pandinig, o makasagabal sa pagkakaunawaan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mugod',
      translation: 'Isip',
      definition:
          'kakayahang magproseso, mag-imbak ng kaalaman, ideya, at tumutukoy sa bahagi ng pagkatao na nakakakilala, umuunawa, at nagpapasya batay sa impormasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lambot',
      translation: 'Inis',
      definition:
          'damdamin ng pagkairita, pagkasuklam, o pagkayamot sa isang bagay, tao, o sitwasyon na hindi nakakagusto.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Minit',
      translation: 'Init',
      definition:
          'kalagayan ng pagiging mainit, maalinsangan, o matinding damdamin tulad ng pagnanasa sa pag-ibig, ambisyon, nararanasan sa tag-araw, mataas na temperatura, at ibat ibang aspeto ng buhay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Minom',
      translation: 'Inom',
      definition:
          'aksyon ng pagtanggap at paglunok ng anumang uri ng likidong pangkonsumo sa katawan sa pamamagitan ng bibig.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fanya',
      translation: 'Insulto',
      definition:
          'salitang o pahayag na binibitawan upang saktan, maliitin, o ipahiwatig ang pagkawalang-galang at paghamak sa damdamin ng isang tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tagak',
      translation: 'Iwanan',
      definition:
          'ang pag-iiwan sa isang lugar, pangangalaga, o pananagutan sa iba nang walang balak na bumalik o kasamang pabalik.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Mngel',
      translation: 'Iyak',
      definition:
          'ang pagpapahayag o paglabas ng damdamin tulad ng kalungkutan o sakit sa pamamagitan ng pagluha o pagtangis mula sa mga mata.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kasaglad',
      translation: 'Kaagaw',
      definition:
          'isang tao o bagay na nasa kompetisyon o pagtutunggali sa iba para sa parehong layunin, posisyon, karangalan, o pag-ibig.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Do Aksut',
      translation: 'Kaarawan',
      definition:
          'araw ng pagdiriwang ng pagsilang ng isang tao o taunang paggunita sa simula ng mahalagang pangyayari o bagay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Liko',
      translation: 'Kaba',
      definition:
          'isang pakiramdam ng mabilis na pagtibok ng puso at pagkabalisa dahil sa takot, pangamba, o nerbiyos.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Afliko',
      translation: 'Kababalaghan',
      definition:
          'mga pangyayari o bagay na kakaiba, hindi karaniwan, at mahirap ipaliwanag, nagdudulot ng pagtataka o pagkamangha.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Garu',
      translation: 'Kabisado',
      definition:
          'natatandaan o naaalala nang lubusan nang hindi na kailangang sumangguni sa mga tala o libro, at pamilyar sa isang gawain na parang awtomatiko na ang pagkilos.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kafye Balu',
      translation: 'Kabutihan',
      definition:
          'ang kalidad ng pagiging mabait, mapagbigay, o nakatutulong sa iba, na may positibong epekto o resultang nakapagdudulot ng kapakinabangan sa tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bulfabi',
      translation: 'Kahapon',
      definition:
          'ang araw o panahon na nauna at direktang bago ang kasalukuyang araw.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Aksasalo',
      translation: 'Kaharap',
      definition:
          'ang tao o bagay na direktang nasa harapan o tapat, kung saan sila ay magkaharap.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Kasatnga',
      translation: 'Kahati',
      definition:
          'ang bahagi na katumbas ng limampung porsyento o pantay na hati ng kabuuan, kung saan itoy may laking katumbas sa isa pang bahagi.',
      partOfSpeech: 'Pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Tagaru',
      translation: 'Kabisado',
      definition:
          'natatandaan o naaalala nang lubusan nang hindi na kailangang sumangguni sa mga tala o libro, at pamilyar sa isang gawain na parang awtomatiko na ang pagkilos.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Nunkamo',
      translation: 'Kabuluhan',
      definition:
          'ang halaga, importansya, o antas kung saan ang isang bagay, ideya, o gawain ay may kahulugan at layunin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Balbutang',
      translation: 'Kagabi',
      definition:
          'ang yugto sa pagitan ng hapon at pagsikat ng araw sa nakaraang araw, pagkatapos maglubog ang araw at bago ito muling sumikat.',
    ),
    DictionaryEntry(
      word: 'Kafyu',
      translation: 'Kagandahan',
      definition:
          'ang katangian o kalidad ng pagiging kaakit-akit at nagbibigay ng kasiyahan, paghanga, o positibong damdamin sa pandamdam o paningin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Naket',
      translation: 'Kagat',
      definition:
          'ang pagkilos ng pagpikit o paghigpit ng ngipin sa balat o bagay, na nagiging sanhi ng sugat, marka, o pinsala.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Balfabi',
      translation: 'Kahapon',
      definition:
          'ang araw o panahon na nauna at direktang bago ang kasalukuyang araw.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Katal',
      translation: 'Kati',
      definition:
          'isang matinding pagnanais o sensasyon na mahirap pigilan at nag-uudyok ng pangangailangan na kumilos upang maibsan ang nararamdaman.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sagbet',
      translation: 'Kaibigan',
      definition:
          'isang taong malapit sa puso, nagbibigay ng pagmamahal, suporta, at pagkakaintindihan, kasama sa kasiyahan at kalungkutan, at nakikinig at nagpapayo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kilen',
      translation: 'Kailan',
      definition:
          'isang tanong sa tiyak o di-tiyak na panahon kung kailan naganap o mangyayari ang isang pangyayari o aksyon.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Kmaan',
      translation: 'Kain',
      definition:
          'aksyon ng paglagay ng pagkain sa bibig, pagnguya, at pagproseso nito sa loob ng katawan upang makuha ang kinakailangang sustansya at enerhiya.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sasato',
      translation: 'Kaisahan',
      definition:
          'ang kalagayan o katangian ng pagiging buo at iisa, na walang pagkakahati, sa pamamagitan ng pagsasama ng mga bahagi upang makabuo ng isang entity.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kafaldam',
      translation: 'Kaisipan',
      definition:
          'ang kabuuan ng mga ideya, konsepto, paniniwala, at prinsipyo sa isip na nagbibigay direksyon sa pag-uugali at desisyon ng isang tao o grupo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lamkayo',
      translation: 'Kakahuyan',
      definition:
          'isang lugar na siksik sa mga halaman at punongkahoy, mas maliit kaysa sa gubat, at kadalasang maliit na kagubatan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dile',
      translation: 'Kakilala',
      definition:
          'isang tao na may pangunahing kaalaman o pamilyaridad sa isat isa ngunit hindi malalim ang koneksyon o ugnayan, at nakasalamuha na sa ibat ibang pagkakataon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kontra',
      translation: 'Kalaban',
      definition:
          'isang tao o grupo na nakikipagtagisan o nakikipaglaban sa iba, may salungat na layunin o interes, upang magtagumpay sa isang hamon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kagkah',
      translation: 'Kalagayan',
      definition:
          'ang estado, katayuan, o posisyon ng isang tao, bagay, o sitwasyon sa isang tiyak na panahon o lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Di Gutnga',
      translation: 'Kalagitnaan',
      definition:
          'ang bahagi o punto na pantay ang layo mula sa magkabilang dulo, gilid, o extremo, na eksaktong nasa gitna.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kabal',
      translation: 'Kalawakan',
      definition:
          'ang walang hangganang espasyo sa itaas ng atmospera na kinatatayuan ng mga bituin, planeta, at ibang celestial na katawan, tumutukoy din sa malawak na sakop o lawak.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kasagwas',
      translation: 'Kalaro',
      definition:
          'isang tao na kaibigan o kasamahan sa paglalaro, paglilibang, o anumang uri ng palaro.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Flus',
      translation: 'Kalas',
      definition:
          'tumutukoy sa pagiging hindi na nakakabit o nakaugnay sa pinagmulan, at sa paglaya o pagkaligtas mula sa pagkakatali o pagkakakulong.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Balet',
      translation: 'Kalat',
      definition:
          'isang sitwasyon ng pagiging magulo at hindi maayos na pagkakalat ng mga bagay sa isang lugar, dulot ng hindi pagliligpit ng gamit sa tamang lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kuni',
      translation: 'Kalawang',
      definition:
          'isang kemikal na reaksyon sa bakal o metal dahil sa oxygen at kahalumigmigan, nagbabago ang kulay at istraktura nito, nagiging kahel o kayumanggi.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Laweh',
      translation: 'Katawan',
      definition:
          'kabuuang istraktura ng isang nilalang, kabilang ang ulo, dibdib, tiyan, braso, at binti, na tumutukoy sa pisikal na anyo o hugis.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Aklahew',
      translation: 'Kaligayahan',
      definition:
          'ang kalagayan o pakiramdam ng lubos na kasiyahan, kaganapan, at pagiging kontento sa buhay, nang walang anumang hinanakit o problema.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bibeng',
      translation: 'Kaliwa',
      definition:
          'ang bahagi o direksyon na kabaligtaran ng kanan, nasa gilid ng katawan ng tao kung saan naroon ang puso, kapag nakaharap sa hilaga.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kastima',
      translation: 'Kaliwaan',
      definition:
          'isang transaksyon kung saan ang pagbabayad at pagtanggap ng produkto o serbisyo ay ginagawa nang sabay at direkta.',
    ),
    DictionaryEntry(
      word: 'Kamas',
      translation: 'Kalmot',
      definition:
          'marka o sugat sa balat mula sa paghila o pagdiin ng matutulis na kuko ng tao o hayop, karaniwang nagdudulot ng sugat.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dalan',
      translation: 'Kalye',
      definition:
          'isang makitid na daan sa komunidad o lungsod na ginagamit bilang ruta ng mga tao at sasakyan, at lugar ng ibat ibang aktibidad ng komunidad.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gumilu',
      translation: 'Kama',
      definition:
          'isang uri ng muwebles na ginagamit bilang higaan para sa pagtulog o pahinga.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Akmal',
      translation: 'Kamao',
      definition:
          'bahagi ng kamay na nabuo sa pamamagitan ng pagbaluktot ng mga daliri patungo sa palad.',
    ),
    DictionaryEntry(
      word: 'Kwanan',
      translation: 'Kanan',
      definition:
          'ang direksyon o bahagi ng katawan na kasalungat ng kaliwa, karaniwang mas malakas o mas ginagamit ng karamihan.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Slaf',
      translation: 'Kandarapa',
      definition:
          'uri ng ibong gabi na mas malaki kaysa pugo, kilala bilang nightjar, lumalapag sa lupa nang protektado, at nagpapalipad-lipad tuwing gabi.',
    ),
    DictionaryEntry(
      word: 'Degalu',
      translation: 'Kanila',
      definition:
          'tumutukoy sa pagmamay-ari o kinauukulan ng grupo ng mga tao, hindi kasama ang kausap at ang nag-uusap, ginagamit bilang paksa o layon.',
      partOfSpeech: 'Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Ginu',
      translation: 'Kanina',
      definition:
          'sa oras o bahagi ng parehong araw na lumipas bago ang kasalukuyang sandali; hindi matagal ang nakalipas ngayong araw.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Simto',
      translation: 'Kanino',
      definition:
          'ginagamit sa pagtatanong o pagtukoy sa taong pinag-uukulan o may-ari ng isang bagay, kilos, o pag-aari.',
      partOfSpeech: 'Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Knaan',
      translation: 'Kanin',
      definition:
          'pagkain mula sa butil ng palay na niluto sa tubig hanggang lumambot, at pangunahing sangkap sa hapag ng mga Pilipino.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Abtas',
      translation: 'Kantidad',
      definition:
          'sukat, dami, o kabuuang bilang ng mga yunit na bumubuo sa isang bagay o pangkat.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Alnando',
      translation: 'Kantiyaw',
      definition:
          'isang mapaglarong palitan ng pabirong pangungusap o pagpuna na hindi naglalayong makasakit at karaniwang tinatanggap nang may magandang loob.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Twage',
      translation: 'Kapatid',
      definition:
          'isa na anak din ng iyong mga magulang o ng isa sa iyong mga magulang, o taong itinuturing na malapit na kaanib sa pananampalataya o samahan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Magot',
      translation: 'Kapit',
      definition:
          'ang hindi pagkakawala o pagiging nakadikit nang mahigpit sa isang bagay o lugar, at ang pananatili sa posisyon kahit may pwersang nagtutulak o naghihila palayo.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Dibale Gumno',
      translation: 'Kapitbahay',
      definition:
          'taong nakatira sa malapit o kalapit na bahay o lote sa iyong tahanan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Klima',
      translation: 'Kapos',
      definition:
          'hindi sapat ang dami, halaga, o yaman upang matugunan ang mga pangangailangan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Knalo',
      translation: 'Kamay',
      definition:
          'bahagi ng katawan sa dulo ng braso na ginagamit sa paghawak, pagdama, pagsulat, pagkain, at iba pang gawain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mlit Nawa',
      translation: 'Karamdaman',
      definition:
          'kalagayan ng hindi normal o maayos na paggana ng bahagi ng katawan o isip, nagdudulot ng panghihina o hindi magandang pakiramdam.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Alyalo',
      translation: 'Karamihan',
      definition:
          'ang bahagi na mas malaki kumpara sa iba sa kabuuan o malaking bilang ng tao o bagay sa isang lugar o pangkat.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Aktooh',
      translation: 'Karapatan',
      definition:
          'ang legal o moral na pribilehiyo at benepisyo na dapat tinatamasa ng isang tao ayon sa batas at etika upang gawin o hawakan ang isang bagay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Anket',
      translation: 'Karga',
      definition:
          'mga bagay o elektrisidad na inilalagay sa sasakyan o baterya para sa transportasyon o gamit ng aparatong de-kuryente.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tugad',
      translation: 'Karugtong',
      definition:
          'bahagi o proseso na sumusunod o nagpapatuloy sa nauna para makumpleto o palawigin ito at magdagdag ng impormasyon o tagal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Song',
      translation: 'Kasalo',
      definition:
          'isang tao na nakikihati o nakikisama sa pagkain, gawain, karanasan, o layunin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ani',
      translation: 'Kasalukuyan',
      definition:
          'ang panahon, mga pangyayari, uso, o kalagayan na umiiral at ginaganap sa ngayong oras.',
      partOfSpeech: 'Pangngalan / Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Dareme',
      translation: 'Kasama',
      definition:
          'isang tao o bagay na naroroon bilang suporta, kaibigan, o katulong, at hindi hiwalay sa iba; magkasabay o magkaugnay sa ibat ibang pangyayari.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tabeng',
      translation: 'Kasambahay',
      definition:
          'isang tao o katuwang sa tahanan na nagbibigay suporta sa pang-araw-araw na gawain at kadalasang tumitira rin sa bahay na kanyang pinaglilingkuran.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dad Alyak',
      translation: 'Kasangkapan',
      definition:
          'mga bagay o piraso ng kagamitan ginagamit sa bahay, opisina, o iba pang lugar para sa tiyak na layunin, kaginhawaan, o dekorasyon tulad ng mesa, upuan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Aglam',
      translation: 'Kasapi',
      definition:
          'isang indibidwal na opisyal na nabibilang o may hawak ng bahagi sa isang grupo, organisasyon, negosyo, o proyekto.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Klehew',
      translation: 'Kasayahan',
      definition:
          'isang okasyon o kalagayan ng pagtitipon, pagdiriwang, at pagbabahagi ng kagalakan, ginhawa, at magandang samahan, na nagdudulot ng kasiyahan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sin',
      translation: 'Kasi',
      definition:
          'ginagamit sa pagpapahayag ng dahilan o sanhi at nagsisilbi bilang tulay sa ugnayan ng resulta at pinagmulan nito.',
    ),
    DictionaryEntry(
      word: 'Yaan To',
      translation: 'Kasintahan',
      definition:
          'taong espesyal at minamahal sa puso ng isang tao, na may romantikong relasyon at kasama sa mahahalagang sandali ng buhay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tulenkeng',
      translation: 'Kasinungalingan',
      definition:
          'isang maling pahayag o impormasyon na sadyang inilalahad upang linlangin ang iba at walang anumang katotohanan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kabay',
      translation: 'Kaso',
      definition:
          'isang salita na tumutukoy sa sitwasyon o pangyayaring pinagtatalunan, lalo na sa legal na konteksto, o ginagamit upang ipahiwatig ang pagkakaiba o pagtutol.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mabo',
      translation: 'Kabataan',
      definition:
          'grupo ng mga indibidwal na nasa yugto ng paglaki at pag-unlad, nasa pagitan ng pagkabata at ganap na pagiging adulto, karaniwang tumutukoy sa mga nasa murang edad.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Akfanak',
      translation: 'Katahimikan',
      definition:
          'kalagayan ng kawalan ng ingay o gulo na nagbibigay daan sa panatag na damdamin, pagpapahinga, at pagmumuni-muni.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kfulung',
      translation: 'Katalinuhan',
      definition:
          'ang kakayahan ng isipan sa mabilis at epektibong pag-unawa, pag-aaral, paglutas ng problema, at paggawa ng makabuluhang konklusyon at desisyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Malweh',
      translation: 'Katamaran',
      definition:
          'ang kalagayan o ugali ng pagiging hindi masipag, ayaw gumalaw, at pagpili sa pinakamadaling paraan sa pagtupad ng mga gawain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gabla An',
      translation: 'Katamtaman',
      definition:
          'hindi labis at hindi kulang, sapat lamang sa pangangailangan o kagustuhan; nasa gitnang antas ng kalidad o dami.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Digusen',
      translation: 'Katapusan',
      definition:
          'ang huling bahagi, yugto, punto, o panahon kung saan natatapos ang anumang bagay, proseso, o gawain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Litak',
      translation: 'Katas',
      definition:
          'likido na maaaring makuha sa pinigang prutas o natural na lumalabas sa ari ng lalaki bilang bahagi ng reproduktibong proseso.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amgal',
      translation: 'Katatagan',
      definition:
          'ang kalagayan ng pagiging matatag, hindi madaling magbago, may kapanatagan, at proteksyon laban sa hindi inaasahang mga pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kasfasinsya',
      translation: 'Kapatawaran',
      definition:
          'ang pagtanggap at pagbibigay ng pagkakataon sa nagkamali na magbagong-buhay nang walang hinanakit o paghahangad ng kapalit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lawe',
      translation: 'Katawan',
      definition:
          'kabuuang istraktura ng isang nilalang, kabilang ang ulo, dibdib, tiyan, braso, at binti, na tumutukoy sa pisikal na anyo o hugis.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fnati',
      translation: 'Katay',
      definition:
          'proseso ng paghahanda ng karne sa pamamagitan ng pagputol o paghihiwa ng isang buong parte ng hayop sa mas maliliit na piraso.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Katal',
      translation: 'Kati',
      definition:
          'isang matinding pagnanais o sensasyon na mahirap pigilan at nag-uudyok ng pangangailangan na kumilos upang maibsan ang nararamdaman.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kadlut',
      translation: 'Katotohanan',
      definition:
          'ang tumpak at napatunayang impormasyon o pangyayari na tunay, wasto, at hindi binago o peke.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Asnalig',
      translation: 'Katiwala',
      definition:
          'isang taong may pananagutan at pinagkakatiwalaan sa pag-aalaga, pagbabantay, at pamamahala ng lugar, bagay, tao, o negosyo para sa iba.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kmutok',
      translation: 'Katok',
      definition:
          'aksyon o tunog mula sa pagtuktok sa pinto o ibang bagay gamit ang kamay upang humingi ng pansin o ipahayag ang pagdating.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gumile',
      translation: 'Katre',
      definition:
          'isang piraso ng muwebles na may matigas na ibabaw at sinusuportahan ng apat na paa, ginagamit para sa pagpapahinga o pagtulog.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Salngad',
      translation: 'Katulad',
      definition:
          'isang bagay o sitwasyon na may pagkakapareho o halos pareho sa mga katangian o kalagayan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kaglut',
      translation: 'Katunayan',
      definition:
          'ang kalagayan o ebidensyang nagpapatunay sa pagiging totoo at hindi kathang-isip ng isang umiiral na bagay, pahayag, o pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Glal',
      translation: 'Katungkulan',
      definition:
          'ang responsibilidad o papel na dapat gampanan ng isang tao sa kanyang propesyon, posisyon sa lipunan, o sa isang organisasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Duen',
      translation: 'Katwiran',
      definition:
          'paliwanag o prinsipyo na ginagamit upang bigyang-katwiran ang isang pananaw, kilos, pangyayari, o ang pagiging makatarungan ng isang aksyon o desisyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kastulen',
      translation: 'Kausap',
      definition:
          'isang tao na kasama sa pagtatalakay o pag-uusap, nakikinig, at nakikipagpalitan ng ideya o saloobin, sa personal man o sa ibat ibang uri ng komunikasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kalahay',
      translation: 'Kawa',
      definition:
          'isang malaking lalagyan, karaniwang yari sa metal tulad ng bakal o tanso, ginagamit sa pagluluto ng malalaking dami ng pagkain o pagpapakulo ng likido.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kmako',
      translation: 'Kawatan',
      definition:
          'isang indibidwal na kumukuha o pumapasok sa ari-arian ng iba nang walang pahintulot upang magnakaw.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Di',
      translation: 'Kay',
      definition:
          'ginagamit bilang pananda sa pangalan ng tao para sa direksyon, pag-aari, o relasyon, at bilang panlapi sa pang-uri para sa labis na paghanga o pang-iinsulto.',
      partOfSpeech: 'Pang-uri o Pang-abay',
    ),
    DictionaryEntry(
      word: 'Gagan',
      translation: 'Kaya',
      definition:
          'ginagamit bilang pagpapahayag ng bunga, resulta, dahilan ng isang pangyayari, o kaisipan, at pahayag ng pagtatanong, duda, o sorpresa tungkol sa isang sitwasyon.',
      partOfSpeech: 'Pang-abay',
    ),
    DictionaryEntry(
      word: 'Gamo',
      translation: 'Kayo',
      definition:
          'isang panghalip na tumutukoy sa isa o higit pang taong kinakausap sa ikalawang panauhan, ginagamit para sa pormal na konteksto o bilang pagpapakita ng paggalang.',
      partOfSpeech: 'Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Talu',
      translation: 'Kibo',
      definition:
          'isang pagkilos o aksyon na nagpapahiwatig ng pagtugon o pagbasag sa katahimikan, mula sa dating estado ng pagiging tahimik o walang reaksyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dile',
      translation: 'Kilala',
      definition:
          'tao o bagay na madalas marinig o makita sa media dahil sa natatanging kakayahan, gawa, o katangian, at may malawak na kaalaman o koneksyon.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Adnile',
      translation: 'Kilates',
      definition:
          'yunit ng sukat para sa kadalisayan ng ginto at iba pang metal o timbang ng mahahalagang bato, kung saan mas mataas na bilang ay nagpapahiwatig ng mas mataas na puridad o halaga.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gilak',
      translation: 'Kiliti',
      definition:
          'isang sensasyon na nararanasan kapag may dumadampi sa balat, nag-uudyok ng pagtawa o ngiti, karaniwang bunga ng magaan na paghipo sa tiyak na bahagi ng katawan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Minguk',
      translation: 'Kilos',
      definition:
          'paggalaw o aksyon na may layunin, direksyon, o paraan ng pagpapakita ng ugali at emosyon sa pamamagitan ng pisikal na ekspresyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amneng',
      translation: 'Kinang',
      definition:
          'liwanag o ningning na resulta ng pagtama ng ilaw sa isang bagay, o pagpapakita ng kagandahan o katangian sa pamamagitan ng natatanging liwanag.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fangfel',
      translation: 'Kinapal',
      definition:
          'ang proseso ng paglikha o pagbigay anyo sa isang bagay o ideya mula sa wala o sa pamamagitan ng pagsasama-sama ng materyales o pagpapahayag.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Nigef',
      translation: 'Kinapa',
      definition:
          'ang paghahanap o pagtuklas ng isang bagay gamit ang pandama sa kamay o daliri, nang hindi umaasa sa paningin kundi sa pagdama lamang.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Kafaglabat',
      translation: 'Paunawa',
      definition:
          'isang pahayag o anunsyo na nagbibigay ng mahalagang impormasyon o babala sa publiko o sa isang tiyak na grupo ng mga tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tuh',
      translation: 'Pawis',
      definition:
          'likido na nagmumula sa mga glandula sa balat ng tao o hayop bilang tugon sa init, pisikal na aktibidad, o kapag mainit ang panahon',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Maye',
      translation: 'Payag',
      definition:
          'sang-ayon at handang tanggapin o sundin ang isang bagay, mungkahi, paanyaya, o kahilingan.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Baya',
      translation: 'Payagan',
      definition:
          ' ibigay ang pahintulot o hayaang mangyari ang isang bagay nang walang pagtutol.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Mantnak',
      translation: 'Payapa',
      definition:
          'kalagayan ng katahimikan at katiwasayan, kung saan walang gulo, away, tensyon, o anumang uri ng kaguluhan.',
      partOfSpeech: 'pangngalan / pang-uri',
    ),
    DictionaryEntry(
      word: 'Lahan',
      translation: 'Payat',
      definition:
          'katangian ng isang tao o bagay na may manipis o maliit na pangangatawan, at kulang sa taba o laman, kadalasan ay mas makitid kaysa sa karaniwan.',
      partOfSpeech: 'pang-uri',
    ),
    DictionaryEntry(
      word: 'Ngak',
      translation: 'Payo',
      definition:
          'mga salitang o gabay na binibigkas, sinusulat, o ginagawa ng isang taong may karanasan o kaalaman upang makatulong sa iba na magdesisyon o malutas ang problema.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Fayong',
      translation: 'Payong',
      definition:
          'isang portable na kagamitan na ginagamit bilang proteksyon laban sa ulan o sikat ng araw, may hawakan at mekanismo para sa paglawak at pagsara.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Gumifal',
      translation: 'Pedestriyan',
      definition:
          'isang taong naglalakad o naglalakbay sa kalsada o daanan nang walang sinasakyang sasakyan.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Kmutik',
      translation: 'Pedikyur',
      definition:
          'paraan ng pag-aalaga sa mga kuko ng paa na may kasamang paglilinis, paggupit, pag-aalis ng patay na balat, pagmasahe, at pagpapahid ng produkto para sa kalusugan at kagandahan.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Laas',
      translation: 'Peklat',
      definition:
          'permanenteng marka o tanda sa balat na naiiwan matapos maghilom ang sugat, o resulta ng paggaling mula sa pinsala, operasyon, o sakit sa balat.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Klubeng',
      translation: 'Peluka',
      definition:
          'isang artipisyal na kasuotan sa ulo, gawa sa tunay o pekeng buhok, upang pampaganda, takpan ang pagkakalbo, o baguhin ang hitsura sa pamamagitan ng iba t ibang estilo, kulay, o haba.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Filak',
      translation: 'Pera',
      definition:
          'yaman o ari-arian na ginagamit sa pagbili, pagbayad ng serbisyo, at pagtustos sa pang-araw araw na pangangailangan at iba t ibang transaksyon.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Salanti',
      translation: 'Perhuwisyo',
      definition:
          'isang bagay o pangyayari na nagdudulot ng abala, hindi kasiyahan, pinsala sa tao, ari-arian, o kapaligiran na nagiging sanhi ng problema o pagkawala.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Bay / Gabay',
      translation: 'Pero',
      definition:
          'isang pangatnig na ginagamit sa pagpapahayag ng pagtutol o pagkakaiba sa naunang ideya, at nagsisilbing pang-ugnay sa magkasalungat na pahayag.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Fangbon',
      translation: 'Perpume',
      definition:
          'likidong ginagamit sa katawan o damit upang magbigay ng kaaya-ayang amoy, karaniwang nagmumula sa bulaklak o halaman, ginagamit bilang pampaganda o para sa personal na kalinisan.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Dad toh',
      translation: 'Personel',
      definition:
          'mga indibidwal o grupo ng tao na kinuha para maglingkod o magtrabaho sa isang organisasyon, kumpanya, institusyon, o partikular na negosyo.',
      partOfSpeech: 'pangngalan',
    ),
    DictionaryEntry(
      word: 'Duti',
      translation: 'Pestisidyo',
      definition:
          'kemikal o substansyang ginagamit upang puksain o kontrolin ang mga nakakasamang organismo tulad ng insekto, damo, at fungi, para protektahan ang mga halaman at hayop.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Kan mas',
      translation: 'Pigain',
      definition:
          'Ang proseso ng pag-apply ng presyon gamit ang mga kamay o instrumento sa isang bagay upang maalis ang likido o katas mula rito.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Klido',
      translation: 'Pighati',
      definition:
          'Matinding kalungkutan o sakit ng damdamin at isipan dahil sa pagkawala, kabiguan, o hindi inaasahang pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Galwa / Amtaku',
      translation: 'Piglas',
      definition:
          'pagkilos o pagsisikap na makalaya mula sa pagkakagapos, pagkakahawak, o sitwasyong nakakapigil sa kalayaan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fisa',
      translation: 'Pigsa',
      definition:
          'isang masakit at namumulang impeksiyon sa balat na dulot ng baradong glandula ng pawis o buhok, nagdudulot ng pamamaga at pag-ipon ng nana.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Malek',
      translation: 'Pihikan',
      definition:
          ' hindi madaling masiyahan at maingat sa pagpili ng mga bagay, pagkain, o kasama, pati na rin mapanuri sa pagpapasya o pagtanggap ng anumang inaalok.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Firang',
      translation: 'Pikit',
      definition:
          'hindi bukas o walang kakayahang makakita dahil magkadikit at takip ang mga talukap ng mata.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Danfi',
      translation: 'Pikpik',
      definition:
          'paraan ng pagbabawas sa laki o dami ng isang bagay sa pamamagitan ng pagpiga o pagdiin upang patibayin o paliitin ang espasyo nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Starol',
      translation: 'Pila',
      definition:
          'isang organisadong pagkakasunod-sunod ng mga tao o bagay na naghihintay para sa kanilang turno, karaniwan sa pagbili ng produkto o pagtanggap ng serbisyo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sag',
      translation: 'Pilay',
      definition:
          ' isang kondisyon o pinsala sa kalamnan o kasukasuan dahil sa biglaan o maling kilos, na nagdudulot ng sakit, hirap sa paggalaw, at limitasyon sa paggamit ng apektadong bahagi ng katawan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Klubeng',
      translation: 'Pilikmata',
      definition:
          ' mahahaba at manipis na hibla ng buhok sa itaas at ibaba ng mata, nagpoprotekta laban sa alikabok at tumutulong sa pagpapahayag ng emosyon. ',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fages / Agnaga',
      translation: 'Pinipilit',
      definition:
          'gumamit ng labis na kapangyarihan, awtoridad, o matinding presyon upang magawa ng isang tao ang isang aksyon laban sa kanyang kalooban o desisyon.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Fages',
      translation: 'Pilit',
      definition:
          'ang paggawa o pagsasabi ng isang bagay na hindi natural o kusang-loob, may diin, at isinasagawa kahit walang gana o interes.',
      partOfSpeech: 'pangngalan / pang-uri / pang-abay',
    ),
    DictionaryEntry(
      word: 'Gu bamli',
      translation: 'pinagbilhan',
      definition:
          'ang proseso o aktong ginagawa ng pag-aalok o pagbebenta ng produkto o serbisyo kapalit ng pera o ibang bagay sa ibang tao o lugar.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Gu fimu',
      translation: 'pinagkurusan',
      definition:
          'lugar ng pagtatagpo ng dalawang daan o simbolo ng krus na ginagamit sa relihiyon at bilang alaala sa mahalagang pangyayari.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'To o',
      translation: 'Pinaka',
      definition:
          'ginagamit upang ipakita ang sukdulang antas ng isang katangian, aksyon, o pangyayari, na higit o sobra sa lahat kumpara sa iba.',
      partOfSpeech: 'Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Fnindot',
      translation: 'Pindot',
      definition:
          'pagdiin, pagtapik, o maikling pagpisil gamit ang daliri sa isang bagay, tulad ng pindutan o touchscreen, upang makagawa ng aksyon o tugon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fligo',
      translation: 'Pinggan',
      definition:
          'isang lalagyan na karaniwang gawa sa porselana, plastik, o metal, ginagamit sa paghahain at pagkain ng lutuin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Malmo',
      translation: 'Pinsala',
      definition:
          'kalagayan o resulta ng pagkasira, pagkawasak, o negatibong epekto sa kalusugan, ari-arian, o kalagayan ng isang bagay, lugar, o tao dahil sa isang pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lanmo',
      translation: 'Pinsalain',
      definition:
          'nagdudulot ng sira, kapahamakan, o pagkawasak sa mga bagay, kalikasan, o buhay, at may kakayahang magpabagsak ng anuman sa kanyang landas.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tinta',
      translation: 'Pintura',
      definition:
          'isang likidong substansiya o materyal na ginagamit sa pagbibigay kulay, proteksyon sa ibabaw, at sa paglikha ng mga dibuho at imahe sa iba t ibang surface.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Anfuk',
      translation: 'Pinukpok',
      definition:
          ' ang paghataw o paghampas sa isang bagay gamit ang matigas na bagay at puwersa upang ito ay magbago ng anyo o magkaroon ng marka.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Bong fulong',
      translation: 'Pinuno',
      definition:
          'taong may kapangyarihan at responsibilidad na manguna, gumabay, at magpasya para sa kabutihan ng isang grupo o organisasyon bilang ulo nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fandan',
      translation: 'Pinya',
      definition:
          'isang tropikal na prutas na may matigas na berdeng dahon sa tuktok, magaspang na balat na dilaw at kayumanggi, at matamis-maasim na laman, tumutubo sa mainit na lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Maw',
      translation: 'Pipi',
      definition:
          'isang taong hindi makapagsalita o may kapansanan/kondisyon na naglilimita sa kakayahang magbigay ng tinig.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Batu',
      translation: 'Piraso',
      definition:
          ' isang maliit na bahagi o dami ng isang mas malaking bagay na maaaring hiwa-hiwalay, tulad ng pagkain, tela, yelo, bato, o papel.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Firma',
      translation: 'Pirma',
      definition:
          'isang natatanging simbolo o markang isinusulat ng isang tao sa mga dokumento bilang pagpapatunay ng pagkakakilanlan at pagsang-ayon sa nilalaman nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gusmulat',
      translation: 'Pisara',
      definition:
          'isang patag, karaniwang itim o berdeng ibabaw sa mga silid-aralan na ginagamit sa pagsulat o pagguhit gamit ang tisa para ipakita ang mga leksyon at impormasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kanmas',
      translation: 'Pisil',
      definition:
          'aksyon ng paghawak at pagdidiin gamit ang daliri at palad upang maglabas ng laman, likido, o ipahayag ang pagmamahal o suporta.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mukom',
      translation: 'Piskal',
      definition:
          ' tumutukoy sa usaping pananalapi, pagkolekta, paggasta, at pamamahala ng pondo at ari-arian ng pamahalaan o organisasyon.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fifi',
      translation: 'Pisngi',
      definition:
          'bahagi ng mukha sa magkabilang gilid ng ilong at labi, na nagiging pulang-pula dahil sa hiya o tuwa, at kadalasang hinahalikan bilang tanda ng pagmamahal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kastifun',
      translation: 'Pista',
      definition:
          'isang opisyal na pagdiriwang o okasyon na may kasamang pagkain, inumin, musika, sayawan, at iba pang anyo ng kasiyahan, ginaganap upang parangalan ang isang mahalagang pangyayari, tradisyon, o patron.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kaltira',
      translation: 'Pitaka',
      definition:
          'isang maliit na lalagyan, karaniwang gawa sa tela o balat, para sa pag-iingat ng pera, mga kard, at personal na dokumento.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Natok',
      translation: 'Pitas',
      definition:
          ' ang pagkuha o pag-ani ng bunga, bulaklak, o anumang bahagi mula sa puno o halaman sa kanyang natural na paglaki.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fnintik',
      translation: 'Pitik',
      definition:
          'isang mabilis at magaang pagtama o hampas gamit ang daliri, karaniwang para magpadala ng bagay, signal, o bilang pagpapansin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Few',
      translation: 'Pito',
      definition:
          'ang bilang na sumusunod sa anim at nauna sa walo, isa sa mga pangunahing numero sa pagbilang at pagtukoy ng dami.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Nga fligo',
      translation: 'Platito',
      definition:
          ' isang maliit na bilog na lalagyan, ginagamit bilang saluhan ng tasa o baso at sa paghahain ng pampagana o meryenda.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fobli',
      translation: 'Pobre',
      definition:
          'isang tao na walang sapat na pera, ari-arian, at nakararanas ng hindi magandang kondisyon o kulang sa kalidad na pamumuhay.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kulit kama',
      translation: 'Ponda',
      definition:
          'isang pansamantalang tindahan o puwesto na itinatayo tuwing fiesta o espesyal na okasyon upang magbenta ng mga produkto o serbisyo sa mga dumadalo.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Too adnile',
      translation: 'Popular',
      definition:
          'gustong-gusto at madalas kilala o tinatangkilik ng nakararami; kinagigiliwan ng maraming tao.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Blanggo',
      translation: 'Preso',
      definition:
          'isang indibidwal na hinatulan at kasalukuyang nakakulong dahil sa paglabag sa batas o paggawa ng krimen.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fafun',
      translation: 'Prutas',
      definition:
          'isang matamis o maasim na bunga na karaniwang kinakain nang sariwa at nagtataglay ng mga bitamina at mineral.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Abtas',
      translation: 'Presyo',
      definition:
          'halaga o kabuuang kailangang ibigay bilang kapalit ng produkto o serbisyo upang ito y makamit o magamit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Atnarag',
      translation: 'Prinsipyo',
      definition:
          ' isang matatag na batayang paniniwala o pamantayan na ginagamit bilang gabay sa asal, paggawa ng desisyon, at pagkilos ng isang tao o samahan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fablima',
      translation: 'Problema',
      definition:
          'isang sitwasyon o katanungan na nangangailangan ng solusyon o pag-aaral dahil sa pagkabahala, pagkagambala, o pagiging mahirap lutasin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Magket',
      translation: 'Progreso',
      definition:
          ' ang patuloy na pag-unlad at pagbuti mula sa isang estado patungo sa mas mataas na kalagayan sa pamamagitan ng paggawa ng hakbang pasulong para makamit ang mga layunin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tamdu',
      translation: 'Propesor',
      definition:
          'isang eksperto sa tiyak na larangan na nagtuturo, nagbibigay kaalaman, at gumagabay sa mga estudyante sa kolehiyo o unibersidad.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fulal',
      translation: 'Pugad',
      definition:
          'lugar o tirahan, karaniwan sa mataas na puno o nakatago sa mga sanga, kung saan inilalagay ng mga ibon o hayop ang kanilang itlog at inaalagaan ang kanilang mga anak. ',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Galwa',
      translation: 'Pugante',
      definition:
          ' isang taong tumatakas o nagtatago mula sa batas dahil sa krimen, nagtataglay ng katangian ng pag-iwas upang hindi mahuli o maparusahan.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kafital',
      translation: 'Puhunan',
      definition:
          'halaga o ari-arian na inilalaan para simulan o palaguin ang negosyo o proyekto, na may layuning kumita.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nukat',
      translation: 'Pukaw',
      definition:
          'ang estado ng pagiging gising mula sa pagtulog o ang pagkakaroon ng gising na damdamin o interes sa isang bagay o pangyayari.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Sugen',
      translation: 'Pukyutan',
      definition:
          'matamis na likido na gawa ng mga bubuyog mula sa nektar ng bulaklak, ginagamit bilang pampatamis at kilala sa benepisyong pangkalusugan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fule',
      translation: 'Pula',
      definition:
          'isang kulay na katulad ng dugo o apoy at nasa spectrum ng ilaw sa pagitan ng orange at violet.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Fulis',
      translation: 'Pulis',
      definition:
          'miyembro ng organisadong grupo na sinanay para sa pagpapanatili ng kaayusan, pagpapatupad ng batas, at pagbibigay proteksyon sa komunidad sa pamamagitan ng pag-iwas at paglutas ng mga krimen.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kastifun',
      translation: 'Pulong',
      definition:
          ' isang pagtitipon ng dalawa o higit pang tao o miyembro ng grupo para talakayin ang mahahalagang paksa, plano, o agenda.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Baluso',
      translation: 'Pulseras',
      definition:
          'isang alahas na isinusuot sa pulso o bisig, yari sa ibat ibang materyales tulad ng metal, plastik, tela, o butil at bato, para sa palamuti o personal na ekspresyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Slabed',
      translation: 'Pulupot',
      definition:
          'ang aksyon ng pag-ikot o pagbalot ng isang bagay sa paligid ng iba pa upang mahigpit na makapit at hindi makagalaw, tulad ng ginagawa ng sawa sa biktima.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Mati',
      translation: 'Pumanaw',
      definition:
          'umalis sa mundo ng mga buhay o maglaho nang tuluyan; ang pagtigil ng buhay.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Anngak',
      translation: 'Puna',
      definition:
          'isang opinyon o komento na nagpapahayag ng obserbasyon o kritisismo, karaniwang may layuning ituro ang mga aspetong nangangailangan ng pagbabago o pagpapabuti.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nifu',
      translation: 'Punas',
      definition:
          'isang piraso ng tela o espongha na ginagamit sa pag-alis ng dumi o likido, at sa pagtuyo ng basang katawan o bagay sa ibat ibang ibabaw.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kulit kama',
      translation: 'Punda',
      definition:
          'tela o kasuotan na ginagamit upang takpan at protektahan ang unan mula sa dumi at alikabok.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Mungay',
      translation: 'Pungay',
      definition:
          'ang kalagayan o paglalarawan ng mga mata na malamlam at kaakit-akit, nagpapahiwatig ng pagod, kalungkutan, o malalim na emosyon tulad ng pagmamahal, na may taglay na misteryo o pang-aakit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kase',
      translation: 'Punit',
      definition:
          'isang butas o hiwa sa tela, papel, o iba pang bagay, na resulta ng paghatak, pagkakabig, o di sinasadyang paghihiwalay ng mga parte nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fno',
      translation: 'Puno',
      definition:
          'walang bakanteng espasyo, sagana at umaapaw sa dami o laki, hindi kulang sa nilalaman.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Buntod',
      translation: 'Punso',
      definition:
          'maliit na tambak ng lupa o buhangin, natural na burol na tinitirhan o ginagawa ng mga langgam at iba pang insekto.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gufdo / gumda',
      translation: 'Puno',
      definition:
          'umabot sa sukdulan ang laman, dami, o mawalan ng espasyo; maramdaman ang labis na pagkainis o pagkasawa sa sitwasyon, gawain, o asal.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Kayu',
      translation: 'Puno',
      definition:
          'isang malaking halaman na may matigas na tangkay o trunk, sanga, at dahon, nakatayo sa lupa at sumusuporta sa mga sanga at dahon nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gusnge / Gusalo',
      translation: 'Punta',
      definition: 'pagkilos o pagtungo sa isang tiyak na lugar o destinasyon.',
      partOfSpeech: 'Pandiwa / Pangngalan',
    ),
    DictionaryEntry(
      word: 'Atnurak',
      translation: 'puntirya',
      definition:
          'ang bagay, lugar, o layunin na nais abutin, tamaan, o makamtan sa pamamagitan ng paghagis, pagpapana, pagbaril, o pagsisikap sa ibat ibang larangan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dayen',
      translation: 'Puri',
      definition:
          'pagkilala at pagpapahayag ng mga salita ng paghanga o paggalang sa kabutihan o kagalingan ng isang tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Magdayen',
      translation: 'Purihan',
      definition:
          'bigyan ng positibong pagkilala at itaas ang dignidad ng isang tao o bagay sa pamamagitan ng paghanga dahil sa kanilang katangian, nagawa, o kahusayan.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Slame',
      translation: 'Puro',
      definition:
          'walang halong ibang sangkap o elemento at binubuo lamang ng isang uri nang walang idinagdag; dalisay.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Banwe',
      translation: 'Purok',
      definition:
          'isang maliit na bahagi ng barangay na may kanya-kanyang pagkakakilanlan, hangganan, at lugar kung saan nakatira ang grupo ng mga tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Koko',
      translation: 'Pusa',
      definition:
          'isang maliit na domestikadong mamalya na may apat na paa, mahabang buntot, at karaniwang maikling balahibo, kilala sa pagiging alaga at kahusayan sa paghuli ng daga.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Galwa',
      translation: 'Puslit',
      definition:
          'iligal na pagpasok o paglabas ng mga bagay sa isang lugar nang walang permiso at mabilis, lihim na pagkilos upang maiwasan ang pagkahuli o pagtuklas.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fufung',
      translation: '',
      definition:
          'ang organ sa dibdib na nagpapadaloy ng dugo sa katawan at simboliko rin ng damdamin, pag-ibig, o emosyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fusad / Blutot',
      translation: 'Pusod',
      definition:
          'butas o guhit sa gitnang tiyan na naiwan matapos maputol ang umbilical cord, o pinakamalalim na bahagi ng ilog o dagat na tahimik at hindi naaapektuhan ng alon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Klulong',
      translation: 'Puson',
      definition:
          'bahagi ng katawan sa pagitan ng dibdib at balakang, sa ibaba ng rib cage at itaas ng hita, kung saan naroon ang tiyan at iba pang mahahalagang organo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fagten',
      translation: 'Postura',
      definition:
          'paraan ng pagtayo o pag-upo na nagpapakita ng ayos at pagkakalagay ng katawan, na maaaring magpahiwatig ng kumpiyansa o kawalan nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bol',
      translation: 'Putahe',
      definition:
          'pagkain na inihahanda at ihinahain sa kainan o espesyal na okasyon, at isa sa mga pagkaing bumubuo ng meal sa hapag-kainan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kmakak',
      translation: 'Putak',
      definition:
          ' isang uri ng malakas at sunod-sunod na tunog mula sa manok o iba pang ibon, bilang pagpapahayag ng damdamin o komunikasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fwidi / Fakay',
      translation: 'Puwede',
      definition:
          ' nangangahulugan ng pagkakaroon ng kakayahan, pahintulot, o posibilidad para sa isang tao, bagay, sitwasyon, o kalagayan na isagawa, mangyari, o matupad ang isang kilos o pangyayari.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Tabya',
      translation: 'Puwera',
      definition:
          'ginagamit upang ipahiwatig ang pagiging maliban o hindi kasama sa isang bilang, grupo, saklaw, o kategorya.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Akgis',
      translation: 'Puwersa',
      definition:
          'kakayahang o antas ng enerhiya na magdulot ng pagbabago o paggalaw sa isang bagay o sitwasyon sa pamamagitan ng paggawa ng aksyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Glal',
      translation: 'Puwesto',
      definition:
          'lugar o espasyo na may tiyak na layunin, maaaring para sa pagtinda o pag-upo, o ranggo ng isang tao sa grupo o organisasyon batay sa kapangyarihan o kahalagahan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fuling',
      translation: 'Puwing',
      definition:
          'maliit na partikulo o dumi na hindi sinasadyang nakapasok sa mata, nagdudulot ng iritasyon, pangangati, o pagluha.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Akok / Kwang',
      translation: 'Puwit',
      definition:
          'bahagi ng katawan sa ibaba ng likod at itaas ng hita, ginagamit sa pag-upo ng tao o hayop.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Pulaw',
      translation: 'Puyat',
      definition:
          'kulang sa tulog o hindi nakatulog nang sapat, nagdudulot ng pagod, hirap sa paggising, at kahirapan sa pag-concentrate.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Ladyo',
      translation: 'Radyo',
      definition:
          'aparato para sa pagtanggap ng signal na naglalaman ng balita, musika, at iba ibang programa, na ipinapadala sa pamamagitan ng alon, para sa pakikinig sa mga broadcast mula sa malalayo na lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kafbawe',
      translation: 'Reaksyon',
      definition:
          'tugon o pagbabagong nagaganap bilang resulta sa isang bagay, sitwasyon, aksyon, proseso, o kaganapan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Le Malek',
      translation: 'Reeleksyon',
      definition:
          'proseso o pangyayari sa halalan kung saan ang kasalukuyang opisyal ay maaaring manatili sa puwesto sa pamamagitan ng muling pagkakahalal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kel bulen',
      translation: 'Regla',
      definition:
          'isang hanay ng alituntunin na dapat sundin o ang buwanang daloy ng dugo mula sa matris ng babae, karaniwang tumatagal ng ilang araw.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bol',
      translation: 'Rekado',
      definition:
          'sangkap o elemento na idinadagdag sa pagkain o gawain upang magbigay ng lasa, aroma, o upang kumpletuhin ang pagbuo nito.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kalmamo',
      translation: 'Reklamo',
      definition:
          'isang pahayag ng hindi pagkakasundo, pagkadismaya, o hindi kasiyahan tungkol sa tao, produkto, serbisyo, o sitwasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lilos',
      translation: 'Relos',
      definition:
          'aparatong isinusuot sa pulso o dala-dala, ginagamit para malaman ang oras.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lisibo',
      translation: 'Resibo',
      definition:
          'isang dokumento na nagpapatunay ng transaksyon, nagtatala ng mga detalye tulad ng halaga, petsa, at lugar, at nagsisilbing katibayan ng pagbili o pagbayad ng serbisyo o produkto.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Bulek',
      translation: 'Rosas',
      definition:
          'isang uri ng bulaklak na kilala sa magandang amoy, mahahabang tinik, at iba ibang kulay, kabilang ang isang kulay na simbolo ng pagmamahal.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Saging',
      translation: 'Saba',
      definition:
          'uri ng saging sa Pilipinas na ginagamit sa pagluluto at panghimagas, kilala sa matamis at malapot na laman kapag niluto, at mahalagang sangkap sa kusinang Pilipino.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bool',
      translation: 'Sabaw',
      definition:
          'uri ng malabnaw na likidong pagkain mula sa pinakuluang tubig na may karne, isda, gulay, o iba pang sangkap, hinahain bilang pampagana o kasama ng ulam.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Slago / Salngan',
      translation: 'Sabay',
      definition:
          'nangyayari o ginagawa sa parehong oras; nagsasama o nagkakasama sa isang gawain o pangyayari.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Gal man',
      translation: 'Sabi-sabi',
      definition:
          'mga kuwento o impormasyong kumakalat na walang konkretong ebidensya o tiyak na katotohanan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sdang',
      translation: 'Sabit',
      definition:
          'isang bagay o tao na hindi mahigpit na nakakabit o nakalawit, o di-opisyal na kasama o kaakibat sa grupo o aktibidad ngunit nakikisama.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gu sandang',
      translation: 'Sabitan',
      definition:
          'aparato o kagamitan na naka-angkla sa pader o kisame, ginagamit sa pagbitay ng mga gamit tulad ng damit, susi, at dekorasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Samok',
      translation: 'Sagabal',
      definition:
          'isang bagay, sitwasyon, hadlang, o balakid na nakakapigil o nakakapabagal sa pagtupad ng layunin o pangarap.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gadsal',
      translation: 'Sagad',
      definition:
          ' hanggang sa pinakadulo o sukdulan, ginamit o ginugol nang buo na walang natitira o wala nang maidadagdag.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Syan',
      translation: 'Saglit',
      definition:
          'isang maikling panahon o sandaling pagitan na halos hindi napapansin dahil sa mabilis na paglipas, kung saan maaaring maganap ang isang pangyayari.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Saal',
      translation: 'Sahig',
      definition:
          ' ibabaw na bahagi ng gusali o kuwarto na direktang kinakalakihan at ginagamitang maglakad, maglagay ng mga kasangkapan, at iba pa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bhol',
      translation: 'Sahog',
      definition:
          ' mga sangkap o bagay na idinaragdag sa pagkain o timpla upang magdagdag ng lasa, kulay, nutrisyon, o mapahusay ang kalidad at panlasa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fanlang',
      translation: 'Sakal',
      definition:
          'kawalan ng kakayahang huminga o makagalaw dahil sa mahigpit na pagkakahawak o bagay na nakapalibot sa leeg, na pumipigil sa daloy ng hangin.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Sbi / tiwan',
      translation: 'Sakim',
      definition:
          'taong laging nagnanais ng higit pa para sa sarili, nagpapakita ng labis na pagnanasa sa yaman at ayaw itong ibahagi sa iba.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Tamdok',
      translation: 'Sakit',
      definition:
          'kondisyon o sensasyon na nagdudulot ng hindi magandang pakiramdam o karamdaman sa katawan o isipan, maaring dulot ng impeksyon, pinsala, o ibang medikal na kondisyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tugad',
      translation: 'Saklay',
      definition:
          'aparatong yari sa kahoy o metal na suporta sa ilalim ng kili-kili o hawak sa kamay, ginagamit upang tulungan ang paglalakad ng may kapansanan o pinsala.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Aftabeng',
      translation: 'Saklolo',
      definition:
          'isang panawagan o tulong na ibinibigay sa isang tao sa oras ng kagipitan, peligro, o pangangailangan ng agarang pagligtas.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amkel / Agbuno',
      translation: 'Sakuna',
      definition:
          'isang hindi inaasahang malubhang pangyayari na nagdudulot ng malawakang pinsala, pagkawala, at paghihirap.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fantas',
      translation: 'Sala',
      definition:
          'bahagi ng bahay para sa mga bisita at pang-araw-araw na pamumuhay; o isang kondisyon kung saan may nagawang mali na maaaring magdulot ng pinsala o kaparusahan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Asbool',
      translation: 'Salamuha',
      definition:
          'ang proseso ng pakikihalubilo at pakikipag-ugnayan sa iba upang palawakin ang kaalaman, sosyal na koneksyon, at pakikipagkapwa.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Filak',
      translation: 'Salapi',
      definition:
          'paraan ng palitan at yunit ng pambayad sa anyo ng papel at barya para sa mga kalakal at serbisyo, karaniwang tinatanggap sa lahat ng transaksyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lande',
      translation: 'Salat',
      definition:
          'kulang sa yaman, ari-arian, dami, o kalidad; mahirap o hindi sapat ang pagkakaroon ng kailangan.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Salwal',
      translation: 'Salawal',
      definition:
          ' isang panloob na kasuotan na nagbibigay proteksyon at kaginhawaan, sumasaklaw mula baywang hanggang hita, at isinusuot sa ilalim ng pang-ibabaw na damit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tulen',
      translation: 'Salaysay',
      definition:
          'isang pahayag o ulat, pasalita man o pasulat, na detalyadong naglalahad ng mga pangyayari o karanasan, batay sa totoong buhay o kathang-isip.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Magot ukom',
      translation: 'Saligang-batas',
      definition:
          'ang pinakamahalagang dokumento na nagbabalangkas sa paggawa ng batas, istraktura ng pamahalaan, at nagtatakda ng mga prinsipyo, polisiya, karapatan, at responsibilidad ng mga mamamayan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tufi / Tlas',
      translation: 'Salin',
      definition:
          'proseso ng paglipat o paggawa ng kaparehong bersyon ng nilalaman, akda, dokumento, o larawan mula sa isang wika o anyo patungo sa iba.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Man / Talo',
      translation: 'Salita',
      definition:
          'pangkat ng mga titik na nagpapahayag ng kahulugan at paraan ng pagpapahayag ng kaisipan o damdamin, maaaring sa pasalita o pasulat.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Agsitong',
      translation: 'Salubong',
      definition:
          'isang pagtitipon o seremonya ng mainit na pagtanggap at pagpapakita ng kagalakan sa isang tao o grupo na dumating mula sa paglalakbay o sa mga bisita.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nagin',
      translation: 'Samahan',
      definition:
          'ang pagiging kasama o katuwang ng isang tao sa pagtungo sa lugar o sa anumang gawain o sitwasyon.',
      partOfSpeech: 'Pandiwa',
    ),
    DictionaryEntry(
      word: 'Alwe ni',
      translation: 'Samahan',
      definition:
          'isang organisadong pangkat ng mga tao na nagtitipon at nagtutulungan para sa tiyak na layunin, gawain, o interes, at upang makamit ang kanilang mga adhikain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Man',
      translation: 'Sambit',
      definition:
          'ang maikli o sandaling pagbigkas o pagpapahayag ng mga salita mula sa bibig.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Adnafi',
      translation: 'Sampal',
      definition:
          ' isang mabilis at malakas na hampas gamit ang palad sa mukha o katawan, bilang pagpapakita ng galit, disiplina, o matinding emosyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kafaglut',
      translation: 'Sampalataya',
      definition:
          'ang pagtitiwala o debosyon sa isang bagay, prinsipyo, o tao nang walang kinakailangang patunay o ebidensya.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Fifat',
      translation: 'Sampay',
      definition:
          'paraan ng pagpapatuyo ng labada sa labas ng bahay sa pamamagitan ng paglalagay nito sa alambre o lubid na nakabitin pahalang.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sfalu',
      translation: 'Sampu',
      definition:
          'ang bilang na sumusunod sa siyam at katumbas ng dalawang beses ng lima, nagpapakita ng kabuuan kapag nagdagdag ng isa pagkatapos ng siyam.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Gambet',
      translation: 'Sanay',
      definition:
          'gawain o ehersisyo na madalas inuulit upang magkaroon ng kasanayan at husay sa isang larangan, o paghahanda sa sarili sa pamamagitan ng paulit-ulit na kilos.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Too fulong',
      translation: 'Sanay',
      definition:
          'may kasanayan at kagalingan sa isang gawain o larangan dahil sa madalas na pag-aaral o paulit-ulit na paggawa, nagpapakita ng tiwala sa bawat kilos.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Kalbong banwe',
      translation: 'sandaigdigan',
      definition:
          'ang kabuuan ng umiiral na mga lugar, bagay, lupa, dagat, kalangitan, at nilalang, kung saan naninirahan at nagpapalipat-lipat ang lahat ng tao at hayop.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fagled',
      translation: 'Sandal',
      definition:
          'pagkilos ng pagpapatong ng bahagi ng katawan sa isang bagay para sa pansamantalang suporta o pahinga, o umaasa sa ibang bagay para sa suporta.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Bhol',
      translation: 'Sangkap',
      definition:
          'isa sa mga bahagi o elemento na kinakailangan at pinagsasama-sama sa paggawa ng produkto o pagluluto upang makabuo ng isang bagay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gagin / Aglam',
      translation: 'Sangkot',
      definition:
          'ang pagkakaroon ng kinalaman, pagiging bahagi, o kasama sa isang pangyayari, sitwasyon, o gawain na maaaring magdulot ng responsibilidad o akusasyon.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Duen',
      translation: 'Sanhi',
      definition:
          'ang ugat o dahilan kung bakit nangyari ang isang pangyayari, sitwasyon, o ginawang aksyon o desisyon ng isang tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sasatu',
      translation: 'Sanib',
      definition:
          ' ang proseso ng pagtutugma o pagkakasundo ng dalawa o higit pang elemento upang magkapatong o magkaisa sa layunin, anyo, o maging isa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sanda',
      translation: 'Sangla',
      definition:
          'proseso ng paglalagak ng mahahalagang bagay bilang garantiya sa pagtupad ng obligasyon o pagbabayad ng utang sa isang tao o institusyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Santul',
      translation: 'Santol',
      definition:
          'isang tropikal na prutas na may dilaw o kahel na balat at malambot, mabuhok na puting laman, ginagamit sa pagluluto at paggawa ng inumin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Laweh eel',
      translation: 'Sapa',
      definition:
          ' isang maliit na anyong tubig na natural na dumadaloy mula sa mataas na lugar patungo sa ibaba, karaniwang mas mababa sa ilog sa laki at matatagpuan sa mga nayon o kabundukan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Duen an',
      translation: 'Sapagkat',
      definition:
          'dahil sa; bunga ng katotohanang; bilang resulta ng; sa dahilang',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Gabla / Tatong',
      translation: 'Sapat',
      definition:
          'hindi kulang o sobra, akma at tugma lamang sa kinakailangang dami o sukat ng pangangailangan.',
      partOfSpeech: 'Pang-uri / Pang-abay',
    ),
    DictionaryEntry(
      word: 'Afnages',
      translation: 'Sapilitan',
      definition:
          'isang aksyon o kondisyon na hindi maaring tanggihan o iwasan at kailangang sundin o gawin ayon sa utos, patakaran, o sitwasyon nang walang pagpipilian.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Slafad',
      translation: 'Sapin',
      definition:
          'materyal o bagay na inilalagay sa ilalim ng iba upang magbigay proteksyon, dagdag na suporta, o gawing mas komportable.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Saol',
      translation: 'Saplot',
      definition:
          'mga damit na hindi na malinis, maaaring sira-sira, at hindi na kaaya-aya tingnan dahil sa dumi o kalumaan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Uten',
      translation: 'Sapsap',
      definition:
          'isang uri ng maliit at patag na isda, may bilog na katawan, lumalaki hanggang 10 sentimetro, kilala rin bilang ponyfish o slipmouth, at karaniwang matatagpuan sa mainit na tubig.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Fye Nem',
      translation: 'Sarap',
      definition:
          'ang katangian o kalidad ng pagkain, inumin, o anumang bagay na nagdudulot ng malakas na kasiyahan at positibong reaksyon sa panlasa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Saldinas',
      translation: 'Sardinas',
      definition:
          ' isang maliit na isda na karaniwang inaasinan, pinoproseso, at iniimbak sa lata kasama ng langis o sarsa, may mataas na halaga ng nutrisyon, at ginagamit sa ibat ibang luto.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Aktoh',
      translation: 'Sarili',
      definition:
          'tumutukoy sa pagkakakilanlan o pag-aari na eksklusibo sa isang indibidwal, bigyang-diin ang aksyon o pag-aaring walang kinalaman ang iba.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Fion',
      translation: 'Sari-sari',
      definition:
          'tumutukoy sa koleksyon o grupo ng ibat ibang uri o klase ng mga bagay na magkakaiba at pinagsama-sama.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Snakay',
      translation: 'Sasakyan',
      definition:
          'aparato o transportasyong de-motor o hindi, tulad ng kotse, motorsiklo, bisikleta, o trak, na ginagamit sa mas mabilis na paglalakbay o paglipat mula sa isang lugar patungo sa iba.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tmakas',
      translation: 'Sawa',
      definition:
          ' ang pakiramdam ng labis na pagkasuklam, pagkainis, o pagkapoot dahil sa matinding pagkadismaya o paulit-ulit na karanasan sa isang bagay o sitwasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ulad',
      translation: 'Sawa',
      definition:
          ' isang malaki at mahabang ahas na walang paa, kilala sa pagyakap at pagpiga sa biktima hanggang mamatay bago kainin, kadalasang matatagpuan sa gubat.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Anngak',
      translation: 'Saway',
      definition:
          'isang pagpapahayag o pagbabawal na may kasamang pagtutuwid sa maling kilos o salita ng isang tao, na nagpapakita ng hindi pagsang-ayon o pagtutol.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lahew',
      translation: 'Saya',
      definition:
          'kalagayan o damdamin ng pagiging masigla, puno ng ligaya, kagalakan, at kasiyahan na nararamdaman ng isang tao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kabas',
      translation: 'Sayang',
      definition:
          'pagpapahayag ng paghihinayang o lungkot sa isang bagay o oportunidad na hindi napakinabangan, nagamit nang maayos, o nawala, nagresulta sa pagkawala o pagkasira.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Sayew',
      translation: 'Sayaw',
      definition:
          'isang sining o libangan kung saan ang katawan ay gumagalaw sa ritmo, karaniwang may kasamang musika, upang ipahayag ang damdamin o para sa seremonyal na layunin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mlabe',
      translation: 'Selos',
      definition:
          'isang damdamin ng pagkabalisa o hindi pagkakuntento na nararamdaman dahil sa takot na mawala ang atensyon o pagmamahal ng isang mahalaga sa iba.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Ugak / Amngak',
      translation: 'Sermon',
      definition:
          ' isang pagsasalita o pagpapahayag na naglalayong magbigay ng aral, gabay, o babala sa tamang asal at moralidad, karaniwang mula sa isang awtoridad.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Kana',
      translation: 'Si',
      definition:
          'pantukoy na ginagamit bago ang pangalan ng tao upang ipakilala o tukuyin ang tiyak na indibidwal.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amkah',
      translation: 'Sibak',
      definition:
          ' paghihiwa-hiwalay o pagpuputol ng kahoy gamit ang palakol; o pakikipagtalik sa kapareha.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Mili / Flanah',
      translation: 'Sibat',
      definition:
          'isang mahabang sandata na may talim sa dulo, ginagamit sa pangangaso at pakikipaglaban, at salitang nagpapahayag ng mabilis o biglaang pag-alis.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amkit',
      translation: 'Sigaw',
      definition:
          'malakas na paglabas ng boses para ipahayag ang matinding damdamin, emosyon, o pagsusumamo, at paghingi ng pansin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nasen',
      translation: 'Sige',
      definition:
          'pahintulot o pagpapahayag ng pagsang-ayon sa pagpapatuloy ng isang gawain, mungkahi, o alok.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Fakgis',
      translation: 'Sikap',
      definition:
          'ang sikap ay ang masikap na pagtatrabaho at pagiging masipag may inisyatiba sa paggawa upang matamo ang layunin o nais na resulta sa pamamagitan ng pagpupunyagi.',
      partOfSpeech: 'Pangngalan / Pang-uri',
    ),
    DictionaryEntry(
      word: 'Gaflo',
      translation: 'Sikmura',
      definition:
          'bahagi ng katawan kung saan nagaganap ang pagtunaw ng pagkain, na kumukulo kapag nagugutom at sumasakit kapag may nararamdamang hindi maganda sa kinain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Masgat',
      translation: 'Siksik',
      definition:
          ' mahigpit at masinsin na walang puwang o espasyo sa pagitan ng mga laman o bagay, puno sa isang maliit na espasyo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dale',
      translation: 'Sila',
      definition:
          'tumutukoy sa grupo ng mga tao, hayop, o bagay na hindi kasali ang kausap o tagapagsalita, bilang paksa o bagay ng pangungusap.',
      partOfSpeech: 'Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Gu sot doh',
      translation: 'Silangan',
      definition:
          ' isa sa apat na pangunahing direksyon, kung saan sumisikat ang araw at kabaligtaran ng kanluran.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Slamen Dakeh',
      translation: 'Sila-sila',
      definition:
          'tumutukoy sa eksklusibong grupo o samahan kung saan ang interaksiyon o gawain ay nakalaan lamang para sa mga kasapi nito, hindi kasama ang iba.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Malah',
      translation: 'Sili',
      definition:
          'isang uri ng halaman at ang bunga nito na kilala sa matinding anghang, ginagamit bilang pampalasa sa pagkain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lam',
      translation: 'Silid',
      definition:
          ' isang espasyo sa loob ng gusali o bahay na may dingding at pintuan, ginagamit sa ibat ibang gawain tulad ng pagtulog, pag-aaral, o pagtatrabaho.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gu Sureng',
      translation: 'Silya',
      definition:
          'kasangkapan na may apat na paa at likodang suporta para maupoan, karaniwang ginagamit sa tahanan, opisina, paaralan, at iba pang pampublikong lugar.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lam albang',
      translation: 'Sementeryo',
      definition:
          'isang lugar o pook kung saan inililibing o panghantungan ng mga labi ng mga yumao.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amgimat',
      translation: 'Simot',
      definition:
          'ang kalagayan kung saan walang natira at nakonsumo na ang lahat hanggang sa huling patak o piraso.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Gumda',
      translation: 'Simula',
      definition:
          'punto o lokasyon kung saan unang naganap, umiral, o nag-umpisa ang isang bagay, pangyayari, kaganapan, o aktibidad.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dusafda',
      translation: 'Simulain',
      definition:
          'ang mga paniniwala o ideya na nagsisilbi bilang pundasyon at gabay sa pag-uugali at pagpapasya, sumasalamin sa pinahahalagahan at adhikain.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ala',
      translation: 'Sina',
      definition:
          'pantukoy na ginagamit bago ang pangalan ng higit sa isang tao na tinutukoy o binabanggit sa pangungusap.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Knaan tnaga',
      translation: 'Sinaing',
      definition:
          'pagkain mula sa bigas na niluto sa pamamagitan ng pagbabad at paglalaga sa tubig hanggang sa ito ay maging malambot at handa nang kainin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Lam tien',
      translation: 'Sinapupunan',
      definition:
          ' bahagi ng katawan ng babae na pinagmumulan at kinalalagyan ng buhay, kung saan maaaring magdalang-tao at lumaki ang sanggol bago isilang.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Munan',
      translation: 'Sinauna',
      definition:
          'tumutukoy sa mga tao, kultura, o panahon na nagmula sa napakalayong nakaraan, bago pa naitala ang kasaysayan, ilang libong taon na ang nakalilipas.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Sanilas',
      translation: 'Tsinelas',
      definition:
          'uri ng sapin sa paa na bukas ang likuran, gawa sa goma o plastik, madaling isuot at hubarin, at ginagamit sa araw-araw o sa hindi opisyal na okasyon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tising',
      translation: 'Singsing',
      definition:
          'uri ng alahas na isinusuot sa daliri, karaniwang metal, maaaring may bato o disenyo, at simbolo ng pagmamahalan o katayuan sa buhay.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Timtoh don',
      translation: 'sinuman',
      definition:
          ' isang tao na hindi partikular na pinatutungkulan at maaaring tumukoy o saklawan ng aksyon, tanong, o pahayag nang hindi tinutukoy kung sino.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sim toh',
      translation: 'Sino',
      definition:
          ' isang pangtanong na salita na ginagamit upang mag-usisa tungkol sa pangalan o pagkakakilanlan ng isang tao.',
      partOfSpeech: 'Pangngalan / Panghalip',
    ),
    DictionaryEntry(
      word: 'Galing / Sabitan',
      translation: 'Sinturon',
      definition:
          'isang mahabang piraso ng tela o katad na isinusuot sa baywang, karaniwang may buckle, para sa paghigpit o pag-ayos ng damit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tanol',
      translation: 'Sinulid',
      definition:
          'manipis at mahabang hibla, karaniwang yari sa koton, seda, o iba, na ginagamit sa pananahi, paggawa ng damit, at ibat ibang uri ng handicraft.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Atmulen keng',
      translation: 'Sinungaling',
      definition:
          'isang tao na hindi nagsasabi ng katotohanan at palaging nagbibigay ng maling impormasyon sa iba.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Snifa',
      translation: 'Sipa',
      definition:
          'isang tradisyonal na Pilipinong laro kung saan ang layunin ay panatilihin ang maliit na bola sa hangin gamit ang paa nang hindi ito hinahayaang mahulog sa lupa.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Malgad',
      translation: 'Sipag',
      definition:
          'ang katangian ng pagpapakita ng hindi matitinag na pagpupunyagi, pagtitiyaga, at walang humpay na paggawa hanggang sa matapos ang anumang uri ng trabaho o tungkulin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sigi',
      translation: 'Sipilyo',
      definition:
          'kasangkapan na may hawakan at bristles sa dulo, ginagamit kasama ng toothpaste para linisin ang ngipin at gilagid, tinatanggal ang dumi at plaque.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Ngol',
      translation: 'Sipon',
      definition:
          'karaniwang karamdaman at sintomas ng impeksyon sa itaas na bahagi ng respiratoryo, nagdudulot ng labis na produksyon ng malabnaw na likido sa ilong, kasabay ng ubo at pagbahing.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fiteh',
      translation: 'Siputin',
      definition:
          'ang pagdating o pagkakaroon ng presensya sa isang inaasahang lugar o patutunguhan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Amsal',
      translation: 'Sisi',
      definition:
          'ang damdamin ng pagkakamali o pagkukulang sa sarili o iba, at ang pagpapataw ng kasalanan sa isang tao dahil sa hindi magandang kahihinatnan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Knaraw',
      translation: 'Sisid',
      definition:
          'ang pagkilos ng paglangoy o pagbaba sa ilalim ng tubig upang maghanap, maglaro, o kumuha ng mga bagay sa dagat, ilog, o anumang anyong tubig.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Nga Anok',
      translation: 'Sisiw',
      definition:
          'batang manok na kalalabas lang mula sa itlog o ekspresyong ginagamit para sa gawaing napakadali.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Syem',
      translation: 'Siyam',
      definition:
          'bilang na sumusunod sa walo at nauna sa sampu, o ang kabuuan ng tatlong tatlo.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Sungit',
      translation: 'Subo',
      definition:
          ' isang maliit na kantidad o piraso ng pagkain na sapat sa isang kagat at tinatanggap ng bibig sa isang pagkakataon.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Fag tilew',
      translation: 'Subok',
      definition:
          'napatunayan at nasuri na sa pamamagitan ng eksperimento, karanasan, o obserbasyon.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Saey',
      translation: 'Sugat',
      definition:
          'pinsala o hiwa sa balat o laman ng katawan na dulot ng aksidente, operasyon, pagkakabangga, o anumang matatalim na bagay, na maaaring magdugo at magdulot ng sakit.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Dmulod',
      translation: 'Sugod',
      definition:
          ' isang mabilis at biglaang aksyon ng isang tao o grupo patungo sa isang layunin, na may iisang hangaring umabante nang sabay at mabilisan.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Gadsal',
      translation: 'Sukdulan',
      definition:
          ' tumutukoy sa pinakamatinding lebel o punto na maaaring marating o maabot ng isang bagay, sitwasyon, o damdamin.',
      partOfSpeech: 'Pang-uri',
    ),
    DictionaryEntry(
      word: 'Swat',
      translation: 'Suklay',
      definition:
          'isang kasangkapan para sa pag-aayos, pagpapakinis, at pagtanggal ng gusot sa buhok, may hawakan at maayos na nakahanay na ngipin.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Sambi',
      translation: 'Sukli',
      definition:
          ' halaga o pera na ibinabalik sa nagbayad kapag ang ibinayad ay mas mataas kaysa sa presyo ng produkto o serbisyo.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: 'Tusok',
      translation: 'Suksok',
      definition:
          'ang kilos ng paglalagay, pag-ipit, o pagtutulak ng isang bagay sa pagitan, loob, o tabi ng iba pang mga bagay sa masikip na espasyo.',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: 'Smulong',
      translation: 'Sulong',
      definition:
          'ang aksyon o proseso ng pag-abante o pagtahak patungo sa layunin sa kabila ng mga hadlang.',
      partOfSpeech: 'Pangngalan',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),

    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
    DictionaryEntry(
      word: '',
      translation: '',
      definition: '',
      partOfSpeech: '',
    ),
  ];

  List<DictionaryEntry> get _filteredEntries {
    // Create a copy of entries to sort
    List<DictionaryEntry> sortedEntries = List.from(_entries);

    // Sort alphabetically by word (case-insensitive)
    sortedEntries.sort(
      (a, b) => a.word.toLowerCase().compareTo(b.word.toLowerCase()),
    );

    // If search query is empty, return all entries (sorted)
    if (_searchQuery.isEmpty) {
      return sortedEntries;
    }

    // Filter the sorted entries
    return sortedEntries.where((entry) {
      return entry.word.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          entry.translation.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final groupedEntries = _groupEntries(_filteredEntries);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Dictionary',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Blaan words...',
                hintStyle: TextStyle(
                  color: scheme.onSurfaceVariant.withOpacity(0.7),
                  fontSize: 13,
                ),
                prefixIcon: Icon(Icons.search, color: scheme.primary),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: scheme.outline.withOpacity(0.6),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: scheme.outline.withOpacity(0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: scheme.primary, width: 1.4),
                ),
                filled: true,
                fillColor: scheme.surfaceContainerHighest,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Dictionary entries list
          Expanded(
            child: groupedEntries.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 54,
                          color: scheme.outlineVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No words found',
                          style: TextStyle(
                            color: scheme.onSurfaceVariant,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      bottom: 12,
                    ),
                    itemCount: groupedEntries.length,
                    itemBuilder: (context, index) {
                      final group = groupedEntries[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            color: scheme.surface.withOpacity(0.9),
                            child: Text(
                              group.letter,
                              style: TextStyle(
                                color: scheme.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          ...group.entries.map((entry) {
                            return _DictionaryItem(entry: entry);
                          }),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Helper to group entries by first letter
  List<_GroupedEntry> _groupEntries(List<DictionaryEntry> entries) {
    if (entries.isEmpty) return [];

    final Map<String, List<DictionaryEntry>> groups = {};
    for (var entry in entries) {
      if (entry.word.isEmpty) continue;
      final letter = entry.word[0].toUpperCase();
      if (!groups.containsKey(letter)) {
        groups[letter] = [];
      }
      groups[letter]!.add(entry);
    }

    final sortedKeys = groups.keys.toList()..sort();
    return sortedKeys.map((key) {
      return _GroupedEntry(letter: key, entries: groups[key]!);
    }).toList();
  }
}

class _GroupedEntry {
  final String letter;
  final List<DictionaryEntry> entries;

  _GroupedEntry({required this.letter, required this.entries});
}

class _DictionaryItem extends StatefulWidget {
  const _DictionaryItem({required this.entry});

  final DictionaryEntry entry;

  @override
  State<_DictionaryItem> createState() => _DictionaryItemState();
}

class _DictionaryItemState extends State<_DictionaryItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final primaryColor = scheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              color: _isExpanded
                  ? scheme.surfaceContainerHighest
                  : scheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _isExpanded
                    ? primaryColor.withOpacity(0.65)
                    : scheme.outline.withOpacity(0.4),
              ),
              boxShadow: _isExpanded
                  ? [
                      BoxShadow(
                        color: scheme.shadow.withOpacity(0.25),
                        blurRadius: 14,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : [],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.entry.word,
                                style: TextStyle(
                                  color: _isExpanded
                                      ? primaryColor
                                      : scheme.onSurface,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                ),
                              ),
                              TextSpan(
                                text: '  ·  ',
                                style: TextStyle(
                                  color: scheme.outlineVariant,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: widget.entry.translation,
                                style: TextStyle(
                                  color: scheme.onSurfaceVariant,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOutCubic,
                        turns: _isExpanded ? 0.5 : 0,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: primaryColor,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  child: _isExpanded
                      ? Container(
                          decoration: BoxDecoration(
                            color: scheme.surfaceContainerLowest,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(14),
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              if (widget.entry.partOfSpeech != null &&
                                  widget.entry.partOfSpeech!.isNotEmpty) ...[
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: widget.entry.partOfSpeech!
                                      .split('/')
                                      .map((pos) {
                                        final trimmedPos = pos.trim();
                                        if (trimmedPos.isEmpty)
                                          return const SizedBox.shrink();
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _getPartOfSpeechColor(
                                              trimmedPos,
                                            ).withValues(alpha: 0.15),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Text(
                                            trimmedPos,
                                            style: TextStyle(
                                              color: _getPartOfSpeechColor(
                                                trimmedPos,
                                              ),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      })
                                      .toList(),
                                ),
                                const SizedBox(height: 16),
                              ],
                              Text(
                                'MEANING',
                                style: TextStyle(
                                  color: scheme.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.entry.definition,
                                style: TextStyle(
                                  color: scheme.onSurface,
                                  fontSize: 15,
                                  height: 1.45,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getPartOfSpeechColor(String pos) {
    switch (pos.toLowerCase()) {
      case 'noun':
      case 'pangngalan':
        return Colors.blue;
      case 'verb':
      case 'pandiwa':
        return Colors.green;
      case 'adjective':
      case 'pang-uri':
        return Colors.purple;
      case 'adverb':
      case 'pang-abay':
        return Colors.orange;
      case 'pronoun':
      case 'panghalip':
        return Colors.teal;
      case 'conjunction':
      case 'pangatnig':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }
}

class DictionaryEntry {
  final String word;
  final String translation;
  final String definition;
  final String? partOfSpeech;

  DictionaryEntry({
    required this.word,
    required this.translation,
    required this.definition,
    this.partOfSpeech,
  });
}
