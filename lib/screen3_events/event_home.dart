import 'package:flutter/material.dart';
import 'package:alumni_app_2/screen3_events/data.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<EventItem> dates = [];
  List<DateTile> events = [];

  String todayDateIs = "12";

  @override
  void initState() {
    super.initState();
    dates = getEventPage(); // Initialize event dates
    events = getDataTiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            // Background color
            Container(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            // Main content
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Header Row
                  Row(
                    children: <Widget>[

                      SizedBox(width: 4),
                      Row(
                        children: <Widget>[
                          Text(
                            "ALUM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            "LINK",
                            style: TextStyle(
                              color: Color(0xffFCCD00),
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.notifications, color: Colors.white, size: 25),
                      SizedBox(width: 16),
                      Icon(Icons.menu, color: Colors.white, size: 25),
                    ],
                  ),
                  Divider(height: 20.0, color: Colors.white),
                  // Greeting and Profile
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Hello Raizel",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Let's explore what's happening",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        child: Icon(Icons.account_circle_rounded, color: Colors.white, size: 25),
                      ),
                    ],
                  ),
                  // Event Dates Row
                  SizedBox(height: 20),
                  // Dates
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dates.length,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return dates[index];
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "All Events",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  // Events
                  Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: events.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DateTile(
                          imgAssetPath: events[index].imgAssetPath,
                          eventType: events[index].eventType,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Popular Events",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  final String weekday;
  final String date;
  final bool isSelected;

  EventItem({
    required this.date,
    required this.weekday,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xffFCCD00) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.black54 : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 13),
          Text(
            weekday,
            style: TextStyle(
              color: isSelected ? Colors.black54 : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class DateTile extends StatelessWidget {
  final String imgAssetPath;
  final String eventType;

  DateTile({required this.imgAssetPath, required this.eventType});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 189, 207, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgAssetPath, height: 40),
          SizedBox(height: 8),
          Text(
            eventType,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class PopularEventTile extends StatelessWidget {
  final String desc;
  final String date;
  final String address;
  final String imgAssetPath;

  PopularEventTile({
    required this.desc,
    required this.date,
    required this.address,
    required this.imgAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imgAssetPath, height: 50, width: 50), // Event image
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                desc,
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              SizedBox(height: 4),
              Text(
                address,
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}