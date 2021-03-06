class LanguageData{
  final String flag;
  final String name;
  final String languageCode;

  LanguageData(this.flag, this.name, this.languageCode);

  static List<LanguageData> languageList(){
    return <LanguageData>[
      LanguageData("๐บ๐ธ", "English", 'en'),
      LanguageData("๐ธ๐ฆ", "ุงูููุนูุฑูุจููููุฉูโ", "ar"),
      LanguageData("๐ฎ๐ณ", "เคนเคฟเคเคฆเฅ", 'hi'),
    ];
  }

}