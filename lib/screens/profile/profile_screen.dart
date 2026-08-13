import 'package:flutter/material.dart';
import 'package:food2go/widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Header section (fixed height)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back, color: Colors.white),
                Text('Profile', style: TextStyle(color: Colors.white)),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
          ),
          // Profile info section (fixed height)
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'John Doe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'mail@mail.com',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w100,
            ),
          ),
          // White container that takes all remaining space
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  ProfileItem(
                    icon: Icons.person,
                    title: 'Account',
                    onTap: () {
                      // Handle account tap
                    },
                  ),
                  ProfileItem(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onTap: () {
                      // Handle notifications tap
                    },
                  ),
                  ProfileItem(
                    icon: Icons.lock,
                    title: 'Privacy',
                    onTap: () {
                      // Handle privacy tap
                    },
                  ),
                  ProfileItem(
                    icon: Icons.help,
                    title: 'Help & Support',
                    onTap: () {
                      // Handle help & support tap
                    },
                  ),
                  ProfileItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      // Handle logout tap
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
