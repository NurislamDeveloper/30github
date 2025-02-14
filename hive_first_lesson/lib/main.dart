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
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final workController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Mapp'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.network(
              'https://blog.codemagic.io/uploads/covers/codemagic-blog-header-flutter-2.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.image_not_supported, size: 50),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your name')),
                    const SizedBox(height: 10),
                    TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your age')),
                    const SizedBox(height: 10),
                    
                    TextButton(
                      onPressed: () {
                        setState(() {
                          try {
                            int? age = int.tryParse(ageController.text);
                            int? phoneNumber = int.tryParse(phoneController.text);

                            if (age == null || phoneNumber == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please enter a valid age and phone number')),
                              );
                              return;
                            }

                            boxPersons.add(Person(
                              name: nameController.text,
                              age: age,
                          
                            ));

                            // Clear the text fields after submission
                            nameController.clear();
                            ageController.clear();
                           
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: ${e.toString()}')),
                            );
                          }
                        });
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: boxPersons.length,
                    itemBuilder: (context, index) {
                      Person person = boxPersons.getAt(index);
                      return ListTile(
                        leading: IconButton(
                          onPressed: () {
                            setState(() {
                              boxPersons.deleteAt(index);
                            });
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        title: Text(person.name),
                        subtitle: const Text('Name'),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Age: ${person.age}'),
                          
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}