// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppRadio _$AppRadioFromJson(Map<String, dynamic> json) => AppRadio(
      name: json['name'] as String,
      url: json['url'] as String,
      favicon: AppRadio._faviconFromJson(json['favicon'] as String),
      tags: AppRadio._tagsFromJson(json['tags'] as String),
    );

Map<String, dynamic> _$AppRadioToJson(AppRadio instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'favicon': instance.favicon,
      'tags': instance.tags,
    };
