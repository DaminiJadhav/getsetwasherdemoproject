import 'package:flutter/material.dart';
import 'package:getsetwasherdemoproject/login/LoginScreen.dart';
import 'package:getsetwasherdemoproject/registration/WasherRegistration.dart';
import 'package:getsetwasherdemoproject/splash/SplashScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:getsetwasherdemoproject/widget/checkdatetime/CheckDataTimeExample.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/AppLocalizations.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/ChangeLanguageExample.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(
          supportedLocales: [Locale('en','US'),Locale('es','')],
          path: 'assets/',
          fallbackLocale: Locale('en','US'),
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // var data=EasyLocalization.of(context);

    return MaterialApp(
      // localizationsDelegates: context.localizationDelegates,
      localizationsDelegates: [
        AppLocalizations.delegate,

      ],
      localeResolutionCallback: (locale,supportedLocales){
        for(var supportedLocale in supportedLocales){
          if(supportedLocale.languageCode==locale.languageCode && supportedLocale.countryCode==locale.countryCode){
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },

      supportedLocales: [
        Locale('en','US'),
        Locale('sk','SK')
      ],
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:CheckDataTimeExample() ,
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

