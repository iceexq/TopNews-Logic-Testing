import 'package:logical_frontend/models/news_list.dart';

class NewsListService {
  static Future<List<NewsList>> searchNewsList(int day, String time) async {
    Map<String, dynamic> newsListMap = {
      "data": [
        {
          "name": "ข่าวมีคม",
          "day": [1, 2, 3, 4, 5],
          "time": "06:10",
        },
        {
          "name": "เช้าข่าวเข้ม",
          "day": [1, 2, 3, 4, 5],
          "time": "08:30",
        },
        {
          "name": "ผ่าประเด็นโลก",
          "day": [1, 2, 3, 4, 5],
          "time": "10:05",
        },
        {
          "name": "เที่ยง ททบ 5",
          "day": [1, 2, 3, 4, 5],
          "time": "12:05",
        },
        {
          "name": "TOP ข่าวเที่ยง",
          "day": [6, 7],
          "time": "12:00",
        },
      ]
    };
    var newsList = <NewsList>[];
    for (var newsListJson in newsListMap['data']) {
      var news = NewsList.fromJson(newsListJson);
      if (time == news.time) {
        for (var i = 0; i < news.day!.length; i++) {
          if (day == news.day![i]) {
            newsList.add(news);
          }
        }
      }
    }
    return newsList;
  }
}
