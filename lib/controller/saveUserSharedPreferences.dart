import 'package:shared_preferences/shared_preferences.dart';

class SaveUserSharedPreferences {
  
  saveUser(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("user", [
      user["id"].toString(),
      user["id_preskkit"].toString(),
      user["email"],
      user["name_artistic"],
      user["photo_profile"],
      user["photo_portada"],
      user["brief_description"],
      user["location"]
    ]);
  }

  saveUserComunnity(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("user", [
      user["id"].toString(),
      user["name"],
      user["lastname"],
      user["mail"],
      user["photo_profile"],
      user["number_phone"].toString()
    ]);
  }

  Future<Map<String, dynamic>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('user');
    return {
      "id": items![0],
      "id_preskkit": items[1],
      "email": items[2],
      "name_artistic": items[3],
      "photo_profile": items[4],
      "photo_portada": items[5],
      "brief_description": items[6],
      "location": items[7]
    };
  }

  Future<Map<String, dynamic>> getUserCommunity() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('user');
    return {
      "id": items![0],
      "name": items[1],
      "lastname": items[2],
      "mail": items[3],
      "photo_profile": items[4],
      "number_phone": items[5],
    };
  }

  remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
    prefs.remove("view");

  }

  saveSignIn(view)async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("view", view);
  }

  Future<String> exists() async {
    final prefs = await SharedPreferences.getInstance();
    final response =  prefs.containsKey("view");
    if (response) {
      return  prefs.get("view").toString();
    }else{
      return "splash";
    }
  }
}
