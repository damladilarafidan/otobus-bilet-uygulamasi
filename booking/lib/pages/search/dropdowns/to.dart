import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class To extends StatefulWidget {
  const To({super.key});
  
  @override
  State<To> createState() => _ToState();
}

class _ToState extends State<To> {
  final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
String? selectedValue;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: Theme
                      .of(context)
                      .hintColor,
            ),
          ),
          items: items
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                  .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
        ),
      ),
    ),
  );
}
}