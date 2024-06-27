import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  void _takePicture() {
    // How can we take image 
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // container will align the child in center
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.black87),
        ),
        height: 250,
        width: double.infinity,
        child: TextButton.icon(
          icon: const Icon(Icons.camera),
          onPressed: () {},
          label: const Text('Take Picture'),
        ));
  }
}
