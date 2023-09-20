import 'package:flutter/material.dart';
import 'package:provider_state_management/Contacts-Application/models/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contactsList = [];
  SharedPreferences? preferences;

  // ContactProvider() {
  //   _loadContacts;
  // }

  List<Contact> get contacts => contactsList;

  Future<void> loadContacts() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? contactsData = preferences?.getStringList('contacts');
    print('Contact Data $contactsData');
    if (contactsData != null) {
      contactsList = contactsData.map((contact) {
        List<String> contactData = contact.split(',');
        return Contact(
            name: contactData[0],
            phoneNumber: contactData[1],
            isFavoriteContact: contactData[2] == 'true');
      }).toList();
      notifyListeners();
    }
  }

  Future<void> saveContacts() async {
    List<String> contactsData = contactsList
        .map((contact) =>
            "${contact.name},${contact.phoneNumber},${contact.isFavoriteContact}")
        .toList();
        print('Saving Contacts Data: $contactsData');
        await preferences?.setStringList('contacts', contactsData);
  }

  void addContact(Contact contact) {
    contactsList.add(contact);
    saveContacts();
    notifyListeners();
  }

    Future<void> deleteContact(int index) async {
    contactsList.removeAt(index);
    await saveContacts();
    notifyListeners();
  }

    void toggleFavorite(int index) {
    contactsList[index].isFavoriteContact = !contactsList[index].isFavoriteContact;
    saveContacts();
    notifyListeners();
  }
}

