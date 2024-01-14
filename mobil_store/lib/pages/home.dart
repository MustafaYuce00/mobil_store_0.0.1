import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mobil_store/constants/lists.dart';
import 'package:mobil_store/pages/productFolder/product.dart';
import 'package:mobil_store/pages/productFolder/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
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

  /* List<Map> deneme = [
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
*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey.shade200,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.grey.shade100,
                surfaceTintColor: Colors.grey.shade100,
                pinned: true,
                automaticallyImplyLeading: false,
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: searchController,
                          onEditingComplete: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen(
                                          title: searchController.text,
                                        )));
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Marka, kategori veya ürün ara',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          // Bildirim ikonuna tıklandığında yapılacak işlemler
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //! Slider
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.shade200,
                    ),
                    child: ImageSlideshow(
                      //      indicatorBottomPadding: double.infinity, // ile indicatorin altındaki boşluk ayarlanır
                      indicatorColor: Colors.blue,
                      onPageChanged: (value) {
                        debugPrint('Page changed: $value');
                        setState(() {
                          //  tempindex = value;
                        });
                      },
                      initialPage: 0,
                      autoPlayInterval: 9000,
                      isLoop: true,
                      children: slideshowData.map((data) {
                        return Container(
                          width: 500,
                          height: 500,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              data['imagePath'],
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  //! Kategoriler
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Kategoriler',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // Kategoriler butonuna tıklandığında yapılacak işlemler
                          },
                          child: Text(
                            'Tümünü Gör',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Lists.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(3),
                          child: GestureDetector(
                            onTap: () {
                              // Kategoriye tıklandığında yapılacak işlemler
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                          title: Lists
                                              .categories[index].KategortAdi
                                              .toString())));
                            },
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  //  color: Colors.pink.shade100,
                                ),
                                child: Center(
                                    child: Text(
                                  Lists.categories[index].KategortAdi
                                      .toString(),
                                )),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //! Kampayalı Ürünler
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Kampanyalı Ürünler',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // Ürünler butonuna tıklandığında yapılacak işlemler
                          },
                          child: Text(
                            'Tümünü Gör',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          Lists.allProducts.length, //Lists.allProducts.length,
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
                                            title: Lists
                                                .allProducts[index].UrunAdi
                                                .toString(),
                                          )));
                            },
                            child: Card(
                                color: Colors.white,
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                ),
                                                child: ImageSlideshow(
                                                  indicatorColor: Colors.white,
                                                  onPageChanged: (value) {
                                                    debugPrint(
                                                        'Page changed: $value');
                                                    setState(() {
                                                      //  tempindex = value;
                                                    });
                                                  },
                                                  initialPage: 0,
                                                  indicatorRadius: 4.0,
                                                  autoPlayInterval:
                                                      99999999999999, // kendisi oynamaması için
                                                  isLoop: false,
                                                  children: Lists
                                                      .allProducts[index]
                                                      .UrunResim!
                                                      .map((data) {
                                                    return Container(
                                                      width: 500,
                                                      height: 500,
                                                      child: ClipRRect(
                                                        child: Image.asset(
                                                          data,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  /*     slideshowData.map((data) {
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
                                                  }).toList(),*/
                                                ),
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
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 1),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(Lists
                                                .allProducts[index].UrunAdi!),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 1),
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
                  //! Yeni Ürünler
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Yeni Ürünler',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // Ürünler butonuna tıklandığında yapılacak işlemler
                          },
                          child: Text(
                            'Tümünü Gör',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Lists.allProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 1.0),
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
                                      child: Text(
                                          Lists.allProducts[index].UrunAdi!),
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
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //! En Çok Satanlar
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'En Çok Satanlar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // Ürünler butonuna tıklandığında yapılacak işlemler
                          },
                          child: Text(
                            'Tümünü Gör',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Lists.allProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 1.0),
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
                                      child: Text(
                                          Lists.allProducts[index].UrunAdi!),
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
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //! İndirimli Ürünler
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'İndirimli Ürünler',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // Ürünler butonuna tıklandığında yapılacak işlemler
                          },
                          child: Text(
                            'Tümünü Gör',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Lists.allProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 1.0),
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
                                      child: Text(
                                          Lists.allProducts[index].UrunAdi!),
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
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //! Son Gezilen Ürünler
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Son Gezilen Ürünler',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // Ürünler butonuna tıklandığında yapılacak işlemler
                          },
                          child: Text(
                            'Tümünü Gör',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Lists.allProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 1.0),
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
                                      child: Text(
                                          Lists.allProducts[index].UrunAdi!),
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
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
