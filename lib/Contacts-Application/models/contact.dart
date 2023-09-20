class Contact {
  String name;
  String phoneNumber;
  bool isFavoriteContact;

  Contact(
      {required this.name,
      required this.phoneNumber,
      this.isFavoriteContact = false});

}
