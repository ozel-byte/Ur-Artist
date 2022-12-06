import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urartist/controller/saveUserSharedPreferences.dart';

enum StatusAccount { successfully, error, errorTimeOut, errorCredential, serviceUnavailable, badGateway }

class ApiServices {
  Future<StatusAccount> createComunidad(Map<String, dynamic> user) async {
    final url = Uri.https("urartist.urartist.click", "cliente/create");
    print(user);
    final request = http.MultipartRequest("POST", url);
    request.fields.addAll({
      "name": user["name"],
      "lastname": user["lastname"],
      "mail": user["mail"],
      "password": user["password"],
      "number_phone": user["number_phone"]
    });

    request.files.add(
        await http.MultipartFile.fromPath("perfilfile", user["photo_profile"]));
    http.StreamedResponse response = await request.send();
    final resp = await http.Response.fromStream(response);
    print(resp.body);
    if (response.statusCode == 200) {
      await SaveUserSharedPreferences()
          .saveUserComunnity(jsonDecode(resp.body)["client"]);
      return StatusAccount.successfully;
    } else {
      return StatusAccount.error;
    }
    // final response = await http.post(
    //   url,
    //   headers: {
    //     "Content-Type": "application/json"
    //   },
    //   body: json.encode({
    //     "name": user["name"],
    //     "lastname": user["lastname"],
    //     "mail": user["mail"],
    //     "password": user["password"],
    //     "photo_profile": user["photo_profile"],
    //     "number_phone": user["number_phone"]
    // }));
    // print(response.body);
    // if (response.statusCode == 200) {
    //   SaveUserSharedPreferences().saveUserComunnity(jsonDecode(response.body)["client"]);
    //   return StatusAccount.successfully;
    // } else {

    //   return StatusAccount.error;
    // }
  }

  Future<StatusAccount> createArtist(
      Map<String, dynamic> user, Map<String, dynamic> dataPresskit) async {
    final request = http.MultipartRequest(
        "POST", Uri.https("ozmotecha.urartist.click", "artist/create"));
    request.fields.addAll({
      "email": user["email"],
      "password": user["password"],
      "name_artistic": user["name_artistic"],
      "brief_description": user["brief_description"],
      "location": user["location"],
      "question_1": user["question_1"],
      "question_2": user["question_2"]
    });
    request.files.add(
        await http.MultipartFile.fromPath("perfilfile", user["photo_profile"]));
    request.files.add(
        await http.MultipartFile.fromPath("portadafile", user["background"]));
    http.StreamedResponse response = await request.send();
    final resp = await http.Response.fromStream(response);
    print(resp.body);

    String idUser = jsonDecode(resp.body)["data"]["id"].toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> presskit = {
        "id_artista": idUser,
        "anio_formacion": dataPresskit["anio_formacion"],
        "genero": dataPresskit["genero"],
        "correo_contecto": dataPresskit["correo_contecto"],
        "telefono": dataPresskit["telefono"],
        "link_a_contenido": dataPresskit["link_a_contenido"],
        "total_integrantes": dataPresskit["total_integrantes"]
      };
       await crearPresskit(presskit);
      // saveIdUser(jsonDecode(resp.body)["data"]);
      SaveUserSharedPreferences().saveUser(jsonDecode(resp.body)["data"]);
      return StatusAccount.successfully;
    } else {
      return StatusAccount.error;
    }

    // final url = Uri.http("3.93.230.167", "api/artist/create");

