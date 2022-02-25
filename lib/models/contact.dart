class Contact {
  late String name;
  late int accountNumber;

  Contact({required this.name, required this.accountNumber});

  Contact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accountNumber = json['accountNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['accountNumber'] = this.accountNumber;
    return data;
  }
}
