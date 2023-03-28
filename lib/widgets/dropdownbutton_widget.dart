import 'package:flutter/material.dart';

const List<String> list = <String>['1', '2', 'Three', 'Four'];

class WDropDownButton extends StatefulWidget {
  const WDropDownButton({Key? key}) : super(key: key);

  @override
  State<WDropDownButton> createState() => _WDropDownButtonState();
}

class _WDropDownButtonState extends State<WDropDownButton> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple,),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          alignment: Alignment.topLeft,
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
