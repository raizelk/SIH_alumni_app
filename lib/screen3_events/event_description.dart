import 'package:flutter/material.dart';
import 'package:alumni_app_2/screen3_events/des.dart';
import 'package:alumni_app_2/screen3_events/data_model.dart';
import 'package:alumni_app_2/theme/images.dart';

void main() {
  runApp(UventoApp());
}

class UventoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventScreen(),
    );
  }
}

class EventScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'title': 'Alumni Sports Meet in College Stadium',
      'date': 'Oct 10, 2024',
      'location': 'College Stadium, Sector 10, City Name',
      'image': 'assets2/IMG_2661.JPG',
    },
    {
      'title': 'Art & Networking at Central Plaza',
      'date': 'Nov 05, 2024',
      'location': 'Central Plaza, Downtown City',
      'image': 'assets2/IMG_2662.JPG',
    },
    {
      'title': 'Alumni Music Night at Galleria',
      'date': 'Dec 15, 2024',
      'location': 'Galleria Hall, Sector 15, City Name',
      'image': 'assets2/IMG_2665.JPG',
    },
    {
      'title': 'Alumni Career Fair',
      'date': 'Oct 20, 2024',
      'location': 'Auditorium Hall, Sector 12, City Name',
      'image': 'assets2/IMG_2664.JPG',
    },
    {
      'title': 'Entrepreneurship Showcase',
      'date': 'Nov 10, 2024',
      'location': 'Tech Park, Sector 18, City Name',
      'image': 'assets2/IMG_2667.JPG',
    },
    {
      'title': 'Alumni Charity Gala',
      'date': 'Dec 01, 2024',
      'location': 'Grand Ballroom, Sector 8, City Name',
      'image': 'assets2/IMG_2663.JPG',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text("EVENTS", style: TextStyle(color: Colors.black, fontSize: 24)),
            Spacer(),
            Icon(Icons.notifications, color: Colors.black),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: AssetImage(Images.user),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Raizel!!", style: TextStyle(color: Colors.black, fontSize: 22)),
            SizedBox(height: 4),
            Text("Let's explore what's happening nearby",
                style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16)),
            SizedBox(height: 20),
            _buildDateSelector(),
            SizedBox(height: 20),
            Expanded(child: _buildEventList(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < 30; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][i % 7],
                    style: TextStyle(color: Colors.indigo.withOpacity(0.9)),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: i == 2 ? Colors.indigo[300] : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      (i + 1).toString(),
                      style: TextStyle(color: i == 2 ? Colors.black : Colors.black),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEventList(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.indigo[50],
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Image.asset(events[index]['image'] ?? 'assets/1.png'),
            title: Text(events[index]['title'] ?? '',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Text(events[index]['date'] ?? '',
                    style: TextStyle(color: Colors.black.withOpacity(0.9))),
                SizedBox(height: 2),
                Text(events[index]['location'] ?? '',
                    style: TextStyle(color: Colors.black.withOpacity(0.7))),
              ],
            ),
            onTap: () {
              if (events[index]['title'] == 'Alumni Career Fair') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EventDescriptionScreen()),
                );
              }
            },
          ),
        );
      },
    );
  }
}