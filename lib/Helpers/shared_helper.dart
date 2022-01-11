/*
import 'dart:convert';

import 'package:opm/Utils/CachingKeys.dart';
import 'package:opm/Utils/enumeration.dart';
import 'package:shared_preferences/shared_preferences.dart';





class SharePreferenceHelper {
  late SharedPreferences _shared;

  removeData(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    _shared.remove(key.value);
  }
  removeDataWithKey(String key) async {
    _shared = await SharedPreferences.getInstance();
    _shared.remove(key);
  }

  // Future<User> getUser() async {
  //   User _user;
  //   _shared = await SharedPreferences.getInstance();
  //   _user = User.fromJson(jsonDecode(_shared.getString(CachingKey.USER.value)));
  //   print('User >>> ${_user.toJson()}');
  //   return _user;
  // }

  // copyUserWith(User user) async {
  //   _shared = await SharedPreferences.getInstance();
  //
  //   User _finalUser = User.fromJson(jsonDecode(_shared.getString(CachingKey.USER.value)));
  //
  //   Map<String, dynamic> _newUser = {};
  //   _newUser.addAll(_finalUser.toJson());
  //
  //   for (int i = 0; i < user.toJson().length; i++) {
  //     if (user.toJson().values.toList()[i] != null) {
  //       _newUser[user.toJson().entries.toList()[i].key] = user.toJson().values.toList()[i];
  //     }
  //   }
  //   await _shared.setString(CachingKey.USER.value, json.encode(_newUser));
  // }

  clear(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    _shared.clear();
  }
  Future<void>logout() async {
    await removeData(CachingKey.TOKEN);
  }

  writeData(CachingKey key, value) async {
    _shared = await SharedPreferences.getInstance();
    print("Saving >>> $value local >>> with key ${key.value}");
    if (value is String) {
      _shared.setString(key.value, value);
    } else if (value is int) {
      _shared.setInt(key.value, value);
    } else if (value is bool) {
      _shared.setBool(key.value, value);
    } else if (value is double) {
      _shared.setDouble(key.value, value);
    } else {
      return null;
    }
  }


  writeDataWithStringKey(String key, value) async {
    _shared = await SharedPreferences.getInstance();
    print("Saving >>> $value local >>> with key $key");
    if (value is String) {
      _shared.setString(key, value);
    } else if (value is int) {
      _shared.setInt(key, value);
    } else if (value is bool) {
      _shared.setBool(key, value);
    } else if (value is double) {
      _shared.setDouble(key, value);
    } else {
      return null;
    }
  }

  Future<bool> readBoolean(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    return Future.value(_shared.getBool(key.value));
  }

  Future<double> readDouble(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    return Future.value(_shared.getDouble(key.value));
  }

  Future<int> readInteger(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    return Future.value(_shared.getInt(key.value));
  }
  Future<String> readStringWithStringKey(String key) async {
    _shared = await SharedPreferences.getInstance();
    return Future.value(_shared.getString(key));
  }

  Future<String> readString(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    return Future.value(_shared.getString(key.value));
  }
}
*/
