import 'package:flutter/material.dart';
import 'package:loginn/api/apis.dart';
import 'package:loginn/helper/my_date_util.dart';
import 'package:loginn/models/chat_user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loginn/models/message.dart';
import 'package:loginn/screens/chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  String? idKontak;

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    idKontak = pref.getString('id_kontak') ?? '';
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Message? _message;
    final mq = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04, 
      vertical: 1
      ),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: StreamBuilder(
        stream: APIs.getLastMessage(widget.user),
        builder: (context, snapshot) {
          final data = snapshot.data?.docs;
          final list =
              data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
          if (list.isEmpty) {
            return Container();
          }

          _message = list[0];

          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChatScreen(user: widget.user)));
            },
            child: ListTile(
              //user profile picture
              leading: InkWell(
                onTap: () {
                  // showDialog(
                  // context: context,
                  // builder: (_) => ProfileDialog(user: widget.user));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(mq.height * .03),
                  child: CachedNetworkImage(
                    width: mq.height * .055,
                    height: mq.height * .055,
                    imageUrl: widget.user.image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const CircleAvatar(child: Icon(Icons.person)),
                  ),
                ),
              ),

              //user name
              title: Text(widget.user.name),

              //last message
              subtitle: Text(
                  _message != null
                      ? _message!.type == Type.image
                          ? 'image'
                          : _message!.msg
                      : widget.user.about,
                  maxLines: 1),

              //last message time
              trailing: _message == null
                  ? null //show nothing when no message is sent
                  : _message!.read.isEmpty && _message!.fromId != idKontak
                      ?
                      //show for unread message
                      Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent.shade400,
                              borderRadius: BorderRadius.circular(10)),
                        )
                      :
                      //message sent time
                      Text(
                          MyDateUtil.getLastMessageTime(
                              context: context, time: _message!.sent),
                          style: const TextStyle(color: Colors.black54),
                        ),
            ),
          );
        },
      ),
    );
  }
}
