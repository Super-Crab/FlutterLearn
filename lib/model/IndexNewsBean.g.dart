part of 'IndexNewsBean.dart';

IndexNewsBean _$IndexNewsBeanFromJson(Map<String, dynamic> json) {

  var list = json['datas'] as List;
  List<IndexNewItemBean> datas = list.map((i) => IndexNewItemBean.fromJson(i)).toList();

  return IndexNewsBean(
      json['curPage'] as int,
      datas as List<IndexNewItemBean>,
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int);
}

Map<String, dynamic> _$IndexNewsBeanToJson(IndexNewsBean instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };
