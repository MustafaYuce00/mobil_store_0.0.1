import 'package:flutter/material.dart';

class CargoScreen extends StatefulWidget {
  const CargoScreen({super.key});

  @override
  State<CargoScreen> createState() => _CargoScreenState();
}

class _CargoScreenState extends State<CargoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kargo'),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    Column(
                      children: [
                        //! Kargo ücreti
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 15.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 15.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Kargo Ücreti",
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
                                    "Belirlirleyeceğiniz kargo ücreti, Sepette ilave edilecekt",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      label: Text(
                                        "Kargo Ücreti",
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
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        //! KDV oranı
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 15.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 15.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "KDV Oranı",
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
                                    "Belirlirleyeceğiniz Kdv Oranı, Ürün Bazlı olarak her ürüne kendi fiyatının üzerine ilave edilecekt. Yani ürün fiyatı 100 TL ise, girdiğiniz oran 10 ise ürün fiyatı 100 TL üzerine KDV oranı kadar ilave edilecektir ve ürün fiyatı 110 TL olacaktır.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      label: Text(
                                        "Kdv Oranı",
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
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        //! Buton
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.save),
                            label: Text("Kaydet veya Güncelle"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
