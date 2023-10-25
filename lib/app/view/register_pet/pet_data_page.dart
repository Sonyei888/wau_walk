import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetDataPage extends StatelessWidget {
  String petName = '';
  int petAge = 0;
  String petTemperament = '';
  double petWeight = 0.0;
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // Navegar de regreso a WelcomePage al hacer clic en la flecha
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.black),
                      SizedBox(width: 16.0),
                      Text(
                        'Registro Mascota',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                const Text(
                  'Wau walk',
                  style: TextStyle(fontSize: 50),
                ),
                const SizedBox(width: 50.0),
                Image.asset('assets/logo_sm_wauwalk.png', height: 40.0),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Cuentanos sobre tu mascota',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 8.0),
            const Text('Lea y llena el formulario de acuerdo a la informacíon de la mascota'),
            const SizedBox(height: 20.0),  // Añadido espacio entre el texto y los campos

            // Agregar campos de entrada y botón
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre de la mascota'),
              onChanged: (value) {
                petName = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Edad de la mascota'),
              keyboardType: TextInputType.number, // Asegura que se ingresen números enteros.
              onChanged: (value) {
                petAge = int.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              items: ['Normal', 'Cariñoso', 'Agresivo']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                petTemperament = value!;
              },
              hint: Text('Selecciona el temperamento de tu mascota'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Peso corporal'),
              keyboardType: TextInputType.number, // Asegura que se ingresen números.
              onChanged: (value) {
                petWeight = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('Bozal'),
              value: selectedItems.contains('Bozal'),
              onChanged: (value) {
                if (value!) {
                  selectedItems.add('Bozal');
                } else {
                  selectedItems.remove('Bozal');
                }
              },
            ),
            CheckboxListTile(
              title: Text('Chaleco'),
              value: selectedItems.contains('Chaleco'),
              onChanged: (value) {
                if (value!) {
                  selectedItems.add('Chaleco');
                } else {
                  selectedItems.remove('Chaleco');
                }
              },
            ),
            CheckboxListTile(
              title: Text('Correa'),
              value: selectedItems.contains('Correa'),
              onChanged: (value) {
                if (value!) {
                  selectedItems.add('Correa');
                } else {
                  selectedItems.remove('Correa');
                }
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Puedes acceder a las variables petName, petAge, petTemperament, petWeight y selectedItems aquí.
              },
              child: const Row(
                children: [
                  Icon(Icons.check), // Puedes cambiar el icono a tu elección.
                  SizedBox(width: 8.0),
                  Text('Finalizar'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
