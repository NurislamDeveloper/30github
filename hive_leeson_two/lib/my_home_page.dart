import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var box = Hive.box('MyBoxs');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  // Function for adding or updating data
  void addOrUpdate({String? key}) {
    if (key != null) {
      final person = box.get(key);
      if (person != null) {
        _nameController.text = person['name'] ?? '';
        _ageController.text = person['age']?.toString() ?? '';
      }
    } else {
      _nameController.clear();
      _ageController.clear();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            right: 15,
            left: 15,
            top: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter your age',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text.trim();
                  final ageText = _ageController.text.trim();

                  // Validate the inputs
                  if (name.isEmpty || ageText.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter your name and age"),
                      ),
                    );
                    return;
                  }

                  final age = int.tryParse(ageText);
                  if (age == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Age must be a valid number"),
                      ),
                    );
                    return;
                  }

                  if (key == null) {
                    final newKey = DateTime.now().millisecondsSinceEpoch.toString();
                    box.put(
                      newKey,
                      {'name': name, 'age': age}, // Corrected to store actual values
                    );
                  } else {
                    box.put(
                      key,
                      {'name': name, 'age': age}, // Corrected to store actual values
                    );
                  }
                  Navigator.pop(context);
                },
                child: Text(key == null ? 'Add' : 'Update'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  // Function to delete an item
  void delete(String key) {
    box.delete(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text("Hive"),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, boxs, widget) {
          if (boxs.isEmpty) {
            return const Center(
              child: Text(
                'No items added yet',
              ),
            );
          }
          return ListView.builder(
            itemCount: boxs.length,
            itemBuilder: (context, index) {
              final key = boxs.keyAt(index).toString();
              final items = boxs.get(key);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.white,
                  elevation: 2,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        items?['name'] ?? 'No name',
                      ),
                      subtitle: Text(
                        "Age: ${items?['age'] ?? 'No age'}",
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => addOrUpdate(key: key),
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () => delete(key),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () => addOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
