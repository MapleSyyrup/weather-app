import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final String title;
  final String locationType;
  final int woeid;
  final String lattLong;

  LocationModel({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  @override
  List<Object> get props => [
        title,
        locationType,
        woeid,
        lattLong,
      ];

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      title: json['title'],
      locationType: json['location_type'],
      woeid: json['woeid'],
      lattLong: json['latt_long'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['location_type'] = this.locationType;
    data['woeid'] = this.woeid;
    data['latt_long'] = this.lattLong;
    return data;
  }
}
