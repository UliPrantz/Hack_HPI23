import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class TrashBagView extends StatefulWidget {
  const TrashBagView({super.key});

  @override
  State<TrashBagView> createState() => _TrashBagViewState();
}

class _TrashBagViewState extends State<TrashBagView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.list_rounded),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Throw the trash",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Placeholder(
              fallbackHeight: 400.0,
              fallbackWidth: 400.0,
            ),
            // child: Image.asset(
            //   'assets/trash_bag.gif',
            //   width: 200.0,
            //   height: 200.0,
            //   fit: BoxFit.contain,
            // ),
            ElevatedButton(
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
                  'Let\'s play',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> buttonPressed(BuildContext context) async {
    context.push(Uri(path: '/').toString());
  }
}
