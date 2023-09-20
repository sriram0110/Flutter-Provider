import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Contacts-Application/providers/contact_provider.dart';
import 'package:provider_state_management/Contacts-Application/screens/contacts_list.dart';

final themeApp = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 222, 211, 200),
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 53, 104, 96),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: const MyContacts(),
    ),
  );
}

class MyContacts extends StatelessWidget {
  const MyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ContactsListScreen(),
      theme: themeApp,
    );
  }
}
