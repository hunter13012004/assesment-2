class Datamodel {
  int? rs;
  int? gift;
  Datamodel({required this.gift, required this.rs});

  Datamodel.fromJson(Map<String, dynamic> map) {
    rs = map['rs'];
    gift = map['gift'];
  }
}
