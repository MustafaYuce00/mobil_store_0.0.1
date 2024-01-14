import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_store/main.dart';

class InternetScreen extends StatefulWidget {
  const InternetScreen({super.key});

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color(0xffe0e0e0),
        /*  gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.white])
        */
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Container(
            child: Text(
              "Bağlantı problemi",
              style: GoogleFonts.quicksand(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
            child: Text(
              "İnternet bağlantın kopmuş gibi görünüyor\nLütfen bağlantını kontrol et ve yeniden dene.",
              style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)))),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Text(
                "Yeniden Dene",
                style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ))
        ],
      ),
    ));
  }
}
