import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  late final SharedPreferences pref;
  static const uidkey = 'uid_key';
  Future<bool> init() async {
    //Эгер тиркеме ачылганда uidini оку
    pref = await SharedPreferences.getInstance();
    final uid = pref.getString(uidkey);
    // if (uid != null) {
    //   return true;
    // } else {
    //   return false;
    // }
//Эгер uidсi бар болсо HomePageге жибер
//Эгер uid жок болсо  flash_chatка жибер
    return uid != null;
  }

//Эгер колдонуучу логин же регистрация  болсо uidсин кешке сактасын.
  Future<void> setUid(String uid) async {
    await pref.setString(uidkey, uid);
  }

//Эгерде колдонуучу logout же delete болсо uidси өчүп калсын
  Future<void> removeUid() async {
    await pref.remove(uidkey);
  }
}

final userManager = UserManager();
