

class ValidTextField{


 bool validUsername(String value){
    if (value.isEmpty || value.length>20) {
      return true;
    }else{
      return false;
    }
  }

  bool validLastName(String value){
    if (value.isEmpty || value.length>20) {
      return true;
    }else{
      return false;
    }
  }

  bool validPassword(String value){
    if (value.isEmpty || value.length<9) {
      return true;
    }else{
      return false;
    }
  }

  bool validEmail(String value){
    final regExpEmail = RegExp(r"^[a-z0-9](\.?[a-z0-9]){2,}@g(oogle)?mail\.com$");
    if (regExpEmail.hasMatch(value)) {
      return false;
    }else{
      return true;
    }
  }

  bool validBio(String value){
    if (value.isEmpty || value.length>10) {
      return true;
    }else{
      return false;
    }
  }


  bool validNumber(String value){
    if (value.length!=10) {
      return true;
    }else{
      return false;
    }
  }

  bool validInstrument(String value){
    if(value.length>10){
      return true;
    }else{
      return false;
    }
  }
}