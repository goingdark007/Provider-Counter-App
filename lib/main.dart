import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}


