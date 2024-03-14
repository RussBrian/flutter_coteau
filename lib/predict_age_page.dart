import 'package:flutter/material.dart';
import 'api_service_age.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  String name = '';
  int age = 0;

  Future<void> fetchAgeAndShowStatus(String name) async {
    final fetchedAge = await ApiServiceAge.fetchAge(name);
    setState(() {
      age = fetchedAge;
    });
  }

  String getAgeCategory(int age) {
    if (age < 18) {
      return 'Jovén';
    } else if (age < 65) {
      return 'Adulto';
    } else {
      return 'Anciano';
    }
  }

  String getAgeMessage(int age) {
    final ageCategory = getAgeCategory(age);
    return 'Usted es $ageCategory. Y su edad es $age.';
  }

  String getImageUrl(int age) {
    final ageCategory = getAgeCategory(age);
    switch (ageCategory) {
      case 'Jovén':
        return 'assets/imagenJovenes.png';
      case 'Adulto':
        return 'assets/imagenAdultos.jpg'; 
      case 'Anciano':
        return 'assets/imagenAncianos.jpg';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rango de edad'),
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
              onPressed: () {
                fetchAgeAndShowStatus(name);
              },
              child: const Text('Determine su edad'),
            ),
            age != 0
                ? Column(
                    children: [
                      Text(
                        getAgeMessage(age),
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Image.network(
                        getImageUrl(age),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}