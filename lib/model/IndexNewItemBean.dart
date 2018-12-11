import 'package:json_annotation/json_annotation.dart';

part 'IndexNewItemBean.g.dart';

@JsonSerializable()
class IndexNewItemBean {

  IndexNewItemBean(
      this.author,
      this.chapterId,
      this.chapterName,
      this.courseId,
      this.id,
      this.link,
      this.superChapterId,
      this.superChapterName,
      this.title,
      this.niceDate);

  String author;
  int chapterId;
  String chapterName;
  int courseId;
  int id;
  String link;
  int superChapterId;
  String superChapterName;
  String title;
  String niceDate;

  factory IndexNewItemBean.fromJson(Map<String, dynamic> json) => _$IndexNewItemBeanFromJson(json);

  Map<String, dynamic> toJson() => _$IndexNewItemBeanToJson(this);
}