import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.title});
  final String? title;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Map<String, dynamic>> slideshowData = [
    {
      'imagePath': 'assets/11.jpg',
    },
    {
      'imagePath': 'assets/22.jpg',
    },
    {
      'imagePath': 'assets/77.jpg',
    }
  ];
  List<Map> deneme = [
    {
      "id": "1",
      "name": "XS",
      "icon": Icons.ac_unit,
      Color: 0xff556476,
    },
    {
      "id": "2",
      "name": "S",
      "icon": Icons.ac_unit,
      Color: 0xff556476,
    },
    {
      "id": "3",
      "name": "M",
      "icon": Icons.ac_unit,
      Color: 0xff556476,
    },
    {
      "id": "4",
      "name": "L",
      "icon": Icons.ac_unit,
      Color: 0xff000000,
    },
    {
      "id": "5",
      "name": "XL",
      "icon": Icons.ac_unit,
      Color: 0xffffffff,
    },
    {
      "id": "6",
      "name": "XXL",
      "icon": Icons.ac_unit,
      Color: 0xff556476,
    },
    {
      "id": "7",
      "name": "XXXL",
      "icon": Icons.ac_unit,
      Color: 0xff004760,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            //? Resimler
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                  child: ImageSlideshow(
                    indicatorColor: Colors.white,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                      setState(() {
                        //  tempindex = value;
                      });
                    },
                    initialPage: 0,
                    indicatorRadius: 4.0,
                    autoPlayInterval:
                        99999999999999, // kendisi oynamaması için
                    isLoop: true,
                    children: slideshowData.map((data) {
                      return Container(
                        width: 500,
                        height: 500,
                        child: ClipRRect(
                          child: Image.asset(
                            data['imagePath'],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
                    ),
                  ),
                  top: 10,
                  left: 10,
                ),

                /*   //Kampanya yazısı
                Positioned(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade800,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.local_offer),
                    ),
                  ),
                  top: 70,
                  right: 10,
                ),
                   */
              ],
            ),
            //? Ürün Bilgileri Adı Markası
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    "Marka Adı" + " " + "Ürün Adı",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            //? Rating Bar
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    "Rating Bar",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            //? Ürün Bilgileri
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    "Ürün Açıklaması",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            //? Beden Seçimi
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    "Beden",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: deneme.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.17,
                      height: MediaQuery.of(context).size.height * 0.02,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        //  color: Colors.pink.shade100,
                      ),
                      child: Center(child: Text(deneme[index]["name"])),
                    ),
                  );
                },
              ),
            ),
            //? Renk Seçimi
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    "Renk",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: deneme.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.17,
                      height: MediaQuery.of(context).size.height * 0.02,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        //  color: Colors.pink.shade100,
                      ),
                      child: Center(
                          child: Container(
                        color: Color(deneme[index][Color]),
                        //  color: deneme[index]["Color"],
                      )),
                    ),
                  );
                },
              ),
            ),
            //? Benzer Ürünler
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    "Benzer Ürünler",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.28,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: deneme.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 1.0),
                    child: GestureDetector(
                      onTap: () {
                        // Ürüne tıklandığında yapılacak işlemler
                        //  ustbildirimSucces(context, deneme[index]["name"]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                      title: deneme[index]["name"],
                                    )));
                      },
                      child: Card(
                          color: Colors.white,
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: Image.asset(
                                          'assets/11.jpg',
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                          frameBuilder: (context, child, frame,
                                                  wasSynchronouslyLoaded) =>
                                              wasSynchronouslyLoaded
                                                  ? child
                                                  : AnimatedOpacity(
                                                      child: child,
                                                      opacity:
                                                          frame == null ? 0 : 1,
                                                      duration: const Duration(
                                                          seconds: 1),
                                                      curve: Curves.easeOut,
                                                    ),
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Icon(Icons.error),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          icon: Icon(Icons.favorite,
                                              color: Colors.red.shade400),
                                          onPressed: () {
                                            // Favori ikonuna tıklandığında yapılacak işlemler
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: Colors.green.shade700,
                                          child: Center(
                                            child: Text(
                                              'Hızlı Teslimat',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 1),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(deneme[index]["name"]),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 1),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("₺ 100"),
                                    ),
                                  ),
                                ],
                              ))),
                    ),
                  );
                },
              ),
            ),
            //? Kullanıcı Yorumları
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    "Kullanıcı Yorumları",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.28 ,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: deneme.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 1.0),
                    child: Card(
                      color: Colors.white,
                      child: Container(
                        width: MediaQuery.of(context).size.width ,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Column(
                          children: [
                            //? Kullanıcı Adı ve Profil Fotoğrafı
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.person),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Container(
                                    child: Text(
                                      "Kullanıcı Adı ***********",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //? Rating Bar
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    "Rating Bar",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),


                            //? Yorum Metni
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    "Yorum Metni --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ",
                                    maxLines: 5,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ) ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.grey.shade200,
        child: Row(
          children: [
            Expanded(
              child: Center(child: Text("Fiyat")),
            ),
            Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.orange.shade800),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Sepete Ekle",
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ),
      ),
    ));
  }
}
