import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DragAndDropSentence(),
    debugShowCheckedModeBanner: false,
  ));
}

class DragAndDropSentence extends StatefulWidget {
  @override
  _DragAndDropSentenceState createState() => _DragAndDropSentenceState();
}

class _DragAndDropSentenceState extends State<DragAndDropSentence> {
  List<String> words = ["is", "a", "Flutter", "great", "framework"];
  List<String?> answer = List.filled(5, null); // Initialize with nulls
  List<String> shuffledWords = [];
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    shuffledWords = List.from(words)..shuffle();
  }

  bool checkAnswer() {
    return answer.join(" ") == words.join(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Drag and Drop Sentence"),
      ),
      body: Center( // Center the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: List.generate(answer.length, (index) {
                return DragTarget<String>(
                  onAccept: (value) {
                    setState(() {
                      answer[index] = value;
                      shuffledWords.remove(value);
                      isCorrect = checkAnswer(); // Check after every drop
                    });
                  },
                  onWillAccept: (value) {
                    return answer[index] == null; // Only accept if slot is empty
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: candidateData.isNotEmpty
                                ? Colors.green // Highlight if draggable is over
                                : Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: answer[index] != null
                          ? Text(answer[index]!,
                              style: const TextStyle(fontSize: 18))
                          : const Text("____",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 30),
            Wrap(
              children: shuffledWords.map((word) {
                return Draggable<String>(
                  data: word,
                  child: WordBox(word),
                  feedback: WordBox(word, isDragging: true),
                  childWhenDragging: WordBox(""),
                );
              }).toList(),
            ),
            const SizedBox(height: 20), // Space before the button
            ElevatedButton(
              onPressed: answer.contains(null) // Disable if not all slots are filled
                  ? null
                  : () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Result"),
                            content: Text(isCorrect ? "InCorrect!" : "Correct."),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
              child: const Text("Check"),
            ),
          ],
        ),
      ),
    );
  }
}

class WordBox extends StatelessWidget {
  final String word;
  final bool isDragging;

  WordBox(this.word, {this.isDragging = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: isDragging ? Colors.grey : Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        word,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}