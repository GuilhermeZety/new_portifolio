/// Extending the bool class with a new method called `toNumber()`
extension ToSql on bool{
  int toNumber(){
    switch (this){
      case true:
        return 1;
      case false:
        return 0;
      default:
        return 0;
    }
  }
}

/// Extending the int class with a new method called `toBool()`
extension FromSql on int?{
  bool toBool(){
    switch (this){
      case 1:
        return true;
      case 0:
        return false;
      default:
        return false;
    }
  }
}