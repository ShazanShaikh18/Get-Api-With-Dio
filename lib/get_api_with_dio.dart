import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetApiWithDio extends StatefulWidget {
  const GetApiWithDio({super.key});

  @override
  State<GetApiWithDio> createState() => _GetApiWithDioState();
}

class _GetApiWithDioState extends State<GetApiWithDio> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    getDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('Get Api With Dio')),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView(
          children: users.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                color: const Color.fromARGB(255, 225, 240, 243),
                elevation: 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Image : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              e["image"],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Id : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["id"].toString(),
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'First Name : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["firstName"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Last Name : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["lastName"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Maiden Name : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["maidenName"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Age : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["age"].toString(),
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Gender : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["gender"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Email : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["email"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Phone : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["phone"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'User Name : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["username"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Password : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["password"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Birth Date : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["birthDate"].toString(),
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Blood Group : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["bloodGroup"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Height : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["height"].toString(),
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Weight : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["weight"].toString(),
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Eye Color : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["eyeColor"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Hair : ' + 'Type , Color',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["hair"]["color"] + ', ' + e["hair"]["type"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'City : ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            e["address"]["city"],
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void getDio() async {
    try {
      final response =
          await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
              .get('https://dummyjson.com/users');

      users = response.data["users"];
      setState(() {});
    } catch (e) {
      print(e);
    }
  }
}
