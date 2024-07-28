// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Service {
  String title;
  String description;
  IconData icon;
  Service({
    required this.title,
    required this.description,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'icon': icon.codePoint,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      title: map['title'] as String,
      description: map['description'] as String,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);
}

List serviceList = [
  Service(
    title: 'Generate Image',
    description:
        'Create stunning visuals instanly! Simply describe what you want',
    icon: Icons.image,
  ),
  Service(
    title: 'Generate Video',
    description:
        'Create stunning visuals instanly! Simply describe what you want',
    icon: Icons.camera_roll_outlined,
  ),
  Service(
    title: 'Generate Script',
    description:
        'Create stunning script instanly! Simply describe what you want',
    icon: Icons.text_format_sharp,
  ),
  Service(
    title: 'Generate Caption',
    description:
        'Create stunning caption instanly! Simply describe what you want',
    icon: Icons.text_snippet_outlined,
  ),
];
