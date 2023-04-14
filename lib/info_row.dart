import 'package:flutter/material.dart';

enum InfoRowType {
  dropdown,
  checkbox,
  widget,
}

class InfoRow extends StatefulWidget {
  final String label;
  final InfoRowType infoRowType;
  final List<dynamic> values;
  final Widget? child;

  const InfoRow({
    super.key,
    required this.label,
    required this.infoRowType,
    required this.values,
    this.child,
  });

  @override
  State<InfoRow> createState() => _InfoRowState();
}

class _InfoRowState extends State<InfoRow> {
  late dynamic selectedValue;

  @override
  void initState() {
    super.initState();

    if (widget.values.isEmpty) {
      widget.values.add(false);
    }

    selectedValue = widget.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (widget.infoRowType == InfoRowType.dropdown)
            DropdownButton(
              value: selectedValue,
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
          if (widget.infoRowType == InfoRowType.checkbox)
            Checkbox(
              value: selectedValue,
              onChanged: (bool? newValue) {
                if (newValue == null) return;

                setState(() {
                  selectedValue = newValue;
                });
              },
            ),
          if (widget.infoRowType == InfoRowType.widget) widget.child!,
        ],
      ),
    );
  }
}
