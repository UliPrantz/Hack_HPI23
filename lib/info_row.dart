import 'package:flutter/material.dart';

class InfoRow extends StatefulWidget {
  final String label;
  final bool dropdownMenu;
  final List<dynamic> values;

  const InfoRow({
    super.key,
    required this.label,
    required this.dropdownMenu,
    required this.values,
  });

  @override
  State<InfoRow> createState() => _InfoRowState();
}

class _InfoRowState extends State<InfoRow> {
  late dynamic selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.values.first;
  }
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label),

        if (widget.dropdownMenu)
          DropdownButton(
            value: widget.values[0],
            items: widget.values
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (dynamic newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
          ),

        if (!widget.dropdownMenu)
          Checkbox(
            value: widget.values[0],
            onChanged: (bool? newValue) {
              if (newValue == null) return;

              setState(() {
                selectedValue = newValue;
              });
            },
          ),
      ],
    );
  }
}
