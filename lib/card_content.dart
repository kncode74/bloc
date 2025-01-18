import 'package:flutter/material.dart';
import 'package:state_bloc/data/user_response.dart';
import 'package:state_bloc/to_do_list/user_list_bloc.dart';

class CardContent extends StatelessWidget {
  final UserResponse user;
  final Function() onDelete;

  const CardContent({
    super.key,
    required this.user,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _imageContent(),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  user.notes,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              onDelete.call();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  Widget _imageContent() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        user.imageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.error,
            size: 50,
          ); // Default icon in case image fails to load
        },
      ),
    );
  }
}
