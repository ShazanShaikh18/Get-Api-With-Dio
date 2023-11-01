import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _jsonList;

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    try {
      var response =
          await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
              .get('https://protocoderspoint.com/jsondata/superheros.json');

      if (response.statusCode == 200) {
        setState(() {
          _jsonList = response.data["superheros"] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Api With Dio'),
      ),
      body: ListView.builder(
        itemCount: _jsonList == null ? 0 : _jsonList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      _jsonList[index]['url'],
                      fit: BoxFit.fill,
                      height: 80,
                      width: 55,
                    ),
                  ),
                  title: Text(
                    _jsonList[index]["name"],
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    _jsonList[index]["power"],
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
