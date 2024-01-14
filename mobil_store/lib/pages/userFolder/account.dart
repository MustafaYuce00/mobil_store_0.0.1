import 'package:flutter/material.dart';
import 'package:mobil_store/data/sharedPrefsHelper.dart';
import 'package:mobil_store/pages/login.dart';
import 'package:mobil_store/pages/adminFolder/mainAdmin.dart';
import 'package:mobil_store/pages/main.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../constants/const.dart';
import '../../login/src/models/login_data.dart';

Const constrant = Const();
LoginData loginData = LoginData(name: "", password: "");

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    super.key,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool butonabas = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      await isAccount(context);
    });
  }

  // ! Hesap var mı yok mu kontrolü
  Future<void> isAccount(BuildContext context) async {
    LoginData? value = await SharedPrefsHelper.getUser();
    loginData = value ?? LoginData(name: "", password: "");

    // Sonucu bekleyip sonra durumu güncelleyin
    if (loginData.name != "" && loginData.password != "") {
      setState(() {
        constrant.accountAvailable.value = true;
      });
    } else {
      setState(() {
        constrant.accountAvailable.value = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loginData.name == "admin@gmail.com" && loginData.password == "admin1"
        ? MainAdminScrees()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text('Account Screen'),
                automaticallyImplyLeading: false,
                actions: [
                  constrant.accountAvailable.value == true
                      ? IconButton(
                          onPressed: () async {
                            await SharedPrefsHelper.saveUser(
                                LoginData(name: "", password: ""));
                            constrant.accountAvailable.value = false;
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return MainScreen();
                              },
                            ));
                          },
                          icon: Icon(Icons.logout))
                      : Container(),
                ],
              ),
              body: constrant.accountAvailable.value == true
                  ? HesapVarAccount()
                  : HesapYokAccount(),
            ),
          );
  }
}

class HesapVarAccount extends StatefulWidget {
  const HesapVarAccount({super.key});

  @override
  State<HesapVarAccount> createState() => _HesapVarState();
}

class _HesapVarState extends State<HesapVarAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Account Screen( hesap var )')),
    );
  }
}

class HesapYokAccount extends StatefulWidget {
  const HesapYokAccount({super.key});

  @override
  State<HesapYokAccount> createState() => _HesapYokState();
}

class _HesapYokState extends State<HesapYokAccount> {
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
            'Hesabınızı görüntüleyebilmek için lütfen giriş yapın. Beğendiğiniz ürünleri favorilerinize ekleyebilirsiniz. Hesabınız yoksa kayıt olabilirsiniz.',
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
