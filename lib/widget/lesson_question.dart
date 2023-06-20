import 'package:flutter/material.dart';

class LessonQuestion extends StatefulWidget {
  const LessonQuestion({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LessonQuestionState createState() => _LessonQuestionState();
}

class _LessonQuestionState extends State<LessonQuestion> {
  List<String> answerOptions = ['Type name', 'var name', 'name', 'let'];
  List<String> selectedOptions = [];

  void selectOption(String option) {
    setState(() {
      selectedOptions.add(option);
    });
  }

  void removeOption(String option) {
    setState(() {
      selectedOptions.remove(option);
    });
  }

  void checkAnswer() {
    // Logique pour vérifier la réponse de l'utilisateur
    List<String> correctAnswer = ['Type name', 'var name'];

    if (selectedOptions.length == correctAnswer.length &&
        selectedOptions[0] == correctAnswer[0]) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Bonne réponse !'),
          content: Text('Félicitations, vous avez trouvé la réponse !'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Action supplémentaire à effectuer après une bonne réponse
              },
              child: const Text('Continuer'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Mauvaise réponse'),
          content: const Text('Essayez à nouveau !'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Question :',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Quelle est la bonne manière de déclarer une variable en Dart',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedOptions.length,
                itemBuilder: (context, index) {
                  final option = selectedOptions[index];
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: answerOptions.map((option) {
                bool isSelected = selectedOptions.contains(option);
                return GestureDetector(
                  onTap: () {
                    if (isSelected) {
                      removeOption(option);
                    } else {
                      selectOption(option);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.grey : Colors.blue,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: isSelected ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                checkAnswer();
              },
              child: Text('Vérifier'),
            ),
          ],
        ),
      ),
    );
  }
}
