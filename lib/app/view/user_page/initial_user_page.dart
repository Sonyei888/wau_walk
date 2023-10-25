import 'package:flutter/material.dart';

class InitialUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: <Widget>[
            Image.asset( // Agrega la imagen a la izquierda
              'assets/logo_sm_wauwalk.png',
              width: 80.0, // Ajusta el ancho de la imagen según tus necesidades
            ),
            SizedBox(width: 8.0), // Espacio entre la imagen y el texto
            Text('Hi, Yeison'), // Agrega el texto a la derecha
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/maps.png',
            width: 1000.0, // Establece el ancho de la imagen según tus necesidades
          ),
          SizedBox(height: 20.0), // Espacio entre la imagen y los botones
          ElevatedButton(
            onPressed: () {
              // Acción cuando se presiona el primer botón
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Borde ovalado
                ),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.directions_walk, color: Colors.black),
                Text(
                  "Solicitar Paseo ahora",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0), // Espacio entre los botones
          ElevatedButton(
            onPressed: () {
              // Acción cuando se presiona el segundo botón
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Borde ovalado
                ),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.calendar_today, color: Colors.black),
                Text(
                  "Hacer una reservación",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
