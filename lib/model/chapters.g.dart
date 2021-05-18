// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapters _$ChaptersFromJson(Map<String, dynamic> json) {
  return Chapters(
    (json['children'] as List<dynamic>)
        .map((e) => Chapters.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['courseId'] as int,
    json['id'] as int,
    json['name'] as String,
    json['order'] as int,
    json['parentChapterId'] as int,
    json['userControlSetTop'] as bool,
    json['visible'] as int,
  );
}

Map<String, dynamic> _$ChaptersToJson(Chapters instance) => <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
