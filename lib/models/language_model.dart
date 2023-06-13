class LanguageModel {
  String language;
  String country_code;

  static List<LanguageModel> getLanguages() {
return[
    LanguageModel("English",'en'),
    LanguageModel("Arabic",'ar'),
    LanguageModel("French",'fr'),
    LanguageModel("Russian",'ru'),];
  }

  LanguageModel(this.language, this.country_code);
}
