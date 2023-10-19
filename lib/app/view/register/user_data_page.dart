import 'package:flutter/material.dart';
import 'package:wau_walk/app/view/register/upload_photo.dart';

class UserDataPage extends StatefulWidget {
  @override
  _UserDataPageState createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  bool isKeyboardOpen = false;

  @override
  void initState() {
    super.initState();
    // Escuchar los cambios en la visibilidad del teclado
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      MediaQueryData data = MediaQuery.of(context);
      setState(() {
        isKeyboardOpen = data.viewInsets.bottom > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !isKeyboardOpen,
                child: Row(
                  children: [
                    const Text(
                      'Wau walk',
                      style: TextStyle(fontSize: 50),
                    ),
                    const SizedBox(width: 50.0),
                    Image.asset('assets/logo_sm_wauwalk.png', height: 40.0),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Visibility(
                visible: !isKeyboardOpen,
                child: const Text(
                  'Conozcámonos un poco',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Visibility(
                visible: !isKeyboardOpen,
                child: const SizedBox(height: 8.0),
              ),
              const Text('Ingresa algunos de tus datos personales'),
              const SizedBox(height: 20.0), // Añadido espacio entre textos e inputs
              Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Apellido',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: idController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Cédula de ciudadanía (solo números)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      labelText: 'Ciudad de residencia',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != 'Bucaramanga' &&
                          value != 'Bogotá' &&
                          value != 'Medellín') {
                        return 'Ciudad no válida';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: birthDateController,
                    decoration: const InputDecoration(
                      labelText: 'Fecha de nacimiento',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: const OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFE7ECEF),
                      side: const BorderSide(color: Color(0xFF011638)),
                    ),
                    onPressed: () {
                      // Acción al hacer clic en "Siguiente paso"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UploadPhotoPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Siguiente paso'),
                    ),
                  ),
                ],
              ),
              // Barra de desplazamiento
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 24.0),
                child: Container(
                  width: 4.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