    // final response = await http.post(url, body: user);
    // if (response.statusCode == 200) {
    //   print("Se creo correctamente");
    //   print(response.body);
    //   return StatusAccount.successfully;
    // } else {
    //   print("No se pudo crer");
    //   return StatusAccount.error;
    // }
  }

  Future<List<String>> getGen() async {
    List<String> gen = [];
    final url = Uri.https("ozmotecha.urartist.click", "genero/getAll");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      for (var element in jsonDecode(response.body)["data"]) {
        gen.add(element["nombre_genero"]);
      }
      print(gen);
      return gen;
    }
    if (response.statusCode == 503) {
      return ["Cumbia", "Jaz", "Rock", "Indie"];
    }
    print(response.body);
    return [];
  }

 Future<String> crearPresskit(Map<String, dynamic> presskit) async {
    final url = Uri.https("ozmotecha.urartist.click", "preskkit/create");
    final response = await http.post(url, body: presskit);
    if (response.statusCode == 200) {
      
      print("presskit");
      print(response.body);
      return jsonDecode(response.body)["data"]["id"].toString();
    } else {
      print("No se pudo crear");
      return "0";
    }
  }

  Future<StatusAccount> createHuerfano(Map<String, dynamic> user) async {
    final url = Uri.http("http://3.93.230.167/", "artist/create");
    final response = await http.post(url, body: user);
    if (response.statusCode == 200) {
      print("Se creo correctamente");
      return StatusAccount.successfully;
    } else {
      print("No se pudo crer");
      return StatusAccount.error;
    }
  }

  Future<Map<String, dynamic>> login(String correo, String password) async {
    final url = Uri.https("urartist.urartist.click", "auth/login");
    final response =
        await http.post(url, body: {"mail": correo, "password": password});

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)["tipo"] == "Cliente") {
        print(response.body);
        await SaveUserSharedPreferences()
            .saveUserComunnity(jsonDecode(response.body)["datos"]);
        return {
          "status": StatusAccount.successfully,
          "type": jsonDecode(response.body)["tipo"]
        };
      }
      if (jsonDecode(response.body)["tipo"] == "Artista") {
        print(response.body);
        await SaveUserSharedPreferences()
            .saveUser(jsonDecode(response.body)["datos"]);
        return {
          "status": StatusAccount.successfully,
          "type": jsonDecode(response.body)["tipo"]
        };
      }
      if (jsonDecode(response.body)["tipo"] == "Huerfano") {
        return {
          "status": StatusAccount.successfully,
          "type": jsonDecode(response.body)["tipo"]
        };
      } else {
        return {
          "status": StatusAccount.error,
        };
      }
    }
    if (response.statusCode == 503) {
      return {"status": StatusAccount.serviceUnavailable};
    }
    if (response.statusCode == 401) {
      return {"status": StatusAccount.errorCredential};
    }
    print("llego hasta aqui");

    if (response.statusCode == 502) {
      return {
        "status": StatusAccount.badGateway
      };
    }
    return {
      "status": StatusAccount.error,
    };
  }

  Future<Map<String,dynamic>> getPresskit(id) async {
    print(id);
    final url = Uri.https("ozmotecha.urartist.click", "preskkit/getOne");
    final response =
        await http.post(url, body: {"preskkitId": id});
    
    if (response.statusCode == 200) {
      print("obteniendo presskit");
      print(jsonDecode(response.body)["data"]);
      return {
        "status": "sucessfully",
        "año": jsonDecode(response.body)["data"]["anio_formacion"],
        "genero": jsonDecode(response.body)["data"]["genero"],
        "correo_contacto": jsonDecode(response.body)["data"]["correo_contecto"],
        "telefono": jsonDecode(response.body)["data"]["telefono"]
      };
    }
    if (response.statusCode == 502) {
      return {
      "status":"error"
    };
    }
    if (response.statusCode == 503) {
      return {
      "status":"error"
    };
    }
    return {
      "status":"error"
    };
  }


 Future<StatusAccount> updateTextField(Map<String,dynamic>newValue,id) async {
    print(newValue);
    final url = Uri.https("urartist.urartist.click", "cliente/update/${id}");
    final response =
        await http.put(
          url, 
          body: newValue
          );
    print(response.body);
    if (response.statusCode == 200) {
      return StatusAccount.successfully;
    }

    if (response.statusCode == 502) {
      return StatusAccount.serviceUnavailable;
    }

    if (response.statusCode == 503) {
      return StatusAccount.badGateway;
    }

    return StatusAccount.error;
  }

  Future<StatusAccount> post(Map<String, dynamic> user) async {
    var request = http.MultipartRequest('POST',
        Uri.https("ozmotecha.urartist.click", "contenido/create/image"));
    request.fields.addAll(
        {'id_artista': user["id_artista"], 'descripcion': user["descripcion"]});

    request.files
        .add(await http.MultipartFile.fromPath('contenfile', user["img"]));

    http.StreamedResponse response = await request.send();
    final resp = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      print(resp.body);
      return StatusAccount.successfully;
    }
    if (response.statusCode == 503) {
      return StatusAccount.errorTimeOut;
    }
    print(resp.body);
    return StatusAccount.error;
  }

 Future<Map<String,dynamic>> search(value) async {
    final url = Uri.https("ozmotecha.urartist.click", "artist/search");
    final response =
        await http.post(url, body: {"search": value});
    
    if (response.statusCode == 200) {
      print("entro aqui");
      return {
        "status": StatusAccount.successfully,
        "data": jsonDecode(response.body)["data"]
      };
    }
    if (response.statusCode == 502) {
      return {
        "status" : StatusAccount.badGateway
      };
    }

    if (response.statusCode == 503) {
      return {
        "status" : StatusAccount.serviceUnavailable
      };
    }

    return {
      "status": StatusAccount.error
    };
  }

  Future<Map<String, dynamic>> getImgUser(userId) async {
    print("entro aqui");
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET',
        Uri.parse('https://www.ozmotecha.urartist.click/contenido/getAll'));
    request.body = json.encode({"artistId": userId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final resp = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      print(jsonDecode(resp.body)["data"]);
      return {
        "status": StatusAccount.successfully, 
        "data": jsonDecode(resp.body)["data"]};
    }
    if (response.statusCode == 401) {
      return {};
    }
    if (response.statusCode == 503) {
      return {};
    }
    return {};
  }
}
