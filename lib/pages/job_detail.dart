import 'package:flutter/material.dart';
import 'package:jobapp/core/app_colors.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({super.key});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250, // Reduced height to match the design
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.asset(
                      'assets/bc-image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // White divider line
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 40, // Add white space at the bottom of the image
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  // Profile picture overlapping both sections
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.5 - 45,
                    right: MediaQuery.of(context).size.width * 0.5 - 45,
                    bottom: 0, // Move it down to overlap more
                    child: Container(
                      height: 80, // Increased size
                      width: 80, // Increased size
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 168, 129, 93),
                            width: 5.0),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  0, 0, 0, 60), // Increased bottom padding to avoid overlap
              child: Column(
                children: [
                  SizedBox(height: 30),
                  // Job title
                  Text(
                    'Product Designer',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7),
                  // Location
                  Text(
                    'California, USA',
                    style: const TextStyle(
                        color: AppColors.textGrey, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Tabs for Description, Company, etc.
                TabBar(
                  controller: _tabController,
                  isScrollable: false,
                  labelPadding: EdgeInsets.symmetric(horizontal: 4),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Description'),
                    Tab(text: 'Company'),
                    Tab(text: 'Applicant'),
                    Tab(text: 'Salary'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job Responsibilities',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('• ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    Expanded(
                                      child: Text(
                                        'Deliver well-crafted design that follows standards for consistency in quality and experience.\n',
                                        style: const TextStyle(
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('• ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    Expanded(
                                      child: Text(
                                        'Design creative solutions that deliver value to customers and solve business objectives.\n',
                                        style: const TextStyle(
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('• ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    Expanded(
                                      child: Text(
                                        'Contribute to design critiques, conceptual discussions, and maintain consistency of the design system.\n',
                                        style: const TextStyle(
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Skills Needed',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 10),
                            Wrap(
                              spacing: 0,
                              runSpacing: 8,
                              children: [
                                '• Lead',
                                '• UX Design',
                                '• Problem Solving',
                                '• Critical'
                              ]
                                  .map((skill) => Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          skill,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      Center(child: Text('Coming Soon...')),
                      Center(child: Text('Coming Soon...')),
                      Center(child: Text('Coming Soon...')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Apply Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(Icons.chat_outlined, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
