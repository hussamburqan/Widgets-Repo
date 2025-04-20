import 'package:flutter/material.dart';

// I take it from Notion

class ChipDemo extends StatefulWidget {
  const ChipDemo({super.key});

  @override
  State<ChipDemo> createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> choices = ['Choice 1', 'Choice 2', 'Choice 3', 'Choice 4'];
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
              Chip(
                label: Text(choices[index]),
                onDeleted: () {
                  setState(() => choices.removeAt(index));
                },
              ),
          ],
        ),
      ),
    );
  }
}