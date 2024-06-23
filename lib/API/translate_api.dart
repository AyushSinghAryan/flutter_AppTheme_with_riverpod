import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_dart/API/translate_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslateAPI extends StatefulWidget {
  const TranslateAPI({super.key});

  @override
  State<TranslateAPI> createState() => _TranslateAPIState();
}

class _TranslateAPIState extends State<TranslateAPI> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  List<TranslatedLanguages> translations = [];

  @override
  void initState() {
    super.initState();
    _loadTranslations();
  }

  Future<void> _loadTranslations() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? storedList = sp.getString('translatedTexts');
    if (storedList != null) {
      setState(() {
        translations = List<Map<String, dynamic>>.from(json.decode(storedList))
            .map((item) => TranslatedLanguages.fromJson(item))
            .toList();
      });
    }
  }

  Future<void> _translateText(String text) async {
    const String url = 'https://google-translator9.p.rapidapi.com/v2';
    const Map<String, String> headers = {
      'x-rapidapi-key': '570c4aeef1mshd32df10eb8890f1p1c677bjsn7c0607998d14',
      'x-rapidapi-host': 'google-translator9.p.rapidapi.com',
      'Content-Type': 'application/json'
    };

    final Map<String, dynamic> data = {
      'q': text, // query
      'source': 'en', // english
      'target': 'hi', // hindi
      'format': 'text'
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final translatedText =
            responseData['data']['translations'][0]['translatedText'];
        setState(() {
          _response = translatedText;
          addTranslation(text, translatedText);
        });
      } else {
        setState(() {
          _response = 'Request failed with status: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        _response = 'Error: $error';
      });
    }
  }

  void addTranslation(String englishText, String hindiText) {
    setState(() {
      translations.add(TranslatedLanguages(
          englishLanguage: englishText, hindiLanguage: hindiText));
    });
    _saveTranslations();
  }

  Future<void> _saveTranslations() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('translatedTexts',
        json.encode(translations.map((e) => e.toJson()).toList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter text to translate in Hindi',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _translateText(_controller.text);
              },
              child: const Text(
                'Translate',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _response,
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: translations.length,
                itemBuilder: (context, index) {
                  final translation = translations[index];
                  return ListTile(
                    title: Text(translation.englishLanguage),
                    subtitle: Text(translation.hindiLanguage),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
