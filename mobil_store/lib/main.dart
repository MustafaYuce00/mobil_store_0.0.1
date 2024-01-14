import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobil_store/pages/internet.dart';
import 'package:mobil_store/pages/main.dart';
import 'constants/const.dart';
import 'data/sharedPrefsHelper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool hasInternet = true;
  Const constrant = Const();

  //! Internet Connection Check
  Future<void> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    hasInternet = connectivityResult != ConnectivityResult.none;
  }

  // ! Hesap var mı yok mu kontrolü
  void isAccount() async {
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
  void initState() {
    super.initState();
    checkInternetConnectivity().then((_) {
      setState(() {});
    });
    setState(() {
      isAccount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return hasInternet == true ? MainScreen() : InternetScreen();
  }
}
