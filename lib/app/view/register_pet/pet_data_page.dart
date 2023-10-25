import 'package:flutter/material.dart';

class PetDataPage extends StatefulWidget {
  @override
  _PetDataPageState createState() => _PetDataPageState();
}

class _PetDataPageState extends State<PetDataPage> {
  String petName = '';
  int petAge = 0;
  String petTemperament = '';
  double petWeight = 0.0;
  List<String> selectedItems = [];
  bool isKeyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro usuario',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navegar de regreso a WelcomePage al hacer clic en la flecha
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !isKeyboardOpen,
                child: Row(
                  children: [
                    Text(
                      'Wau walk',
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(width: 50.0),
                    Image.asset('assets/logo_sm_wauwalk.png', height: 40.0),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Visibility(
                visible: !isKeyboardOpen,
                child: Text(
                  'Conozcámonos un poco',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Visibility(
                visible: !isKeyboardOpen,
                child: SizedBox(height: 8.0),
              ),
              Text('Ingresa algunos de tus datos personales'),
              SizedBox(height: 20.0),
              Column(
                children: [
                  // Agregar campos de entrada y botón
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nombre de la mascota'),
                    onChanged: (value) {
                      setState(() {
                        petName = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Edad de la mascota'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        petAge = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  DropdownButton<String>(
                    value: petTemperament.isNotEmpty ? petTemperament : null,
                    items: ['Normal', 'Cariñoso', 'Agresivo']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        petTemperament = value!;
                      });
                    },
                    hint: Text('Selecciona el temperamento de tu mascota'),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Peso corporal'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        petWeight = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selecciona los elementos que debe usar al salir de la casa'),
                      CheckboxListTile(
                        title: Text('Bozal'),
                        value: selectedItems.contains('Bozal'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedItems.add('Bozal');
                            } else {
                              selectedItems.remove('Bozal');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Chaleco'),
                        value: selectedItems.contains('Chaleco'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedItems.add('Chaleco');
                            } else {
                              selectedItems.remove('Chaleco');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Correa'),
                        value: selectedItems.contains('Correa'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedItems.add('Correa');
                            } else {
                              selectedItems.remove('Correa');
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Puedes acceder a las variables y la lista seleccionada aquí.
                        print('Nombre: $petName');
                        print('Edad: $petAge');
                        print('Temperamento: $petTemperament');
                        print('Peso: $petWeight');
                        print('Elementos seleccionados: $selectedItems');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check),
                          SizedBox(width: 8.0),
                          Text('Finalizar'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
