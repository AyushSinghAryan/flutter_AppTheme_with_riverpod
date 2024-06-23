import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIPratice extends StatefulWidget {
  const APIPratice({super.key});

  @override
  State<APIPratice> createState() => _APIPraticeState();
}

class _APIPraticeState extends State<APIPratice> {
  String url = "";

  String body = "";
  Map<String, String> headers = {};
  Future<void> httpTest() async {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
