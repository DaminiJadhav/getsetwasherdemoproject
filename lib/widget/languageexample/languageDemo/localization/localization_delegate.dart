import 'package:flutter/cupertino.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/language/language_ar.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/language/language_en.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/language/language_hi.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages>{


  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
     return ['en','ar','hi'].contains(locale.languageCode);
  }

  @override
  Future<Languages> load(Locale locale) {
     return _load(locale);
  }

  static Future<Languages> _load(Locale locale) async{
    switch(locale.languageCode){
      case 'en':
        return LanguageEn();
      case 'ar':
        return LanguageAr();
      case 'hi':
        return LanguageHi();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Languages> old) {
    return false;
  }

}