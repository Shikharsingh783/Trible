import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyDropPage extends StatefulWidget {
  final String? community;
  final String? creator;
  const MyDropPage({Key? key, this.community, this.creator}) : super(key: key);

  @override
  State<MyDropPage> createState() => _MyDropPageState();
}

class _MyDropPageState extends State<MyDropPage> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    final random = Random();
    return items.map((String item) {
      final color = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
      return DropdownMenuItem<String>(
        value: item,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: color,
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                "     ",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 30,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "School Community",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Text(
                  "@randomschool123",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ],
        ),
        items: _buildDropdownItems(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 80,
          width: 430,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: Colors.black,
            ),
            color: Theme.of(context).colorScheme.background,
          ),
          elevation: 0,
        ),
        iconStyleData: IconStyleData(
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.more_horiz,
              color: Theme.of(context).colorScheme.secondary,
              size: 25,
            ),
          ),
          iconSize: 14,
          iconEnabledColor: Theme.of(context).colorScheme.secondary,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 430,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(20),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 15),
        ),
      ),
    );
  }
}
