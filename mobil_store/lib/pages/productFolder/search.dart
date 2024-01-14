import 'package:flutter/material.dart';
import 'package:mobil_store/pages/productFolder/product.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({required this.title});

  String? title;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
              title: Text(widget.title.toString()),
            ),
            //? Ürünlerin listelendiği alan
            body: GridView.builder(
              itemCount: deneme.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: GestureDetector(
                    onTap: () {
                      // Ürüne tıklandığında yapılacak işlemler
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                    title: deneme[index]["name"],
                                  )));
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
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
                                              opacity: frame == null ? 0 : 1,
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.easeOut,
                                            ),
                                  errorBuilder: (context, error, stackTrace) =>
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
                            padding: const EdgeInsets.only(left: 5, top: 1),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(deneme[index]["name"]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 1),
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
            )));
  }
}
