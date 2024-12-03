import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background color
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with your profile image path
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hello Safouen!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Badge(
          child:Icon(
            Icons.notifications,
            color: Theme.of(context).primaryColor,
          ),
            ), onPressed: () {  },
      )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance Card
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF100C30), Color(0xFF1B1662)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "YOUR BALANCE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "\$41,379.00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.visibility,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildActionButton(
                          icon: Icons.upload_rounded,
                          label: "Transfer",
                        ),
                        _buildActionButton(
                          icon: Icons.download_rounded,
                          label: "Withdraw",
                        ),
                        _buildActionButton(
                          icon: Icons.pie_chart_rounded,
                          label: "Invest",
                        ),
                        _buildActionButton(
                          icon: Icons.add_circle_rounded,
                          label: "Top up",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Top-up Card
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEE5FF),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.wallet_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "Check your monthly expenses",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
      NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.transparent, // Set indicator color to transparent
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.credit_card_rounded)),
            label: 'Card',
          ),
          NavigationDestination(
            selectedIcon: Container(
              width: 48.0, // Set the width as needed
              height: 48.0, // Set the height as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary, // Use theme's primary color
              ),
              child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
            ),
            icon: Container(
              width: 68.0, // Set the width as needed
              height: 68.0, // Set the height as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary, // Use theme's primary color
              ),
              child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bar_chart),
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.supervised_user_circle_rounded)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
