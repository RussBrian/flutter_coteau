import 'package:flutter/material.dart';
import 'package:flutter_application_6/university_page.dart';
import 'predict_age_page.dart';
import 'predict_gender_page.dart';
import 'hire_me_page.dart';
import 'wordpress_page.dart';
import 'weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Function App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainMenu(),
    );
  }
}

//Russel Brian Martinez Veloz - 2021-1742
 
class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: ListView(
        children: [
          // Aceptar el nombre de una persona y predecir su genero: (https://api.genderize.io/?name=irma) 
          //si es masculino mostraras algo azul, de lo contrario algo rosa en la pantalla.
          ListTile(
            title: const Text('Género'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GenderPage()),
              );
            },
          ),
          // Vista que acepte el nombre de una persona y determine la edad de la misma (https://api.agify.io/?name=meelad) dependiendo la edad 
          //de la persona debes mostrar un mensaje que diga si es joven, adulto o anciano. Muestra una imagen relativa a cada estado y su edad en numero.
          ListTile(
            title: const Text('Rango Edad'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AgePage()),
              );
            },
          ),
          // Programa que acepte el nombre de un país en ingles: muestre las universidades de Ese país,  url: http://universities.hipolabs.com/search?country=Dominican+Republic 
          //, luego mostrar el nombre, dominio y link a pagina web de cada universidad. 
            ListTile(
            title: const Text('Universidades'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UniversityListPage()),
              );
            },
          ),  
          //Clima en RD: La aplicación nos va a mostrar como estará el clima para el dia en que estamos visualizando la tarea.
          ListTile(
            title: const Text('Clima RD'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeatherView()),
              );
            },
          ),
          // Una vista donde mostraras el logo de alguna página web hecha con WordPress y luego mostraras el titular y 
          //resumen de las últimas 3 noticias publicadas en la misma. Colocar un link visitar donde nos lleva a la noticia origina
          ListTile(
            title: const Text('Wordpress - Renault'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WordPressNewsPage()),
              );
            },
          ),
          //Agregue una opción acerca de, donde mostraras tu foto y datos de contactos para posibles trabajos. 
          ListTile(
            title: const Text('Contrátame'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HireMe()),
              );
            },
          ),
        ],
      ),
    );
  }
}
