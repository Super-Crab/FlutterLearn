part of 'IndexNewItemBean.dart';

IndexNewItemBean _$IndexNewItemBeanFromJson(Map<String, dynamic> json) {
  return IndexNewItemBean(
      json['author'] as String,
      json['chapterId'] as int,
      json['chapterName'] as String,
      json['courseId'] as int,
      json['id'] as int,
      json['link'] as String,
      json['superChapterId'] as int,
      json['superChapterName'] as String,
      json['title'] as String,
      json['niceDate'] as String);
}

Map<String, dynamic> _$IndexNewItemBeanToJson(IndexNewItemBean instance) =>
    <String, dynamic>{
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'courseId': instance.author,
      'id': instance.id,
      'link': instance.link,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'title': instance.title,
    };