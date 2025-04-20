import 'package:flutter/material.dart';

// I take it from Notion

class ChoiceChipDemo extends StatefulWidget {
  const ChoiceChipDemo({super.key});

  @override
  State<ChoiceChipDemo> createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChoiceChipDemo> {
  List<String> choices = ['Choice 1', 'Choice 2', 'Choice 3', 'Choice 4'];
  int? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chip Demo')),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            for (int index = 0; index < choices.length; index++)
              ChoiceChip(
                label: Text(choices[index]),
                selected: value == index,
                onSelected: (selected) {
                  setState(() {
                    value = selected ? index : null;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
