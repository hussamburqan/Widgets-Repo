import 'package:flutter/material.dart';

class InputChipDemo extends StatefulWidget {
  const InputChipDemo({super.key});

  @override
  State<InputChipDemo> createState() => _InputChipDemoState();
}

class _InputChipDemoState extends State<InputChipDemo> {
  List<String> choices = ['Choice 1', 'Choice 2', 'Choice 3', 'Choice 4'];
  String? selectedUser;
  final TextEditingController _controller = TextEditingController();

  void _addChoice() {
    final text = _controller.text.trim();
    if (text.isNotEmpty && !choices.contains(text)) {
      setState(() {
        choices.add(text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Chip')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              children: [
                for (int i = 0; i < choices.length; i++)
                  InputChip(
                    avatar: CircleAvatar(
                      child: Text(choices[i][0]),
                    ),
                    label: Text(choices[i]),
                    selected: selectedUser == choices[i],
                    onSelected: (selected) {
                      setState(() {
                        selectedUser = selected ? choices[i] : null;
                      });
                    },
                    onDeleted: () {
                      setState(() {
                        if (selectedUser == choices[i]) {
                          selectedUser = null;
                        }
                        choices.removeAt(i);
                      });
                    },
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter new choice',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addChoice,
                  child: Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
