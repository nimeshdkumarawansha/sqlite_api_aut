import 'package:flutter/material.dart';
import 'package:sqlite_api_auth/screens/login_screen.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Text(
                  user.displayName[0].toUpperCase(),
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(height: 24),
            ProfileInfoCard(
              title: 'User Information',
              items: [
                ProfileItem(label: 'Name', value: user.displayName),
                ProfileItem(label: 'Email', value: user.email),
                ProfileItem(label: 'User Code', value: user.userCode),
                ProfileItem(label: 'Employee Code', value: user.employeeCode),
                ProfileItem(label: 'Company Code', value: user.companyCode),
              ],
            ),
            SizedBox(height: 16),
            if (user.userLocations.isNotEmpty) ...[
              ProfileInfoCard(
                title: 'Locations',
                items: user.userLocations.map((location) => 
                  ProfileItem(label: 'Location', value: location.toString())
                ).toList(),
              ),
              SizedBox(height: 16),
            ],
            if (user.userPermissions.isNotEmpty) ...[
              ProfileInfoCard(
                title: 'Permissions',
                items: user.userPermissions.map((permission) => 
                  ProfileItem(label: 'Permission', value: permission.toString())
                ).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final List<ProfileItem> items;

  const ProfileInfoCard({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ...items.map((item) => Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      '${item.label}:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item.value,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}

class ProfileItem {
  final String label;
  final String value;

  ProfileItem({required this.label, required this.value});
}