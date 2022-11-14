import 'package:http/http.dart' as http;



enum StatusAccount{
  successfully,
  error
}
class ApiServices{



 Future<StatusAccount> createUser(Map<String,dynamic> user) async{
    final url = Uri.http("http://3.93.230.167/","api/artist/create");
    final response = await http.post(url,
    body: user);
    if (response.statusCode == 200) {
      print("Se creo correctamente");
      return StatusAccount.successfully;
    }else{
      print("No se pudo crer");
      return StatusAccount.error;
    }
  }
}