import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logical_frontend/services/news_list_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var titleNews = "";
  var dateOfSearch = DateTime.now();

  Future searchNewsList(DateTime day) async {
    titleNews = "";
    String time = DateFormat("hh:mm")
        .format(DateTime(day.year, day.month, day.day, day.hour, day.minute));
    var res = await NewsListService.searchNewsList(day.weekday, time);
    for (var i = 0; i < res.length; i++) {
      setState(() {
        titleNews = res[i].name!;
      });
    }
    _showDialog(titleNews);
  }

  void _showDialog(String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            content: Text(
              title == "" ? "-" : title,
              style: const TextStyle(fontSize: 16),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("ปิด"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade400,
        title: const Text(
          'Logical Test',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Form(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ค้นหารายการข่าวที่แสดง',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DateTimeField(
                dateTextStyle: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: "วันที่",
                  fillColor: Colors.white70,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(
                        251,
                        191,
                        102,
                        1.0,
                      ),
                      width: 1.0,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.calendar_today_rounded,
                      size: 16,
                    ),
                  ),
                ),
                selectedDate: dateOfSearch,
                initialDate: DateTime.now(),
                mode: DateTimeFieldPickerMode.dateAndTime,
                onDateSelected: (DateTime value) {
                  setState(() {
                    dateOfSearch = value;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      searchNewsList(dateOfSearch);
                    },
                    child: const Text('ค้นหา'),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
