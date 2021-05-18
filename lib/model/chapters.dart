import 'package:json_annotation/json_annotation.dart';

part 'chapters.g.dart';

@JsonSerializable()
class Chapters {

  @JsonKey(name: 'children')
  List<Chapters> children;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  Chapters(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory Chapters.fromJson(Map<String, dynamic> srcJson) => _$ChaptersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChaptersToJson(this);

  @override
  String toString() {
    return 'Chapters{children: $children, courseId: $courseId, id: $id, name: $name, order: $order, parentChapterId: $parentChapterId, userControlSetTop: $userControlSetTop, visible: $visible}';
  }
}


