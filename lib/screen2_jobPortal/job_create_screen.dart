import 'package:flutter/material.dart';

class CreateJob extends StatefulWidget {
  const CreateJob({super.key});

  @override
  State<CreateJob> createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedJobTitle;
  String? selectedLocation;
  String? selectedJobType;
  String? selectedExperience;
  String? selectedEducation;
  String? selectedExpectedIncome;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Job"),
        backgroundColor: Colors.indigo, // Applied Cyan Accent here
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white, // Applied White here for visibility
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(text: 'Job Details'),
            Tab(text: 'Skills & Qualifications'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildJobDetailsTab(),
          buildSkillsQualificationsTab(),
        ],
      ),
    );
  }

  Widget buildJobDetailsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Job Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
            value: selectedJobTitle,
            items: [
              'Software Developer/Engineer',
              'Data Scientist',
              'Cloud Engineer',
              // Add more options as required
            ].map((String jobTitle) {
              return DropdownMenuItem<String>(
                value: jobTitle,
                child: Text(jobTitle),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedJobTitle = newValue;
              });
            },
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Enter job description here...',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Location',
              border: OutlineInputBorder(),
            ),
            value: selectedLocation,
            items: [
              'United States',
              'Canada',
              'India',
              'Remote',
              // Add more locations as required
            ].map((String location) {
              return DropdownMenuItem<String>(
                value: location,
                child: Text(location),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedLocation = newValue;
              });
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Job Type',
              border: OutlineInputBorder(),
            ),
            value: selectedJobType,
            items: [
              'On-site',
              'Remote',
              'Hybrid',
              // Add more job types as required
            ].map((String jobType) {
              return DropdownMenuItem<String>(
                value: jobType,
                child: Text(jobType),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedJobType = newValue;
              });
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _tabController.animateTo(1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSkillsQualificationsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Skills & Qualifications',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Year of Experience',
              border: OutlineInputBorder(),
            ),
            items: ['1 year', '2 years', '3 years', '5 years', '10 years', 'More than 10 years']
                .map((String value) => DropdownMenuItem<String>(
                value: value, child: Text(value)))
                .toList(),
            onChanged: (String? newValue) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Education',
              border: OutlineInputBorder(),
            ),
            items: ['B.Tech', 'MBA', 'PhD', 'MCA']
                .map((String value) => DropdownMenuItem<String>(
                value: value, child: Text(value)))
                .toList(),
            onChanged: (String? newValue) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Expected Income (LPA)',
              border: OutlineInputBorder(),
            ),
            items: ['2-4 LPA', '4-6 LPA', '6-8 LPA', '8-10 LPA', '10+ LPA']
                .map((String value) => DropdownMenuItem<String>(
                value: value, child: Text(value)))
                .toList(),
            onChanged: (String? newValue) {},
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Action to finalize job creation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Create Job',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
