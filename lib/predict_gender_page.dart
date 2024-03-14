// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'api_service_gender.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String name = '';
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qué género es?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Digite su nombre'),
            ),
            ElevatedButton(
              onPressed: () async {
                final fetchedGender = await ApiServiceGender.fetchGender(name);
                setState(() {
                  gender = fetchedGender;
                });
              },
              child: const Text('Determine su género'),
            ),
            gender.isNotEmpty
                ? Container(
                    width: 100,
                    height: 100,
                    color: gender == 'male' ? Colors.blue : Colors.pink,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
