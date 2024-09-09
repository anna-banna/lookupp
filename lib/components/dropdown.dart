import 'package:flutter/material.dart';

/// This class is a StatefulWidget that builds a dropdown menu for the user to select their role.
/// The dropdown menu is populated with the roles list.
/// The initial selection is the first item in the roles list.

// Roles list for user to select during sign up
// Used in RoleDropdownMenu class to build the dropdown menu
final List<String> roles = <String>[
  'Student',
  'Teacher',
  'Parent',
  'College Professor',
  'Local Business'
];

class RoleDropdownMenu extends StatefulWidget {
  const RoleDropdownMenu({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<RoleDropdownMenu> createState() => _RoleDropdownMenuState();
}

class _RoleDropdownMenuState extends State<RoleDropdownMenu> {
  String dropdownValue = roles.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      // This is the value that is displayed on the dropdown button.
      controller: widget.controller,
      hintText: 'Role',
      expandedInsets: const EdgeInsets.symmetric(horizontal: 25),
      initialSelection: roles.first,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.blueGrey[50]!),
      ),
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: roles.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
