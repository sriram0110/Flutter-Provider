import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contact.dart';
import '../providers/contact_provider.dart';

class AddNewContactsScreen extends StatelessWidget {
  AddNewContactsScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final saveContact = Provider.of<ContactProvider>(context, listen: false);
    return  Scaffold(
      appBar: AppBar(
        
        title:  Text('Add Contact', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary ),),
        backgroundColor: Theme.of(context).colorScheme.secondary, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 8.0,),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, value, child) => ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String phoneNumber = phoneController.text;
                  if (name.isNotEmpty && phoneNumber.isNotEmpty) {
                    saveContact.addContact(
                          Contact(
                            name: name,
                            phoneNumber: phoneNumber,
                            isFavoriteContact: false,
                          ),
                        );
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Contact', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.primary),), 
              ),
            ),
          ],
        ),
      ),
    );
  } 
}
