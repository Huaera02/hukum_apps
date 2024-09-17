import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginn/api/apis.dart';
import 'package:loginn/helper/my_date_util.dart';
import 'package:loginn/models/chat_user.dart';
import 'package:loginn/models/message.dart';
import 'package:loginn/widgets/message_card.dart';
import 'package:loginn/global_colors.dart';
// import 'package:loginn/global_colors.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> _list = [];

  //for handling message text changes
  final _textController = TextEditingController();

  //showEmoji -- for storing value of showing or hiding emoji
  //isUploading -- for checking if image is uploading or not?
  // bool _showEmoji = false, 
  bool _isUploading = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: _appBar(),
      ),
      // backgroundColor: const Color.fromARGB(255, 248, 213, 210),
      body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: APIs.getAllMessages(widget.user),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        //if data is loading
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return const SizedBox();
                          //  return const Center(
                          //   child: CircularProgressIndicator(),
                          //  );

                        //if some or all data is loaded then show it
                        case ConnectionState.active:
                        case ConnectionState.done:
                          final data = snapshot.data?.docs;
                          // log('Data: ${data![0].data()}')
                          _list = data
                                  ?.map((e) => Message.fromJson(e.data()))
                                  .toList() ??
                              [];

                          if (_list.isNotEmpty) {
                            return ListView.builder(
                                reverse: true,
                                itemCount: _list.length,
                                padding: EdgeInsets.only(top: mq.height * .01),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  // return Text('Message: ${_list[index]}');
                                  return MessageCard(
                                    idKontak: APIs.me.id,
                                    message: _list[index]
                                    );
                                });
                          } else {
                            return const Center(
                              child: Text('Say Hii! 👋',
                                  style: TextStyle(fontSize: 20)),
                            );
                          }
                      }
                    },
                  ),
                ),

                //progress indicator for showing uploading
                if (_isUploading)
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          child: CircularProgressIndicator(strokeWidth: 2))),

                //chat input filed
                _chatInput(),
              ],
            ),
      ),
    );
  }

  // app bar widget
  Widget _appBar() {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (_) => ViewProfileScreen(user: widget.user)));
          },
          child: StreamBuilder(
              stream: APIs.getUserInfo(widget.user),
              builder: (context, snapshot) {
                final data = snapshot.data?.docs;
                final list =
                    data?.map((e) => ChatUser.fromJson(e.data())).toList() ??
                        [];

                return Row(
                  children: [
                    //back button
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black54)),

                    //user profile picture
                    ClipRRect(
                      borderRadius: BorderRadius.circular(mq.height * .03),
                      child: CachedNetworkImage(
                        width: mq.height * .05,
                        height: mq.height * .05,
                        fit: BoxFit.cover,
                        imageUrl:
                            list.isNotEmpty ? list[0].image : widget.user.image,
                        errorWidget: (context, url, error) =>
                            const CircleAvatar(
                                child: Icon(Icons.person)),
                      ),
                    ),

                    //for adding some space
                    const SizedBox(width: 10),

                    //user name & last seen time
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //user name
                        Text(list.isNotEmpty ? list[0].name : widget.user.name,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500)),

                        //for adding some space
                        const SizedBox(height: 2),

                        //last seen time of user
                        Text(
                          list.isNotEmpty ? 
                          list[0].isOnline ? 'Online'
                          :MyDateUtil.getLastActiveTime(context: context, lastActive: list[0].lastActive)
                          :MyDateUtil.getLastActiveTime(context: context, lastActive: widget.user.lastActive),
                            // list.isNotEmpty
                            //     ? list[0].isOnline
                            //         ? 'Online'
                            //         : MyDateUtil.getLastActiveTime(
                            //             context: context,
                            //             lastActive: list[0].lastActive)
                            //     : MyDateUtil.getLastActiveTime(
                            //         context: context,
                            //         lastActive: widget.user.lastActive),
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54)),
                      ],
                    )
                  ],
                );
              })),
    );
  }

    // bottom chat input field
  Widget _chatInput() {
     final mq = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: mq.height * .01, horizontal: mq.width * .025),
      child: Row(
        children: [
          //input field & buttons
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  //emoji button
                  // IconButton(
                  //     onPressed: () {
                        // FocusScope.of(context).unfocus();
                        // setState(() => _showEmoji = !_showEmoji);
                      // },
                      // icon: const Icon(Icons.emoji_emotions,
                      //     color: Colors.blueAccent, size: 25)),

                  // Expanded(
                  //     child: TextField(
                  //   controller: _textController,
                  //   keyboardType: TextInputType.multiline,
                  //   maxLines: null,
                  //   // onTap: () {
                  //   //   if (_showEmoji) setState(() => _showEmoji = !_showEmoji);
                  //   // },
                  //   decoration: InputDecoration(
                  //       hintText: 'Type Something...',
                  //       hintStyle: TextStyle(color: GlobalColors.mainColor),
                  //       border: InputBorder.none),
                  // )
                  // ),

                  //pick image from gallery button
                  // IconButton(
                  //     onPressed: () async {
                  //       final ImagePicker picker = ImagePicker();

                  //       // Picking multiple images
                  //       final List<XFile> images =
                  //           await picker.pickMultiImage(imageQuality: 70);

                  //       // uploading & sending image one by one
                  //       for (var i in images) {
                  //         log('Image Path: ${i.path}');
                  //         setState(() => _isUploading = true);
                  //         await APIs.sendChatImage(widget.user, File(i.path));
                  //         setState(() => _isUploading = false);
                  //       }
                  //     },
                  //     // icon: Icon(Icons.image,
                  //     //     color: GlobalColors.mainColor, size: 26)
                  //   ),

                  //take image from camera button
                  // IconButton(
                  //     onPressed: () async {
                  //       final ImagePicker picker = ImagePicker();

                  //       // Pick an image
                  //       final XFile? image = await picker.pickImage(
                  //           source: ImageSource.camera, imageQuality: 70);
                  //       if (image != null) {
                  //         log('Image Path: ${image.path}');
                  //         setState(() => _isUploading = true);

                  //         await APIs.sendChatImage(
                  //             widget.user, File(image.path));
                  //         setState(() => _isUploading = false);
                  //       }
                  //     },
                  //     icon: Icon(Icons.camera_alt_rounded,
                  //         color: GlobalColors.mainColor, size: 26)),

                  //adding some space
                  SizedBox(width: mq.width * .02),
                ],
              ),
            ),
          ),

          //send message button
          MaterialButton(
            onPressed: () {             
              if (_textController.text.isNotEmpty) {
                if (_list.isEmpty) {
                  //on first message (add user to my_user collection of chat user)
                  APIs.sendMessage(
                      widget.user.id, _textController.text, Type.text);
                } 
                else {
                  //simply send message
                  APIs.sendMessage(
                      widget.user.id, _textController.text, Type.text);
                }
                _textController.text = '';
              }
            },
            minWidth: 0,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
            shape: const CircleBorder(),
            // color: GlobalColors.mainColor,
            // child: const Icon(Icons.send, color: Colors.white, size: 28),
          )
        ],
      ),
    );
  }
}