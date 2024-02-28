class EventModel {
  String? name;
  String? phone;
  String? eventType;
  String? place;
  String? image;

  EventModel(
      {this.name, this.eventType, this.phone, this.place, required this.image});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      image: json['image'],
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      place: json['place'] as String?,
      eventType: json['eventtype'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'phone': phone,
      'place': place,
      'eventtype': eventType
    };
  }
}
