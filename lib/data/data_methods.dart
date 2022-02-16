import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_keys.dart';

getAuthedHeader() async {
  final token = await getToken();
  final header = {
    "Accept": "application/json",
    "ContentType": "application/json",
    'Authorization': 'Bearer $token',
  };
  return header;
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(kToken);
}

saveClientToken(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(kToken, value);
}

removeClientToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("Client exitted!");
  prefs.remove(kToken);
  prefs.remove(kCityName);
  prefs.remove(kCityId);
}

setCityData(int? id, String? city) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(kCityName, city!);
  prefs.setInt(kCityId, id!);
  print("New city is: ${prefs.getString(kCityName)}");
}

Future<String?> getCityName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(kCityName);
}
getCityId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(kCityId);
}
