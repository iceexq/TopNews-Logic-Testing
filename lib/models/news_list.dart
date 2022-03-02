import 'package:json_annotation/json_annotation.dart';

part 'news_list.g.dart';

@JsonSerializable()
class NewsList {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'day')
  final List? day;
  @JsonKey(name: 'time')
  final String? time;

  NewsList({
    this.name,
    this.day,
    this.time,
  });

  factory NewsList.fromJson(Map<String, dynamic> json) =>
      _$NewsListFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListToJson(this);
}
