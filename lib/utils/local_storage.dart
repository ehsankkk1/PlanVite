import 'package:get_storage/get_storage.dart';

class LocalStorageGet{

//write
  void saveLanguageToDisk(String language)async{

    await GetStorage().write('lang', language);
  }
//read
Future<String?>get languageSelected async{
    return await GetStorage().read('lang');
}
}