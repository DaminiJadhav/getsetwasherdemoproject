import 'package:flutter/material.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/language/languages.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/localization/locale_constant.dart';
import 'package:getsetwasherdemoproject/widget/languageexample/languageDemo/model/LanguageData.dart';

class LanguageExample extends StatefulWidget {
  @override
  _LanguageExampleState createState() => _LanguageExampleState();
}

class _LanguageExampleState extends State<LanguageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.language,
          color: Colors.white,
        ),
        title: Text(Languages
            .of(context)
            .appName),

      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Text(
                Languages
                    .of(context)
                    .labelWelcome,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                Languages
                    .of(context)
                    .labelInfo,
                style: TextStyle(fontSize: 20, color: Colors.grey),
                textAlign: TextAlign.center,

              ),
              SizedBox(
                height: 70,
              ),
              Expanded(
                  child: _createLanguageDropDown()
              )

            ],
          ),
        ),
      ),

    );
  }

  _createLanguageDropDown() {
    return DropdownButton<LanguageData>(
      iconSize: 30,
      hint: Text(Languages
          .of(context)
          .labelSelectLanguage),
      onChanged: (LanguageData language) {
        print(language.languageCode);
        changeLanguage(context, language.languageCode);
      },
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (e) =>
            DropdownMenuItem<LanguageData>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
      )
          .toList(),
    );
  }
}
