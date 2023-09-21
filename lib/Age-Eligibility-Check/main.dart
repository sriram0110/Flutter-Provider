import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Age-Eligibility-Check/age_eligibility.dart';
import 'package:provider_state_management/Age-Eligibility-Check/age_provider.dart';

void main()
{
  runApp(ChangeNotifierProvider(
    create: (context) => AgeProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeEligibility(),
    );
  }
}