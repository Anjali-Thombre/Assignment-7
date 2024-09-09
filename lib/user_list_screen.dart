import 'package:flutter/material.dart';
import 'user_model.dart';
import 'user_service.dart';

class UserListScreen extends StatelessWidget {
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder<List<User>>(
        future: userService.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.profilePicture),
                    radius: 30, // Circular shape with radius
                  ),
                  title: Text(user.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${user.email}'),
                      Text('Contact: ${user.contactNumber}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
