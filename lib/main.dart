import 'package:flutter/material.dart';

import 'package:hack_hpi/camera_view.dart';
import 'package:hack_hpi/confirmation_view.dart';

import 'package:go_router/go_router.dart';
import 'package:hack_hpi/trash_bag_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: goRouter,
    );
  }
}

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CameraView(),
    ),
    GoRoute(
      path: '/trash_bag',
      builder: (context, state) => const TrashBagView(),
    ),
    GoRoute(
      path: '/confirmation',
      builder: (context, state) => const ConfirmationView(),
    ),
  ],
);