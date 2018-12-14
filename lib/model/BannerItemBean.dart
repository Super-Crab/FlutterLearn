import 'package:json_annotation/json_annotation.dart';
part 'BannerItemBean.g.dart';
@JsonSerializable()
class BannerItemBean {

  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  BannerItemBean(
      this.desc,
      this.id,
      this.imagePath,
      this.isVisible,
      this.order,
      this.title,
      this.type,
      this.url
      );

  factory BannerItemBean.fromJson(Map<String, dynamic> json) => _$BannerItemBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemBeanToJson(this);
}