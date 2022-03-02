part of 'news_list.dart';

NewsList _$NewsListFromJson(Map<String, dynamic> json) => NewsList(
      name: json['name'] as String?,
      day: json['day'] as List?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$NewsListToJson(NewsList instance) => <String, dynamic>{
      'name': instance.name,
      'day': instance.day,
      'time': instance.time,
    };
