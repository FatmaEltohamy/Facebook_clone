import 'package:facebook/data/models/export_all_models.dart';
import 'package:facebook/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<User?> users;

  const ContactList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.search,color: Colors.grey[600],),
              SizedBox(width: 8.0,),
              Icon(Icons.more_horiz,color: Colors.grey[600],),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              itemCount: users.length,
              itemBuilder: (BuildContext context,int index){
                final User? user =users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(currentUser: user!),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
