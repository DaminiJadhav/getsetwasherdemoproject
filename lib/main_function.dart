import 'package:flutter/material.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/LanguageExamples.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/localization/locale_constant.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/localization/localization_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(MyAppLanguages());
}

class MyAppLanguages extends StatefulWidget {

  static void setLocale(BuildContext context,Locale newLocale){
    var state=context.findAncestorStateOfType<_MyAppLanguagesState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppLanguagesState createState() => _MyAppLanguagesState();
}

class _MyAppLanguagesState extends State<MyAppLanguages> {

   Locale _locale;

   void setLocale(Locale locale){
     setState(() {
       _locale=locale;
     });
   }

   @override
  void didChangeDependencies() async{
     getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Language',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: [
        Locale('en',''),
        Locale('ar',''),
        Locale('hi',''),
      ],
      localizationsDelegates: [
        AppLocalizationsDelegate(),

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: LanguageExample(),
      localeResolutionCallback: (locale,supportedLocales){
          for(var supportLocale in supportedLocales){
            if(supportLocale?.languageCode==locale?.languageCode && supportLocale?.countryCode==locale?.countryCode){
              return supportLocale;
            }
          }
          return supportedLocales?.first;
      },
    );
  }
}
