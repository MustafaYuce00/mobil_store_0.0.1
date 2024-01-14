
import 'package:mobil_store/models/categoryModel.dart';

class ProductModel {
  int? ID;
  String? UrunKodu;
  String? UrunAdi;
  String? UrunAciklama;
  double? UrunFiyat;
  double? UrunIndFiyat;
  String? UrunKDV;
  int? UrunStokMiktar;
  int? UrunSatilanMiktar;
  String? UrunMarka;
  String? UrunModel;
  String? TEXTYEDEK1;
  String? TEXTYEDEK2;
  String? TEXTYEDEK3;
  double? SAYISALYEDEK1;
  double? SAYISALYEDEK2;
  String? AKTIF;
  bool? GORULDUMU;
  bool? FAVORIMI;
  bool? SEPETTEMI;
  bool? KAMPANYALIMI;
  bool? KAMPANYAURUNMUMU;
  List<String>? KAMPANYAAD;
  List<String>? UrunResim;
  List<CategoryModel>? UrunKategori;

  ProductModel({
    required this.ID,
    required this.UrunKodu,
    required this.UrunAdi,
    this.UrunAciklama,
    required this.UrunFiyat,
    this.UrunIndFiyat,
    this.UrunKDV,
    required this.UrunStokMiktar,
    required this.UrunSatilanMiktar,
    this.UrunMarka,
    this.UrunModel,
    this.TEXTYEDEK1,
    this.TEXTYEDEK2,
    this.TEXTYEDEK3,
    this.SAYISALYEDEK1,
    this.SAYISALYEDEK2,
    required this.AKTIF,
    this.GORULDUMU,
    this.FAVORIMI,
    this.SEPETTEMI,
    this.KAMPANYALIMI,
    this.KAMPANYAURUNMUMU,
    this.KAMPANYAAD,
    required this.UrunResim,
    required this.UrunKategori,
  });

  ProductModel.fromjson(Map<String, dynamic> json) {
    ID = int.parse(json['ID']);
    UrunKodu = json['UrunKodu'];
    UrunAdi = json['UrunAdi'];
    UrunAciklama = json['UrunAciklama'];
    UrunFiyat = double.parse(json['UrunFiyat']);
    UrunIndFiyat = double.parse(json['UrunIndFiyat']);
    UrunKDV = json['UrunKDV'];
    UrunStokMiktar = int.parse(json['UrunStokMiktar']);
    UrunSatilanMiktar = int.parse(json['UrunSatilanMiktar']);
    UrunMarka = json['UrunMarka'];
    UrunModel = json['UrunModel'];
    TEXTYEDEK1 = json['TEXTYEDEK1'];
    TEXTYEDEK2 = json['TEXTYEDEK2'];
    TEXTYEDEK3 = json['TEXTYEDEK3'];
    SAYISALYEDEK1 = double.parse(json['SAYISALYEDEK1']);
    SAYISALYEDEK2 = double.parse(json['SAYISALYEDEK2']);
    AKTIF = json['AKTIF'];
    GORULDUMU = json['GORULDUMU'];
    FAVORIMI = json['FAVORIMI'];
    SEPETTEMI = json['SEPETTEMI'];
    KAMPANYALIMI = json['KAMPANYALIMI'];
    KAMPANYAURUNMUMU = json['KAMPANYAURUNMUMU'];
    KAMPANYAAD = json['KAMPANYAAD'];
    UrunResim = json['UrunResim'];

    if (json['UrunKategori'] != null) {
      UrunKategori = <CategoryModel>[];
      json['UrunKategori'].forEach((v) {
        UrunKategori!.add(CategoryModel.fromjson(v));
      });
    } else {
      UrunKategori = <CategoryModel>[];
    }
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = this.ID;
    data['UrunKodu'] = this.UrunKodu;
    data['UrunAdi'] = this.UrunAdi;
    data['UrunAciklama'] = this.UrunAciklama;
    data['UrunFiyat'] = this.UrunFiyat;
    data['UrunIndFiyat'] = this.UrunIndFiyat;
    data['UrunKDV'] = this.UrunKDV;
    data['UrunStokMiktar'] = this.UrunStokMiktar;
    data['UrunSatilanMiktar'] = this.UrunSatilanMiktar;
    data['UrunMarka'] = this.UrunMarka;
    data['UrunModel'] = this.UrunModel;
    data['TEXTYEDEK1'] = this.TEXTYEDEK1;
    data['TEXTYEDEK2'] = this.TEXTYEDEK2;
    data['TEXTYEDEK3'] = this.TEXTYEDEK3;
    data['SAYISALYEDEK1'] = this.SAYISALYEDEK1;
    data['SAYISALYEDEK2'] = this.SAYISALYEDEK2;
    data['AKTIF'] = this.AKTIF;
    data['GORULDUMU'] = this.GORULDUMU;
    data['FAVORIMI'] = this.FAVORIMI;
    data['SEPETTEMI'] = this.SEPETTEMI;
    data['KAMPANYALIMI'] = this.KAMPANYALIMI;
    data['KAMPANYAURUNMUMU'] = this.KAMPANYAURUNMUMU;
    data['KAMPANYAAD'] = this.KAMPANYAAD;
    data['UrunResim'] = this.UrunResim;
    if (this.UrunKategori != null) {
      data['UrunKategori'] = this.UrunKategori!.map((v) => v.tojson()).toList();
    } else {
      data['UrunKategori'] = [];
    }
    return data;
  }
/*
  //!!!!!!!!!!
  static Future<void> saveUser(ProductModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.tojson());
    await prefs.setString("kullanici", userJson);
  }

  static Future<ProductModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString("kullanici");
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return ProductModel.fromjson(userMap);
    }
    return null;
  }
  */
}
