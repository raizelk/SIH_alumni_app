import 'package:flutter/material.dart';
import 'package:alumni_app_2/theme/colors.dart';
import 'package:alumni_app_2/theme/images.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({super.key});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();

  Widget _headerStatic(String title, String sub) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ColorsApp.subtitle,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            sub,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsApp.title,
            ),
          ),
        ],
      ),
    );
  }
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        backgroundColor: ColorsApp.background,
        iconTheme: const IconThemeData(color: ColorsApp.primary),
        elevation: 0,
        title: const Text(
          'Job Details',
          style: TextStyle(color: ColorsApp.title),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              icon: const Icon(Icons.cloud_upload, size: 28),
              onPressed: () {
                // Upload functionality can be added here
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                Images.google, // Replace with your image asset
                height: 80,
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Google Company",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.title,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "App Developer",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorsApp.subtitle,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                widget._headerStatic("Salary", "\$85,000"),
                widget._headerStatic("Employees", "45,000"),
                widget._headerStatic("Location", "New York, USA"),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    Images.doc,
                    height: 25,
                    color: ColorsApp.primary,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    Images.museum,
                    height: 25,
                    color: ColorsApp.icon,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    Images.clock,
                    height: 25,
                    color: ColorsApp.icon,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    Images.map,
                    height: 25,
                    color: ColorsApp.icon,
                  ),
                ),
              ],
            ),
            const Divider(
              color: ColorsApp.icon,
              height: 40,
            ),
            const SizedBox(height: 10),
            const Text(
              "Job Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorsApp.title,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Designing and developing advanced applications for the Android platform. "
                  "Unit-testing code for robustness, including edge cases, usability, and general reliability. "
                  "Working knowledge of the general mobile landscape, architectures, trends, and emerging technologies.",
              style: TextStyle(
                fontSize: 15,
                color: ColorsApp.subtitle,
              ),
            ),
            TextButton(
              onPressed: () {
                // Implement the read more functionality
              },
              child: const Text(
                "Read More",
                style: TextStyle(
                  color: ColorsApp.primary,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement Apply Now functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.icon,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Apply Now'),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    // Implement save job functionality
                  },
                  icon: const Icon(Icons.bookmark_outline),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
