import 'package:flutter/material.dart';

class EventDescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets2/IMG_2664.JPG'), // Replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets2/1.png'), // Replace with your icon
                              radius: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Alumni Career Fair',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 16),
                            SizedBox(width: 5),
                            Text('Oct 20, 2024, 10:00 AM'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text('Auditorium Hall, Sector 12, City Name'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.security, size: 16),
                            SizedBox(width: 5),
                            Text('This event is secure'),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'ABOUT THE EVENT',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The Alumni Career Fair is a great opportunity for alumni to connect with industry professionals and explore job opportunities. Join us at the Auditorium Hall on Oct 20, 2024...',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Action for Join Event button
                },
                child: Text(
                  'JOIN EVENT',
                  style: TextStyle(color: Colors.indigo),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.indigo[50],
                  textStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}