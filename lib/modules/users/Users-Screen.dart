import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';
import '../../models/user/user_model.dart';

class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(name: 'momen magdy', id: 2, phone: '+201554641125'),
    UserModel(name: 'Assel Yasser', id: 3, phone: '+20102323383'),
    UserModel(name: 'momen magdy', id: 2, phone: '+201554641125'),
    UserModel(name: 'Assel Yasser', id: 3, phone: '+20102323383'),
    UserModel(name: 'momen magdy', id: 2, phone: '+201554641125'),
    UserModel(name: 'Assel Yasser', id: 3, phone: '+20102323383'),
    UserModel(name: 'momen magdy', id: 2, phone: '+201554641125'),
    UserModel(name: 'Assel Yasser', id: 3, phone: '+20102323383'),
    UserModel(name: 'momen magdy', id: 2, phone: '+201554641125'),
    UserModel(name: 'Assel Yasser', id: 3, phone: '+20102323383'),
    UserModel(name: 'momen magdy', id: 2, phone: '+201554641125'),
    UserModel(name: 'Assel Yasser', id: 3, phone: '+20102323383'),
    UserModel(name: 'momen magdy', id: 2, phone: '+201554641125'),
    UserModel(name: 'Assel Yasser', id: 3, phone: '+20102323383'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'USERS'
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => BuildUsersItem(users[index]),
          separatorBuilder: (context,index) => MyDivider(),
          itemCount: users.length, ),
    );
  }

  Widget BuildUsersItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight:FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              Text(
                '${user.phone}',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
