import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mobil_store/constants/const.dart';
import 'package:mobil_store/pages/productFolder/product.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../data/sharedPrefsHelper.dart';
import 'login.dart';

Const constrant = Const();

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await isAccount();
    });
  }

  // ! Hesap var mı yok mu kontrolü
  Future<void> isAccount() async {
    await SharedPrefsHelper.getUser().then((value) {
      if (value!.name != "" && value.password != "") {
        setState(() {
          constrant.accountAvailable.value = true;
        });
      } else {
        setState(() {
          constrant.accountAvailable.value = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('accountAvailable: ${constrant.accountAvailable.value}');

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Favorilerim'),
            automaticallyImplyLeading: false,
          ),
          body: constrant.accountAvailable.value == true
              ? HesapVarFavori()
              : HesapYokFavori()),
    );
  }
}

//! Hesap var
class HesapVarFavori extends StatefulWidget {
  const HesapVarFavori({super.key});

  @override
  State<HesapVarFavori> createState() => _HesapVarState();
}

class _HesapVarState extends State<HesapVarFavori> {
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey.shade200,
          child: Column(
            children: [
              Column(
                children: [
                  // ! Üst kısım sepetin henüz boş olduğunu belirtiyor
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'Favorilerin şu an boş',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Henüz hiçbir ürünü favorilerinize eklemediniz. Beğendiğiniz ürünleri favorilerinize ekleyebilirsiniz',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        //! En Çok Satılan ürünler
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'En Çok Satılan Ürünler',
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.2,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade200,
                                                      ),
                                                      child: ImageSlideshow(
                                                        indicatorColor:
                                                            Colors.white,
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
                                                        children: slideshowData
                                                            .map((data) {
                                                          return Container(
                                                            width: 500,
                                                            height: 500,
                                                            child: ClipRRect(
                                                              child:
                                                                  Image.asset(
                                                                data[
                                                                    'imagePath'],
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: IconButton(
                                                      icon: Icon(Icons.favorite,
                                                          color: Colors
                                                              .red.shade400),
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
                                                      color:
                                                          Colors.green.shade700,
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
                                                  child: Text(
                                                      deneme[index]["name"]),
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
                            itemCount: deneme.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 1.0),
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
                                              child: Image.asset(
                                                'assets/11.jpg',
                                                fit: BoxFit.fill,
                                                alignment: Alignment.center,
                                                frameBuilder: (context,
                                                        child,
                                                        frame,
                                                        wasSynchronouslyLoaded) =>
                                                    wasSynchronouslyLoaded
                                                        ? child
                                                        : AnimatedOpacity(
                                                            child: child,
                                                            opacity:
                                                                frame == null
                                                                    ? 0
                                                                    : 1,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            curve:
                                                                Curves.easeOut,
                                                          ),
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
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
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 1),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(deneme[index]["name"]),
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
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

//! Hesap yok
class HesapYokFavori extends StatefulWidget {
  const HesapYokFavori({super.key});

  @override
  State<HesapYokFavori> createState() => _HesapYokState();
}

class _HesapYokState extends State<HesapYokFavori> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          FlutterLogo(
            size: 100,
          ),
          SizedBox(height: 20),
          Text('Kayıtlı Hesabınız Yok'),
          SizedBox(height: 20),
          Text(
            'Favorilerini görüntüleyebilmek için lütfen giriş yapın. Beğendiğiniz ürünleri favorilerinize ekleyebilirsiniz.',
            style: TextStyle(
                fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Shimmer(
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 229, 144, 18)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ));
                  },
                  child: Text(
                    'Giriş Yap',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
