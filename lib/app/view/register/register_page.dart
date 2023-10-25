import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wau_walk/app/view/register/take_photo_user_page.dart';

class RegisterPage extends StatelessWidget {
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
                        'Registro usuario',
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
              'Conozcámonos un poco',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 8.0),
            const Text('Danos un perfil con el que te podamos reconocer'),
            const SizedBox(height: 80.0), // Aumentado el margen inferior del texto
            const Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/foto_muestra.jpg'),
              ),
            ),
            const SizedBox(height: 80.0), // Añadido margen inferior de la imagen
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF011638),
              child: const Row(
                children: [
                  Icon(Icons.warning, color: Colors.white),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      'Toma la foto como se muestra en el ejemplo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE7ECEF),
                    side: BorderSide(color: Color(0xFF011638)),
                  ),
                  onPressed: () async {
                    // Tomar foto con la cámara
                    final XFile? photo = await takePhotoWithCamera();
                    if (photo != null) {
                      // Navegar a la página TakePhotoUserPage con la foto tomada
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TakePhotoUserPage(photo: photo)),
                      );
                    }
                  },


                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined, size: 24.0),
                      SizedBox(width: 8.0),
                      Text('Tomar foto'),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFE7ECEF),
                    side: const BorderSide(color: Color(0xFF011638)),
                  ),
                  onPressed: () async {
                    // Elegir foto de la galería
                    final XFile? photo = await pickImageFromGallery();
                    if (photo != null) {
                      // Navegar a la página TakePhotoUserPage con la foto elegida
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TakePhotoUserPage(photo: photo)),
                      );
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 24.0),
                      SizedBox(width: 8.0),
                      Text('Elegir foto'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Función para tomar una foto con la cámara
  Future<XFile?> takePhotoWithCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    return photo;
  }

  // Función para elegir una foto de la galería
  Future<XFile?> pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    return photo;
  }
}
