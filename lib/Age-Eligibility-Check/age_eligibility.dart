import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Age-Eligibility-Check/age_provider.dart';

class AgeEligibility extends StatefulWidget {
  const AgeEligibility({super.key});

  @override
  State<AgeEligibility> createState() => _AgeEligibilityState();
}

class _AgeEligibilityState extends State<AgeEligibility> {
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final providerAge = Provider.of<AgeProvider>(context, listen: false);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Eligibility Check'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<AgeProvider>(
              builder: (context, value, child) => CircleAvatar(
                backgroundColor: value.color,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: ageController,
              style: const TextStyle(fontSize: 14.0),
              // onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Enter your age',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () {
                  final age = int.parse(ageController.text);
                  providerAge.isEligible(age);
                },
                child: const Text(
                  'Check',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
