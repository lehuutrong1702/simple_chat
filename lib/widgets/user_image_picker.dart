import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() {
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
  
   File? _selectedImage ;
  
  _uploadImage() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 50);

      if(pickedImage == null) {
        return ;
      }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
        ),
        TextButton.icon(
          onPressed: _uploadImage,
          icon: const Icon(Icons.image),
          label: Text(
            "Add Image",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        )
      ],
    );
  }
}
