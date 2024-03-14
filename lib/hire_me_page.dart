import 'package:flutter/material.dart';

// Esta es la vista donde se demustran informaciones personales que pueden servir para la comunicacion directa, 
//en este caso se muestra con una imagen centrada y debajo de esta imagen un texto de descripcion

class HireMe extends StatelessWidget{
  const HireMe({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Contratame'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            SizedBox(
              height: 500.0,
              width: 400.0,
              child: Image.asset('assets/russel_martinez.jpg', fit: BoxFit.fitWidth),
            ),
            const Text('Russel Brian Martinez Veloz'),
            const Text('brianmartinez0877@gmail.com'),
            const Text('809-403-5967')
          ],
        ),),
    );
  }
}
