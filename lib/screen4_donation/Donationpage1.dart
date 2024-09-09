import 'package:flutter/material.dart';
import'package:alumni_app_2/screen4_donation/donation2.dart';

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top:6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Hello, Mario!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white)
                ,
              ),
              Text(
                'What do you want to donate today',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search....',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Categories
              Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryIcon(icon: Icons.grid_view, label: 'All', selected: true),
                  CategoryIcon(icon: Icons.business , label: 'Infrastructure'),
                  CategoryIcon(icon: Icons.school ,label: 'Education'),
                  CategoryIcon(icon: Icons.build, label:'Equipment'),
                ],
              ),
              SizedBox(height: 20),

              // Emergency Help
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Donate for a Cause',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'More',
                    style: TextStyle(color: Colors.indigo),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Donation Card

              DonationCard(
                title: 'Hostel Infrastructure',
                imageAsset: 'assets2/download (18).jpeg', // Replace with actual image URL
                progress: 85,
                raised: '850K',
                goal: '1M',
              ),
              DonationCard(
                title: 'Student Activities and Development',
                imageAsset:'assets2/stu.jpeg', // Replace with actual image URL
                progress: 94,
                raised: '269K',
                goal: '280K',
              ),

              // "Get Started" Button
              SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Donation2(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const CategoryIcon({
    Key? key,
    required this.icon,
    required this.label,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: selected ? Colors.indigo : Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(12),
          child: Icon(
            icon,
            color: selected ? Colors.white : Colors.grey[800],
            size: 28,
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

class DonationCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final int progress;
  final String raised;
  final String goal;

  const DonationCard({
    Key? key,
    required this.title,
    required this.imageAsset, // Use asset path
    required this.progress,
    required this.raised,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section using asset
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageAsset,  // Updated to use assets
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                // Progress bar
                Row(
                  children: [
                    Text('\$$raised/$goal'),
                    Spacer(),
                    Text('$progress%'),
                  ],
                ),
                SizedBox(height: 5),
                LinearProgressIndicator(
                  value: progress / 100,
                  backgroundColor: Colors.grey[300],
                  color: Colors.indigo,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Define AnotherPage (for navigation when the "Get Started" button is pressed)
// class Donation2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Another Page"),
//       ),
//       body: Center(
//         child: Text("Welcome to Another Page"),
//       ),
//     );
//   }
// }