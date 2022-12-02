import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:i_share/search_post/user.dart';
import 'package:i_share/search_post/users_specific_posts.dart';

class UserDesignWidget extends StatefulWidget {
  Users? model;
  BuildContext? context;

  UserDesignWidget({
    this.model,
    this.context,
  });

  @override
  State<UserDesignWidget> createState() => _UserDesignWidgetState();
}

class _UserDesignWidgetState extends State<UserDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => UsersSpecificPostsScreen(
                      userId: widget.model!.id,
                      userName: widget.model!.name,
                    )));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  minRadius: 80.0,
                  backgroundImage: NetworkImage(
                    widget.model!.userImage!,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.model!.name!,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontFamily: "Bebas",
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.model!.email!,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
