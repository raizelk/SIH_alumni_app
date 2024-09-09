import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class DirectoryHome extends StatefulWidget {
  const DirectoryHome({super.key});

  @override
  State<DirectoryHome> createState() => _DirectoryHomeState();
}

class _DirectoryHomeState extends State<DirectoryHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Two tabs: Networking and Members
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Function to show the filter popup
  void _showFiltersPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Filters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text('Skills', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilterChip(label: const Text('Business'), onSelected: (val) {}),
                  FilterChip(label: const Text('Design'), onSelected: (val) {}),
                  FilterChip(label: const Text('Engineering'), onSelected: (val) {}),
                  // Add more skills
                ],
              ),
              const SizedBox(height: 16),
              const Text('Region', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilterChip(label: const Text('New Delhi'), onSelected: (val) {}),
                  FilterChip(label: const Text('Asia Pacific'), onSelected: (val) {}),
                  FilterChip(label: const Text('North America'), onSelected: (val) {}),
                  // Add more regions
                ],
              ),
              const SizedBox(height: 16),
              const Text('Country', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilterChip(label: const Text('Argentina'), onSelected: (val) {}),
                  FilterChip(label: const Text('Brazil'), onSelected: (val) {}),
                  FilterChip(label: const Text('Canada'), onSelected: (val) {}),
                  // Add more countries
                ],
              ),
              const SizedBox(height: 16),
              const Text('Batch', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilterChip(label: const Text('2020'), onSelected: (val) {}),
                  FilterChip(label: const Text('2021'), onSelected: (val) {}),
                  FilterChip(label: const Text('2022'), onSelected: (val) {}),
                  // Add more batches
                ],
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
        title: GestureDetector(
          onTap: () {
            _showFiltersPopup(context); // Show filters when tapping search bar
          },
          child: Container(
            width: 200,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Text('Search...', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Add your join network action here
            },
            child: const Text('Join Network'),
          ),
          const SizedBox(width: 16),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Networking'),
            Tab(text: 'Members'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNetworkingTab(),
          _buildMembersTab(),
        ],
      ),
    );
  }

  // Networking tab: Displays batches
  Widget _buildNetworkingTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Alumni Networks', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Flexible(
            child: ListView.builder(
              itemCount: 3, // Three batches
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBatchCard(
                      index == 0 ? 'Batch 2020' : index == 1 ? 'Batch 2021' : 'Batch 2022',
                      'assets/group/grp${index + 1}.jpg',
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Members tab: Displays alumni profiles
  Widget _buildMembersTab() {
    List<String> names = ['John Doe', 'Jane Smith', 'Emily Davis', 'Michael Johnson', 'Sophia Lee'];
    List<String> batches = ['Batch 2020', 'Batch 2021', 'Batch 2022', 'Batch 2023', 'Batch 2024'];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 5, // Five alumni profiles
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(
                names[index],
                batches[index],
                'assets/user/user${index + 1}.jpg',
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }

  // Batch card widget
  Widget _buildBatchCard(String batchName, String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(imageUrl, width: 60, height: 60, fit: BoxFit.cover),
              title: Text(batchName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: IconButton(
              icon: const Icon(Icons.group_add, color: Colors.blue),
              onPressed: () {
                // Join Network action
              },
            ),
          ),
        ],
      ),
    );
  }

  // Profile card widget for the Members tab
  Widget _buildProfileCard(String name, String batch, String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 60, height: 60, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(batch, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    FlutterSocialButton(
                      mini: true,
                      onTap: () {},
                      buttonType: ButtonType.github,
                    ),
                    FlutterSocialButton(
                      mini: true,
                      onTap: () {},
                      buttonType: ButtonType.twitter,
                    ),
                    FlutterSocialButton(
                      mini: true,
                      onTap: () {},
                      buttonType: ButtonType.phone,
                    ),
                    FlutterSocialButton(
                      mini: true,
                      onTap: () {},
                      buttonType: ButtonType.linkedin,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 