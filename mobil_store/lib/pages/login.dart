import 'package:flutter/material.dart';
import 'package:mobil_store/data/sharedPrefsHelper.dart';
import 'package:mobil_store/firebase/firebaseService.dart';
import 'package:mobil_store/pages/main.dart';
import '../constants/const.dart';
import '../login/flutter_login.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  Const constrant = Const();
  FirebaseService firebaseService = FirebaseService();
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData loginData) async {
    var user =
        await firebaseService.signIn(loginData.name!, loginData.password!);
    return Future.delayed(loginTime).then((_) async {
      if (user != null) {
        print("Giriş başarılı: ${user.email}");
        await SharedPrefsHelper.saveUser(loginData);
        constrant.accountAvailable.value = true;
        return null;
      } else {
        print("Giriş başarısız");
        return "Kullanıcı adı veya şifre hatalı";
      }
    });
  }

  Future<String?> _signupUser(SignupData signupData) async {
    var user =
        await firebaseService.signUp(signupData.name!, signupData.password!);
    if (user != null) {
      print("Kayıt başarılı: ${user.email}");
    } else {
      print("Kayıt başarısız");
    }
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogin(
        title: 'Mobile Store',
        //logo:  AssetImage('assets/images/ecorp-lightblue.png'),
        onLogin: _authUser,
        onSignup: _signupUser,
        loginProviders: <LoginProvider>[
          LoginProvider(
            icon: Icons.person,
            label: 'Giriş Yapmadan Devam Et',
            callback: () async {
              await Future.delayed(loginTime);
              Navigator.pop(context);
              return null;
            },
          ),
        ],
        onSubmitAnimationCompleted: () async {
          var user = await SharedPrefsHelper.getUser();
          if (user!.name! == "admin@gmail.com" && user.password! == "admin1") {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
                (route) => false);
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
                (route) => false);
          }
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }
}
