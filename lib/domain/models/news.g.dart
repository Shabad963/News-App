// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_News _$$_NewsFromJson(Map<String, dynamic> json) => _$_News(
      urlToImage: json['urlToImage'] as String?,
      title: json['title'] as String?,
      publishedAt: json['publishedAt'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      description: json['description'] as String?,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$$_NewsToJson(_$_News instance) => <String, dynamic>{
      'urlToImage': instance.urlToImage,
      'title': instance.title,
      'publishedAt': instance.publishedAt,
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'author': instance.author,
    };
