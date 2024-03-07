import 'dart:convert';

BeaconsModel beaconsModelFromJson(String str) =>
    BeaconsModel.fromJson(json.decode(str));

String beaconsModelToJson(BeaconsModel data) => json.encode(data.toJson());

class BeaconsModel {
  final Region region;
  final List<Beacon> beacons;

  const BeaconsModel({
    this.region = const Region(),
    this.beacons = const [],
  });

  BeaconsModel copyWith({
    Region? region,
    List<Beacon>? beacons,
  }) =>
      BeaconsModel(
        region: region ?? this.region,
        beacons: beacons ?? this.beacons,
      );

  factory BeaconsModel.fromJson(Map<String, dynamic> json) => BeaconsModel(
        region: Region.fromJson(json["region"]),
        beacons:
            List<Beacon>.from(json["beacons"].map((x) => Beacon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "region": region.toJson(),
        "beacons": List<dynamic>.from(beacons.map((x) => x.toJson())),
      };
}

class Beacon {
  final String proximityUuid;
  final int major;
  final int minor;
  final int rssi;
  final double accuracy;
  final String proximity;
  final int txPower;
  final String macAddress;

  const Beacon({
    this.proximityUuid = "",
    this.major = 0,
    this.minor = 0,
    this.rssi = 0,
    this.accuracy = 0.0,
    this.proximity = '',
    this.txPower = 0,
    this.macAddress = "",
  });

  Beacon copyWith({
    String? proximityUuid,
    int? major,
    int? minor,
    int? rssi,
    double? accuracy,
    String? proximity,
    int? txPower,
    String? macAddress,
  }) =>
      Beacon(
        proximityUuid: proximityUuid ?? this.proximityUuid,
        major: major ?? this.major,
        minor: minor ?? this.minor,
        rssi: rssi ?? this.rssi,
        accuracy: accuracy ?? this.accuracy,
        proximity: proximity ?? this.proximity,
        txPower: txPower ?? this.txPower,
        macAddress: macAddress ?? this.macAddress,
      );

  factory Beacon.fromJson(Map<String, dynamic> json) => Beacon(
        proximityUuid: json["proximityUUID"],
        major: json["major"],
        minor: json["minor"],
        rssi: json["rssi"],
        accuracy: json["accuracy"].toDouble(),
        proximity: json["proximity"],
        txPower: json["txPower"],
        macAddress: json["macAddress"],
      );

  Map<String, dynamic> toJson() => {
        "proximityUUID": proximityUuid,
        "major": major,
        "minor": minor,
        "rssi": rssi,
        "accuracy": accuracy,
        "proximity": proximity,
        "txPower": txPower,
        "macAddress": macAddress,
      };
}

class Region {
  final String identifier;

  const Region({
    this.identifier = "",
  });

  Region copyWith({
    String? identifier,
  }) =>
      Region(
        identifier: identifier ?? this.identifier,
      );

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
      };
}
