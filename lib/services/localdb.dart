import 'package:shared_preferences/shared_preferences.dart';

class LocalDB{
  static final uidKey = "fsfjkfskjfsfv";
  static final lkey = "467435bvesgwyh";
  static final rkey = "4543467435bvesgwyh";
  static final nkey = "45363w54svegrft";
  static final mkey = "65g14er4efesdfeaswcsdfv45";
  static final pkey = "65g14ascafder4ev45";
  static SharedPreferences preferences =  SharedPreferences.getInstance() as SharedPreferences;

  static Future<bool> saveUserID(String uid) async {

    return await preferences.setString(uidKey, uid);
  }

  static Future<String?> getUserID() async {
    return await preferences.getString(uidKey);
  }



  static Future<bool> saveMoney(String money) async {
    return await preferences.setString(mkey, money);
  }

  static Future<String?> getMoney() async {
    return await preferences.getString(mkey);
  }



  static Future<bool> saveName(String name) async {
    return await preferences.setString(nkey, name);
  }

  static Future<String?> getName() async {
    return await preferences.getString(nkey);
  }


  static Future<bool> saveUrl(String prourl) async {
    return await preferences.setString(pkey, prourl);
  }

  static Future<String?> getUrl() async {
    return await preferences.getString(pkey);
  }



  static Future<bool> saveLevel(String level) async {
    return await preferences.setString(lkey, level);
  }

  static Future<String?> getLevel() async {
    return await preferences.getString(lkey);
  }





  static Future<bool> saveRank(String rank) async {
    return await preferences.setString(rkey, rank);
  }

  static Future<String?> getRank() async {
    return await preferences.getString(rkey);
  }





}