// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:hive_packa_intro/setvices/have_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final HiveService _hiveService = HiveService();
  String? savedName;

  @override
  void initState() {
    super.initState();
    savedName = _hiveService.getUser()?.name;
  }

  void _saveName() {
    _hiveService.saveUser(_controller.text);
    setState(() {
      savedName = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hive Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveName,
              child: const Text('Save Name'),
            ),
            const SizedBox(height: 20),
            Text(savedName != null ? 'Saved Name: $savedName' : 'No name saved'),
          ],
        ),
      ),
    );
  }
}
