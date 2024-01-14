import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobil_store/constants/lists.dart';
import 'package:mobil_store/pages/productFolder/search.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Kategoriler'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade200,
        child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(Lists.categories.length, (index) {
              return AnimationConfiguration.staggeredGrid(
                columnCount: 3,
                position: index,
                duration: Duration(milliseconds: 350),
                child: ScaleAnimation(
                  scale: 0.5,
                  curve: Curves.easeInCubic,
                  //  curve: Curves.easeIn,
                  child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen(
                                        title: Lists
                                            .categories[index].KategortAdi
                                            .toString(),
                                      )));
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              Lists.categories[index].KategortAdi.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })),
      ),
    ));
  }
}
