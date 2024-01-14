import 'package:flutter/material.dart';
import 'package:mobil_store/constants/lists.dart';
import 'package:mobil_store/pages/adminFolder/category.dart';

class ProductAddExtraScreen extends StatefulWidget {
  const ProductAddExtraScreen({super.key});

  @override
  State<ProductAddExtraScreen> createState() => _ProductAddExtraScreenState();
}

class _ProductAddExtraScreenState extends State<ProductAddExtraScreen> {
  bool _isDiscount = false;
  List<Map> deneme = [
    {
      "id": "1",
      "name": "Kategori 1",
      "icon": Icons.ac_unit,
    },
    {
      "id": "2",
      "name": "Kategori 2",
      "icon": Icons.ac_unit,
    },
    {
      "id": "3",
      "name": "Kategori 3",
      "icon": Icons.ac_unit,
    },
    {
      "id": "4",
      "name": "Kategori 4",
      "icon": Icons.ac_unit,
    },
    {
      "id": "5",
      "name": "Kategori 5",
      "icon": Icons.ac_unit,
    },
    {
      "id": "6",
      "name": "Kategori 6",
      "icon": Icons.ac_unit,
    },
    {
      "id": "7",
      "name": "Kategori 7",
      "icon": Icons.ac_unit,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Diğer Seçenekler'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  //! indirimli ürün
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "İndirimli Ürün",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Ürününüzü indirimli şekilde listelemek istiyorsanız bu seçeneği işaretleyin.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.green,
                              shape: CircleBorder(),
                              value: _isDiscount,
                              onChanged: (value) {
                                setState(() {
                                  _isDiscount = value!;
                                });
                              },
                            ),
                            Text(
                              "Üründe indirim uygula",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  "İndirimli Satış Fiyatı",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Divider(
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //! kategori seçimi
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                    ),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kategori Seçimi",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  //eğer buradan kategori ekleme sayfasına gideceksek geri dönüşte kategori seçimini yapmış olmalı ve buraya dönmeli
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return CategoryAdminScreen();
                                    },
                                  ));
                                },
                                child: Text(
                                  "Kategori Ekle",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Bu ürünü hangi kategoriye veya kategorilere eklemek istiyorsanız seçiniz.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                            itemCount: Lists.categories.length,
                            // index valuesine göre listeye eleman eklenecek
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(Lists
                                        .categories[index].KategortAdi
                                        .toString()),
                                    leading: Checkbox(
                                      activeColor: Colors.green,
                                      shape: CircleBorder(),
                                      value: Lists.categories[index].AKTIF,
                                      onChanged: (value) {
                                        setState(() {
                                          Lists.categories[index].AKTIF =
                                              value!;
                                        });
                                      },
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black26,
                                    thickness: 1,
                                  ),
                                ],
                              );
                            }),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  //! buton
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // save yapıp geri dönecek
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.save),
                            label: Text("Onayla"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Vazgeç")),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
