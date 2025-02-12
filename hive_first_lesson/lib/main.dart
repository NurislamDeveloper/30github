import 'package:flutter/material.dart';
import 'package:hive_first_lesson/boxes.dart';
import 'package:hive_first_lesson/person.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  boxPersons = await Hive.openBox<Person>('personBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLutter Mapp'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width, // Full screen width
            height: MediaQuery.of(context).size.height *
                0.9, // 50% of screen height
            // height: MediaQuery.of(context).size.height, // Full screen height
            child: Image.network(
              'https://pbs.twimg.com/media/F8ouzVyX0AAdEBd.jpg:large',
              fit: BoxFit.cover, // Ensures the image covers the whole screen
            ),
          ),
        ],
      ),
    );
  }
}
