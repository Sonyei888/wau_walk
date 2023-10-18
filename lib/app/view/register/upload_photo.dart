import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoPage extends StatelessWidget {
  const UploadPhotoPage({Key? key}) : super(key: key);

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Aquí puedes realizar acciones con la imagen seleccionada, como subirla a un servidor o mostrarla en la pantalla.
    }
  }

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
                        'Subir foto',
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
              'Este será el perfil que usaras',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 8.0),
            const Text('Puedes cambiarlo en cualquier momento que desees'),
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
            const SizedBox(height: 80.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE7ECEF),
                side: BorderSide(color: Color(0xFF011638)),
              ),
              onPressed: _pickImage,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined, size: 24.0),
                  SizedBox(width: 8.0),
                  Text('Elegir Foto'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: UploadPhotoPage()));
}
