import 'package:flutter/material.dart';

import 'package:hack_hpi/info_row.dart';

import 'package:go_router/go_router.dart';
import 'package:hack_hpi/location_widget.dart';
class ConfirmationView extends StatefulWidget {
  const ConfirmationView({super.key});

  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(
            label: 'Category',
            infoRowType: InfoRowType.dropdown,
            values: ['Plastic', 'Paper', 'Bio', 'Glass', 'Metal'],
          ),
          InfoRow(
            label: 'Location',
            infoRowType: InfoRowType.widget,
            values: [],
            child: LocationWidget(),
          ),
          InfoRow(
            label: 'Cleaned it up yourself: ',
            infoRowType: InfoRowType.checkbox,
            values: [false],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Preview:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/garbage.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 40.0,
            ),
            child: ElevatedButton(
              onPressed: () => buttonPressed(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0,
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> buttonPressed(BuildContext context) async {
    context.push(Uri(path: '/trash_bag').toString());
  }
}

