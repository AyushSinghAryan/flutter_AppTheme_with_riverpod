class TranslatedLanguages {
  final String englishLanguage;
  final String hindiLanguage;

  TranslatedLanguages(
      {required this.englishLanguage, required this.hindiLanguage});

  // Method to convert an instance to a Map
  Map<String, dynamic> toJson() => {
        'englishLanguage': englishLanguage,
        'hindiLanguage': hindiLanguage,
      };

  // Method to create an instance from a Map
  factory TranslatedLanguages.fromJson(Map<String, dynamic> json) =>
      TranslatedLanguages(
        englishLanguage: json['englishLanguage'],
        hindiLanguage: json['hindiLanguage'],
      );
}
