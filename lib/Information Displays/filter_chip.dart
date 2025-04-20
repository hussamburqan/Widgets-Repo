import 'package:flutter/material.dart';

class FilterChipDemo extends StatefulWidget {
  const FilterChipDemo({super.key});

  @override
  State<FilterChipDemo> createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<FilterChipDemo> {
  List<String> choices = ['Choice 1', 'Choice 2', 'Choice 3', 'Choice 4'];
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FilterChip Demo')),
      body: Center(
        child: Wrap(
          spacing: 10,
          children: [
            for (int index = 0; index < choices.length; index++)
              FilterChip(
                label: Text(choices[index]),
                selected: selectedFilters.contains(choices[index]),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedFilters.add(choices[index]);
                    } else {
                      selectedFilters.remove(choices[index]);
                    }
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
