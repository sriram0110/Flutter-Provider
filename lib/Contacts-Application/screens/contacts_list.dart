import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Contacts-Application/providers/contact_provider.dart';
import 'package:provider_state_management/Contacts-Application/screens/add_new_contacts.dart';

import '../models/contact.dart';

class ContactsListScreen extends StatefulWidget {
  const ContactsListScreen({super.key});

  @override
  State<ContactsListScreen> createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ContactProvider>().loadContacts();
  }
  @override
  Widget build(BuildContext context) {
    final contacts = context.watch<ContactProvider>().contacts;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: Text(
          'Contacts',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.star, color: Theme.of(context).colorScheme.onPrimary ,))
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          Contact contact = contacts[index];
          return Dismissible(
            key: Key(contact.name),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                print('Calling...');
              }
            },
            background: Container(
              alignment: Alignment.centerLeft,
              color: const Color.fromARGB(255, 95, 124, 62),
              child: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
            child: ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.phoneNumber),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<ContactProvider>().toggleFavorite(index);
                    },
                    icon: Icon(contact.isFavoriteContact
                        ? Icons.star
                        : Icons.star_border),
                    color: const Color.fromARGB(255, 144, 36, 36),
                  ),
                ],
              ),
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Delete Contact'),
                      content: Text(
                          'Are you sure you want to delete ${contact.name} contact?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            context
                                .read<ContactProvider>()
                                .deleteContact(index);
                            Navigator.pop(context);
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewContactsScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
