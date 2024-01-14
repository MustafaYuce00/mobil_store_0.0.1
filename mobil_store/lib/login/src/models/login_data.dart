import 'package:quiver/core.dart';

class LoginData {
  String? name;
  String? password;

  LoginData({required this.name, required this.password});

  LoginData.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name!.trim();
    data['password'] = this.password!.trim();
    return data;
  }

  @override
  String toString() {
    return 'LoginData($name, $password)';
  }

  @override
  bool operator ==(Object other) {
    if (other is LoginData) {
      return name == other.name && password == other.password;
    }
    return false;
  }

  @override
  int get hashCode => hash2(name, password);


  
}
