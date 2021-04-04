
import 'dart:convert';

import 'package:shared_perference/model/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsAccount {
  static storeAccount (Account account) async {
    SharedPreferences prefsAccount = await SharedPreferences.getInstance();
    String stringAccount = jsonEncode(account);
    prefsAccount.setString("account", stringAccount);
  }
  static Future <Account> loadAccount () async {
    SharedPreferences prefsAccount = await SharedPreferences.getInstance();
    String stringAccount = prefsAccount.getString("account");
    if (stringAccount == null || stringAccount.isEmpty){
      return null;
    }
    Map map = jsonDecode(stringAccount);
    return Account.fromJason(map);
  }
  static Future <bool> removeAccount () async {
    SharedPreferences prefsAccount = await SharedPreferences.getInstance();
    return prefsAccount.remove("account");
  }
}