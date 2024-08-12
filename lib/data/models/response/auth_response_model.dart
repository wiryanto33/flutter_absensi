import 'dart:convert';

class AuthResponseModel {
  final Prajurit? prajurit;
  final String? token;

  AuthResponseModel({
    this.prajurit,
    this.token,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        prajurit: json["prajurit"] == null
            ? null
            : Prajurit.fromMap(json["prajurit"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "prajurit": prajurit?.toMap(),
        "token": token,
      };

  AuthResponseModel copyWith({
    Prajurit? prajurit,
    String? token,
  }) {
    return AuthResponseModel(
      prajurit: prajurit ?? this.prajurit,
      token: token ?? this.token,
    );
  }
}

class Prajurit {
  final int? id;
  final String? nrp;
  final String? pangkat;
  final String? name;
  final String? korps;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic position;
  final String? jabatan;
  final String? departement;
  final String? phone;
  final String? faceEmbedding;
  final String? imageUrl;

  Prajurit({
    this.id,
    this.nrp,
    this.pangkat,
    this.name,
    this.korps,
    this.createdAt,
    this.updatedAt,
    this.position,
    this.jabatan,
    this.departement,
    this.phone,
    this.faceEmbedding,
    this.imageUrl,
  });

  factory Prajurit.fromJson(String str) => Prajurit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Prajurit.fromMap(Map<String, dynamic> json) => Prajurit(
        id: json["id"],
        nrp: json["nrp"],
        pangkat: json["pangkat"],
        name: json["name"],
        korps: json["korps"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        position: json["position"],
        jabatan: json["jabatan"],
        departement: json["departement"],
        phone: json["phone"],
        faceEmbedding: json["face_embedding"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nrp": nrp,
        "pangkat": pangkat,
        "name": name,
        "korps": korps,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "position": position,
        "jabatan": jabatan,
        "departement": departement,
        "phone": phone,
        "face_embedding": faceEmbedding,
        "image_url": imageUrl,
      };
}
