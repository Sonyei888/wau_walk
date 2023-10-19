import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:wau_walk/app/model/image_provider_model.dart';
import 'package:wau_walk/app/view/register/user_data_page.dart';

class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({Key? key}) : super(key: key);

  @override
  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  final ImageProviderModel _imageProvider = ImageProviderModel();

  Future<void> _pickImage() async {
    // Método para elegir una imagen de la galería
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Si se selecciona una imagen, se establece la ruta en el provider
      _imageProvider.setImagePath(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _imageProvider,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Espacio entre la parte superior y los elementos
              const SizedBox(height: 30.0),
              _buildHeader(),
              const SizedBox(height: 16.0),
              _buildImageSection(),
              const SizedBox(height: 60.0),
              _buildWarningSection(),
              const SizedBox(height: 40.0),
              _buildButtonSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Sección del encabezado
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context); // Navegar de regreso
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
    );
  }

  // Sección de la imagen y botones relacionados
  Widget _buildImageSection() {
    return Column(
      children: [
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
          'Este será el perfil que usarás',
          style: TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 8.0),
        const Text('Puedes cambiarlo en cualquier momento que desees'),
        const SizedBox(height: 80.0),
        Center(
          child: Consumer<ImageProviderModel>(
            builder: (context, imageProvider, child) {
              return CircleAvatar(
                radius: 100.0,
                backgroundImage: imageProvider.imagePath != null
                    ? FileImage(File(imageProvider.imagePath!))
                    : const AssetImage('assets/foto_muestra.jpg') as ImageProvider,
              );
            },
          ),
        ),
      ],
    );
  }

  // Sección de advertencia
  Widget _buildWarningSection() {
    return Container(
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
    );
  }

  // Sección de botones
  Widget _buildButtonSection() {
    return Column(
      children: [
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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFE7ECEF),
            side: const BorderSide(color: Color(0xFF011638)),
          ),
          onPressed: () {
            // Acción al hacer clic en "continuar"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserDataPage()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.keyboard_arrow_right_outlined, size: 24.0),
              SizedBox(width: 8.0),
              Text('Continuar'),
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(home: UploadPhotoPage()));
}
