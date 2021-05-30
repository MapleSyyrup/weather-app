import 'package:equatable/equatable.dart';

/// data model for location
class LocationModel extends Equatable {
  final String city; // city name
  final String locationType; //locationType is always City
  final int woeid; //where on earth ID
  final String lattLong; // geographic coordinates in map

  LocationModel({
    this.city,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  @override
  List<Object> get props => [
        city,
        locationType,
        woeid,
        lattLong,
      ];

/// factory constructor for creating a new User instance from a map. 
/// returns the locationModel from json
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      city: json['title'],
      locationType: json['location_type'],
      woeid: json['woeid'],
      lattLong: json['latt_long'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.city;
    data['location_type'] = this.locationType;
    data['woeid'] = this.woeid;
    data['latt_long'] = this.lattLong;
    return data;
  }
}
