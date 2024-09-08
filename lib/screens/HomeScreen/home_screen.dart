import 'package:flutter/material.dart';
import 'package:alumni_app_2/theme/images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);  // Added Key to the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 1,
        title: const Text('Alumni App', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            //open menu
          },
          icon: const Icon(Icons.menu, color: Colors.white,),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // do something
            },
            icon: const Icon(Icons.notifications, color: Colors.white,),
          ),
          IconButton(
            onPressed: () {
              // do something
            },
            icon: const Icon(Icons.account_circle_rounded, color: Colors.white,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Success Stories Section
              Container(
                height: 200,
                child: PageView(
                  children: <Widget>[
                    SuccessStoryCard(imagePath: Images.ss1),
                    SuccessStoryCard(imagePath: Images.ss2),
                    SuccessStoryCard(imagePath: Images.ss3),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Upcoming Events Section
              SectionTitle(title: 'Upcoming events', onSeeMore: () {
                // Navigate to events page
              }),
              EventCard(
                imagePath: Images.sport, // Add event images here
                eventTitle: 'Alumni sports meet at College Stadium',
                eventDate: 'Oct 10, 2024',
                eventLocation: 'College stadium, Block 10',
              ),
              EventCard(
                imagePath: Images.art,
                eventTitle: 'Art & Networking at Central Plaza',
                eventDate: 'Nov 05, 2024',
                eventLocation: 'Central Plaza, Downtown city',
              ),
              EventCard(
                imagePath: Images.conference,
                eventTitle: 'Alumni Music night at Galleria',
                eventDate: 'Dec 15, 2024',
                eventLocation: 'Galleria hall, Block 15',
              ),
              const SizedBox(height: 16),

              // Jobs Section
              SectionTitle(title: 'Jobs', onSeeMore: () {
                // Navigate to jobs page
              }),
              JobCard(
                imagePath: Images.microsoft, // Add company logo here
                companyName: 'Microsoft',
                jobTitle: 'Junior Software developers',
                applications: '100+ Applications',
              ),
              JobCard(
                imagePath: Images.linkedin,
                companyName: 'Startup Collaboration',
                jobTitle: 'Flutter Developer',
                applications: '50+ Applications',
              ),
              JobCard(
                imagePath: Images.apple,
                companyName: 'Apple Inc.',
                jobTitle: 'Full Stack Developer',
                applications: '300+ Applications',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Custom Widgets
class SuccessStoryCard extends StatelessWidget {
  final String imagePath;

  SuccessStoryCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onSeeMore;

  SectionTitle({required this.title, required this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onSeeMore,
          child: const Text('see more'),
        ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final String imagePath;
  final String eventTitle;
  final String eventDate;
  final String eventLocation;

  EventCard({required this.imagePath, required this.eventTitle, required this.eventDate, required this.eventLocation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(eventDate),
                const SizedBox(height: 4),
                Text(eventLocation),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String imagePath;
  final String companyName;
  final String jobTitle;
  final String applications;

  JobCard({required this.imagePath, required this.companyName, required this.jobTitle, required this.applications});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$companyName hiring $jobTitle',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(applications),
              ],
            ),
          ),
        ],
      ),
    );
  }
}