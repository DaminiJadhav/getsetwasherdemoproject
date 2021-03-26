import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/AppLocalizations.dart';

class ChangeLanguageExample extends StatefulWidget {
  @override
  _ChangeLanguageExampleState createState() => _ChangeLanguageExampleState();
}

class _ChangeLanguageExampleState extends State<ChangeLanguageExample> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text("Language"),
            // title: Text(Localizations.localeOf(context).toStringWithSeparator(separator: 'key_password')),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Text(AppLocalizations.of(context).translate('first_string')),
                Text(AppLocalizations.of(context).translate('second_string'))

                // Text(Localizations.localeOf(context).toStringWithSeparator(separator: 'key_email'))
              ],
            ),
          ),

    );
  }
}
