import 'package:flutter/material.dart';
import 'package:alumni_app_2/theme/images.dart';
import 'package:alumni_app_2/theme/colors.dart';
import 'package:alumni_app_2/screen2_jobPortal/job_detail_screen.dart';
import 'package:alumni_app_2/screen2_jobPortal/job_create_screen.dart';

class JobHomeScreen extends StatefulWidget {
  const JobHomeScreen({super.key});

  @override
  State<JobHomeScreen> createState() => _JobHomeScreenState();
}

class _JobHomeScreenState extends State<JobHomeScreen> {
  // Recommended Job Card Widget
  Widget _recommendedJobs(
      BuildContext context, {
        required String img,
        required String company,
        required String title,
        required String sub,
        bool isActive = false,
      }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JobDetailScreen()),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
            color: isActive ? ColorsApp.primary : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(img, height: 30),
                const SizedBox(height: 20),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isActive ? Colors.white : ColorsApp.title,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isActive ? Colors.white : ColorsApp.title,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  sub,
                  style: TextStyle(
                    fontSize: 14,
                    color: isActive ? Colors.white : ColorsApp.subtitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Recent Job Card Widget
  Widget _jobCard(
      BuildContext context, {
        required String img,
        required String title,
        required String subtitle,
        required String salary,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JobDetailScreen()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset(img, height: 40),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsApp.title,
              ),
            ),
            subtitle: Text(subtitle),
            trailing: Text(
              salary,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsApp.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(Images.user),
                    ),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dear Programmer",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorsApp.title,
                          ),
                        ),
                        Text(
                          "Flutter Developer",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorsApp.subtitle,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // Navigate to the CreateJob screen when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateJob(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.create), // Changed the icon to 'create'
                      color: ColorsApp.icon,
                      iconSize: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsApp.subtitle,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Find your perfect job",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.title,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "What are you looking for?",
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: const Icon(Icons.search, color: ColorsApp.icon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.title,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    _recommendedJobs(
                      context,
                      img: Images.google,
                      company: "Google",
                      title: "App Developer",
                      sub: "\$45,500 Onsite",
                      isActive: true,
                    ),
                    _recommendedJobs(
                      context,
                      img: Images.microsoft,
                      company: "Microsoft",
                      title: "Web Developer",
                      sub: "\$65,500 Remote",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Recent Jobs",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.title,
                  ),
                ),
                const SizedBox(height: 15),
                _jobCard(
                  context,
                  img: Images.cisco,
                  title: "UX Developer",
                  subtitle: "Cisco",
                  salary: "\$75,800",
                ),
                _jobCard(
                  context,
                  img: Images.amazon,
                  title: "App Developer",
                  subtitle: "Amazon",
                  salary: "\$45,800",
                ),
                _jobCard(
                  context,
                  img: Images.apple,
                  title: "Web Developer",
                  subtitle: "Apple",
                  salary: "\$85,800",
                ),
                _jobCard(
                  context,
                  img: Images.ibm,
                  title: "AI Engineer",
                  subtitle: "IBM",
                  salary: "\$95,800",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
