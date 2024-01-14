import 'package:flutter/material.dart';
import 'package:mobil_store/constants/fixedDesing.dart';
import 'package:mobil_store/pages/adminFolder/productAdd.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Map> productList = [
    {
      'name': 'Product 1',
      'price': 'Product 1',
      'image': 'Product 1',
      'category': 'Product 1',
      'adet': 5,
      'code': 'Product 1',
      "miktar": "adet",
    },
    {
      'name': 'Product 2',
      'price': 'Product 2',
      'image': 'Product 2',
      'category': 'Product 2',
      'adet': 4,
      'code': 'Product 2',
      "miktar": "adet",
    },
    {
      'name': 'Product 3',
      'price': 'Product 3',
      'image': 'Product 3',
      'category': 'Product 3',
      'adet': 3,
      'code': 'Product 3',
      "miktar": "adet",
    },
    {
      'name': 'Product 4',
      'price': 'Product 4',
      'image': 'Product 4',
      'category': 'Product 4',
      'adet': 2,
      'code': 'Product 4',
      "miktar": "dz",
    },
    {
      'name': 'Product 5',
      'price': 'Product 5',
      'image': 'Product 5',
      'category': 'Product 5',
      'adet': 1,
      'code': 'Product 5',
      "miktar": "adet",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            //! Ürün Listesi Başlığı
            Center(
              child: Text(
                "Ürün Listesi",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ürünleri düzenlemek için ürüne dokunun.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            // ! Ürün Listesi
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            print("Tıklandı");
                            ustbildirimSucces(
                                context,
                                "Ürün Düzenleme" +
                                    "Ürün düzenleme sayfasına yönlendiriliyorsunuz.");
                          },
                          leading: Text(productList[index]['adet'].toString() +
                              " " +
                              productList[index]['miktar']),
                          title: Text(productList[index]['code'] +
                              " " +
                              productList[index]['name']),
                          subtitle: Text(productList[index]['price'] + " TL"),
                          // ! detay bilgileri
                          trailing: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              Navigator.pop(context);
                                              ustbildirimSucces(
                                                  context,
                                                  "Ürün Silme" +
                                                      "Ürün silme işlemi başarılı.");
                                            },
                                            leading: Icon(Icons.delete),
                                            title: Text("Ürünü Sil"),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              Navigator.pop(context);
                                              ustbildirimSucces(
                                                  context,
                                                  "Ürün Düzenleme" +
                                                      "Ürün düzenleme sayfasına yönlendiriliyorsunuz.");
                                            },
                                            leading: Icon(Icons.edit),
                                            title: Text("Ürünü Düzenle"),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            icon: Icon(Icons.more_vert),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            // ! Ürün Ekleme Butonu
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    //! Ürün Ekleme Butonu bilgilendirme
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ürün eklemek için butona tıklayın.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(Size(
                              MediaQuery.of(context).size.width * 0.5,
                              MediaQuery.of(context).size.height * 0.06)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 229, 144, 18)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProductAddScreen();
                            },
                          ));
                        },
                        child: Text(
                          'Ürün Ekle',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
