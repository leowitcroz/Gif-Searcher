import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search = '';
  int offSet = 0;

  Future<Map> _getGifs() async {
    http.Response response;
    if (_search == '') {
      dynamic url = Uri.parse(
          'https://api.giphy.com/v1/gifs/trending?api_key=jUFn3dN5f13C1LIouV0QrTR9jKgW9PML&limit=20&offset=0&rating=g&bundle=messaging_non_clips');

      response = await http.get(url);
    } else {
      dynamic url = Uri.parse(
          'https://api.giphy.com/v1/gifs/search?api_key=jUFn3dN5f13C1LIouV0QrTR9jKgW9PML&q=${_search}limit=20&offset=${offSet}&rating=g&lang=en&bundle=messaging_non_clips');
      response = await http.get(url);
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) => {print(map)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
          'https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif',
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Pesquise Aqui',
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: const OutlineInputBorder(
                  // Define a cor da borda padrão
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  // Define a cor da borda quando em foco
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
