// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'university_class.dart';
import 'api_service_university.dart';

class UniversityListPage extends StatefulWidget {
  const UniversityListPage({super.key});

  @override
  _UniversityListPageState createState() => _UniversityListPageState();
}

class _UniversityListPageState extends State<UniversityListPage> {
  late List<University> universities;
  final TextEditingController _countryController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    universities = [];
  }

  Future<void> _fetchUniversities(String country) async {
    setState(() {
      _isLoading = true;
    });

    final fetchedUniversities = await fetchUniversities(country);

    setState(() {
      universities = fetchedUniversities;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidades segun el pais en ingles'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _countryController,
              decoration: InputDecoration(
                labelText: 'Digite el nombre del pais en ingles',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _fetchUniversities(_countryController.text.trim());
                  },
                ),
              ),
            ),
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: universities.length,
                    itemBuilder: (context, index) {
                      final university = universities[index];
                      return ListTile(
                        title: Text(university.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dominio: ${university.domain}'),
                            Text('Link: ${university.website}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
