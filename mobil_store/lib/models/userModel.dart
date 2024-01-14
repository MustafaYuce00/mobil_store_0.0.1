import 'package:mobil_store/models/productModel.dart';

class UserModel {
  int? ID;
  String? KIMLIKNO;
  String? AD;
  String? SOYAD;
  String? CINSIYET;
  DateTime? DOGUMTARIH;
  DateTime? KAYITTARIH;
  String? TEXTYEDEK1;
  String? TEXTYEDEK2;
  String? TEXTYEDEK3;
  double? SAYISALYEDEK1;
  double? SAYISALYEDEK2;
  String? TELEFON;
  String? MAIL;
  String? IL;
  String? ILCE;
  String? ADRES;
  String? SIFRE;
  String? VERGIDAIRE;
  String? VERGINO;
  String? AKTIF;
  String? DURUM;
  List<ProductModel>? SEPET;
  List<ProductModel>? FAVORI;
  List<ProductModel>? GORULDU;

  UserModel({
    this.ID,
    this.KIMLIKNO,
    this.AD,
    this.SOYAD,
    this.CINSIYET,
    this.DOGUMTARIH,
    this.KAYITTARIH,
    this.TEXTYEDEK1,
    this.TEXTYEDEK2,
    this.TEXTYEDEK3,
    this.SAYISALYEDEK1,
    this.SAYISALYEDEK2,
    this.TELEFON,
    this.MAIL,
    this.IL,
    this.ILCE,
    this.ADRES,
    this.SIFRE,
    this.VERGIDAIRE,
    this.VERGINO,
    this.AKTIF,
    this.DURUM,
    this.SEPET,
    this.FAVORI,
    this.GORULDU,
  });

  UserModel.fromjson(Map<String, dynamic> json) {
    ID = int.parse(json['ID']);
    KIMLIKNO = json['KIMLIKNO'];
    AD = json['AD'];
    SOYAD = json['SOYAD'];
    CINSIYET = json['CINSIYET'];
    DOGUMTARIH = DateTime.parse(json['DOGUMTARIH']);
    KAYITTARIH = DateTime.parse(json['KAYITTARIH']);
    TEXTYEDEK1 = json['TEXTYEDEK1'];
    TEXTYEDEK2 = json['TEXTYEDEK2'];
    TEXTYEDEK3 = json['TEXTYEDEK3'];
    SAYISALYEDEK1 = double.parse(json['SAYISALYEDEK1']);
    SAYISALYEDEK2 = double.parse(json['SAYISALYEDEK2']);
    TELEFON = json['TELEFON'];
    MAIL = json['MAIL'];
    IL = json['IL'];
    ILCE = json['ILCE'];
    ADRES = json['ADRES'];
    SIFRE = json['SIFRE'];
    VERGIDAIRE = json['VERGIDAIRE'];
    VERGINO = json['VERGINO'];
    AKTIF = json['AKTIF'];
    DURUM = json['DURUM'];
    if (json['SEPET'] != null) {
      SEPET = <ProductModel>[];
      json['SEPET'].forEach((v) {
        SEPET!.add(ProductModel.fromjson(v));
      });
    } else {
      SEPET = <ProductModel>[];
    }
    if (json['FAVORI'] != null) {
      FAVORI = <ProductModel>[];
      json['FAVORI'].forEach((v) {
        FAVORI!.add(ProductModel.fromjson(v));
      });
    } else {
      FAVORI = <ProductModel>[];
    }
    if (json['GORULDU'] != null) {
      GORULDU = <ProductModel>[];
      json['GORULDU'].forEach((v) {
        GORULDU!.add(ProductModel.fromjson(v));
      });
    } else {
      GORULDU = <ProductModel>[];
    }
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = this.ID;
    data['KIMLIKNO'] = this.KIMLIKNO;
    data['AD'] = this.AD;
    data['SOYAD'] = this.SOYAD;
    data['CINSIYET'] = this.CINSIYET;
    data['DOGUMTARIH'] = this.DOGUMTARIH;
    data['KAYITTARIH'] = this.KAYITTARIH;
    data['TEXTYEDEK1'] = this.TEXTYEDEK1;
    data['TEXTYEDEK2'] = this.TEXTYEDEK2;
    data['TEXTYEDEK3'] = this.TEXTYEDEK3;
    data['SAYISALYEDEK1'] = this.SAYISALYEDEK1;
    data['SAYISALYEDEK2'] = this.SAYISALYEDEK2;
    data['TELEFON'] = this.TELEFON;
    data['MAIL'] = this.MAIL;
    data['IL'] = this.IL;
    data['ILCE'] = this.ILCE;
    data['ADRES'] = this.ADRES;
    data['SIFRE'] = this.SIFRE;
    data['VERGIDAIRE'] = this.VERGIDAIRE;
    data['VERGINO'] = this.VERGINO;
    data['AKTIF'] = this.AKTIF;
    data['DURUM'] = this.DURUM;
    if (this.SEPET != null) {
      data['SEPET'] = this.SEPET!.map((v) => v.tojson()).toList();
    } else {
      data['SEPET'] = [];
    }
    if (this.FAVORI != null) {
      data['FAVORI'] = this.FAVORI!.map((v) => v.tojson()).toList();
    } else {
      data['FAVORI'] = [];
    }
    if (this.GORULDU != null) {
      data['GORULDU'] = this.GORULDU!.map((v) => v.tojson()).toList();
    } else {
      data['GORULDU'] = [];
    }

    return data;
  }
}
