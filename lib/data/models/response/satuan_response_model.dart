import 'dart:convert';

class SatuanResponseModel {
    final Satuan? satuan;

    SatuanResponseModel({
        this.satuan,
    });

    factory SatuanResponseModel.fromJson(String str) => SatuanResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SatuanResponseModel.fromMap(Map<String, dynamic> json) => SatuanResponseModel(
        satuan: json["satuan"] == null ? null : Satuan.fromMap(json["satuan"]),
    );

    Map<String, dynamic> toMap() => {
        "satuan": satuan?.toMap(),
    };
}

class Satuan {
    final int? id;
    final String? name;
    final String? email;
    final String? address;
    final String? latitude;
    final String? longitude;
    final String? radiusKm;
    final String? timeIn;
    final String? timeOut;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Satuan({
        this.id,
        this.name,
        this.email,
        this.address,
        this.latitude,
        this.longitude,
        this.radiusKm,
        this.timeIn,
        this.timeOut,
        this.createdAt,
        this.updatedAt,
    });

    factory Satuan.fromJson(String str) => Satuan.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Satuan.fromMap(Map<String, dynamic> json) => Satuan(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        radiusKm: json["radius_km"],
        timeIn: json["time_in"],
        timeOut: json["time_out"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "radius_km": radiusKm,
        "time_in": timeIn,
        "time_out": timeOut,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
