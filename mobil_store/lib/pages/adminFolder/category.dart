import 'package:flutter/material.dart';
import 'package:mobil_store/constants/lists.dart';

import '../../models/categoryModel.dart';

class CategoryAdminScreen extends StatefulWidget {
  const CategoryAdminScreen({super.key});

  @override
  State<CategoryAdminScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryAdminScreen> {
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Kategori Ayarları'),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Text(
                          'Satışa sunulan ürünleri kategorilendirmek isterseniz, bu bölümde oluşturmak istediğiniz kategorilerini ayarlayabilirsiniz.',
                          style: TextStyle(),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Text(
                        "Oluşturduğunuz kategorileri birden fazla ürün için ve bir ürüne birden fazla kategori tanımlayabilirsiniz."),
                  ),
                  Text("Artı butonuna basarak kategori ekleyebilirsiniz."),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1,
                        bottom: 5,
                        top: 10),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                Lists.categories.add(CategoryModel(
                                  ID: 1,
                                  KategortAdi: categoryController.text,
                                  AKTIF: true,
                                  TEXTYEDEK1: '1',
                                  TEXTYEDEK2: '1',
                                  TEXTYEDEK3: '1',
                                  SAYISALYEDEK1: 1,
                                  SAYISALYEDEK2: 1,
                                ));
                                categoryController.clear();
                              });
                            },
                            icon: Icon(Icons.add_circle_outline)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: TextField(
                            controller: categoryController,
                            decoration: InputDecoration(
                                hintText: 'Kategori Adı',
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                        itemCount: Lists.categories.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                Lists.categories[index].KategortAdi.toString()),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  Lists.categories.removeAt(index);
                                });
                              },
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
