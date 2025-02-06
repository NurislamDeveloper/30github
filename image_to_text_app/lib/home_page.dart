import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_to_text_app/claude_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables and stuff...
  File? _image;
  String? _description;
  bool _isLoading = false;
  final _picker = ImagePicker();

  // pick image method
  Future<void> _pickImage(ImageSource source) async {
    //pick an image from gallery or camera

    try {
      final pickFile = await _picker.pickImage(
        source: source,
        maxHeight: 1080,
        maxWidth: 1920,
        imageQuality: 85,
      );
      // if the image has been chose -> start analysis
      if (pickFile != null) {
        setState(() {
          _image = File(pickFile.path);
        });
        await _analyzeImage();
      }
    }
    //error
    catch (e) {
      print(e);
    }
  }

  //analyze the image
  Future<void> _analyzeImage() async {
    if (_image == null) return;

    // no image chosen to analyze...
    // loading
    setState(() {
      _isLoading = true;
    });
    // start the analysis of image
    try {
      final descriptions = await ClaudeService().analyzeImage(_image!);
      setState(() {
        _description = descriptions;
        _isLoading = false;
      });
    }
    //error
    catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AI VISION APP ",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.grey[200],
            child: _image != null
                ? Image.file(_image!)
                : const Center(
                    child: Text('choose image'),
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: const Text('Take Photo'),
              ),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: const Text('Pick from the gallery'),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          if (_isLoading) const Center(child: CircularProgressIndicator())
          else if (_description != null)
            Text(
              _description!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('some')
        ],
      ),
    );
  }
}