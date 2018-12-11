import 'package:flutter_app/model/IndexNewItemBean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'IndexNewsBean.g.dart';

@JsonSerializable()
class IndexNewsBean {

  int curPage;
  List<IndexNewItemBean> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  IndexNewsBean(
      this.curPage,
      this.datas,
      this.offset,
      this.over,
      this.pageCount,
      this.size,
      this.total
      );


  factory IndexNewsBean.fromJson(Map<String, dynamic> json) => _$IndexNewsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$IndexNewsBeanToJson(this);

}