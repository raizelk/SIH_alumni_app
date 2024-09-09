import 'package:alumni_app_2/screen4_donation/Donationpage1.dart';
import 'package:alumni_app_2/screen4_donation/donation3.dart';
import 'package:flutter/material.dart';

class Donation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);  // Corrected back navigation
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Title
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets2/ek.jpg',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Educate a Girl, Educate a Nation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Raised amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$268,796',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '/ \$280,000',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Progress bar
            LinearProgressIndicator(
              value: 268796 / 280000, // Calculate the progress percentage
              backgroundColor: Colors.grey[300],
              color: Colors.indigo,
            ),
            SizedBox(height: 16),
            // About Donation Text
            Text(
              'About Donation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Girls\' education is a major priority. This project will provide resources for girls ages 3-30 years old to get their education to include vocational training, computer training, and attending college so that girls are empowered to be self-sufficient.',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            // Donate Now Button
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Donation3(), // Navigation to Donation3
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text(
                    'Donate Now',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}