class CategoryModel {
  int? ID;
  String? KategortAdi;
  bool? AKTIF;
  String? TEXTYEDEK1;
  String? TEXTYEDEK2;
  String? TEXTYEDEK3;
  double? SAYISALYEDEK1;
  double? SAYISALYEDEK2;

  CategoryModel({
    required this.ID,
    required this.KategortAdi,
    required this.AKTIF,
    this.TEXTYEDEK1,
    this.TEXTYEDEK2,
    this.TEXTYEDEK3,
    this.SAYISALYEDEK1,
    this.SAYISALYEDEK2,
  });

  CategoryModel.fromjson(Map<String, dynamic> json) {
    ID = int.parse(json['ID']);
    KategortAdi = json['KategortAdi'];
    AKTIF = json['AKTIF'];
    TEXTYEDEK1 = json['TEXTYEDEK1'];
    TEXTYEDEK2 = json['TEXTYEDEK2'];
    TEXTYEDEK3 = json['TEXTYEDEK3'];
    SAYISALYEDEK1 = double.parse(json['SAYISALYEDEK1']);
    SAYISALYEDEK2 = double.parse(json['SAYISALYEDEK2']);
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = this.ID;
    data['KategortAdi'] = this.KategortAdi;
    data['AKTIF'] = this.AKTIF;
    data['TEXTYEDEK1'] = this.TEXTYEDEK1;
    data['TEXTYEDEK2'] = this.TEXTYEDEK2;
    data['TEXTYEDEK3'] = this.TEXTYEDEK3;
    data['SAYISALYEDEK1'] = this.SAYISALYEDEK1;
    data['SAYISALYEDEK2'] = this.SAYISALYEDEK2;

    return data;
  }
}
