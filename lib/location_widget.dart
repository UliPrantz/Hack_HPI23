import 'package:flutter/material.dart';
import 'package:hack_hpi/util.dart';

enum WidgetState {
  init,
  loading,
  finished,
}

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  WidgetState state = WidgetState.init;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case WidgetState.init:
        return ElevatedButton(
          onPressed: buttonPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7.5,
              vertical: 5.0,
            ),
            child: const Text(
              'Get Location',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        );

      case WidgetState.loading:
        return Container(
          padding: EdgeInsets.all(5.0),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(orange),
          ),
        );

      case WidgetState.finished:
        return Text(
          'HPI Building L',
          style: TextStyle(color: Colors.grey),
        );
    }
  }

  Future<void> buttonPressed() async {
    setState(() {
      state = WidgetState.loading;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      state = WidgetState.finished;
    });
  }
}
