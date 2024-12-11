import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/chats/api/apis.dart';
import 'package:loginn/chats/models/chat_user.dart';
import 'package:loginn/chats/widgets/chat_user_card.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser> _list = [];

  // for storing searched items
  final List<ChatUser> _searchList = [];
  // for storing search status
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();

    APIs.updateActiveStatus(true);

    //for updating user active status according to lifecycle events
    //resume -- active or online
    //pause  -- inactive or offline
    SystemChannels.lifecycle.setMessageHandler((message) async {
      log("Message: $message");

      if (message != null) {
        if (message.contains('resumed')) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          APIs.updateActiveStatus(pref.getBool('is_logged_in') ?? false);
        } else if (message.contains('paused') || message.contains('inactive')) {
          APIs.updateActiveStatus(false);
        } else if (message.contains('detached')) {
          APIs.updateActiveStatus(false);
        }
      }

      // if (message.toString().contains('resumed')) APIs.updateActiveStatus(true);
      // if (message.toString().contains('paused')) APIs.updateActiveStatus(false);
      // if (message.toString().contains('detached')) APIs.updateActiveStatus(false);
      // if (message.toString().contains('pause')) APIs.updateActiveStatus(false);

      // if (APIs.auth.currentUser != null)
      // {
      //   if (message.toString().contains('resumed')) {
      //     APIs.updateActiveStatus(true);
      //   }
      //   if (message.toString().contains('paused')) {
      //     APIs.updateActiveStatus(false);
      //   }
      // }

      return Future.value(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final mq = MediaQuery.of(context).size;
    return GestureDetector(
      //for hiding keyboard when a tap is detected on screen
      onTap: FocusScope.of(context).unfocus,
      child: PopScope(
        //if search is on & back button is pressed then close search
        //or else simple close current screen on back button click
        canPop: !_isSearching,
        onPopInvoked: (_) async {
          if (_isSearching) {
            setState(() => _isSearching = !_isSearching);
          } else {
            Navigator.of(context).pop();
          }
        },

        //
        child: Scaffold(
          //app bar
          appBar: AppBar(
            // leading: const Icon(Icons.home),
            backgroundColor: GlobalColors.mainColor,
            title: _isSearching
                ? TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Name'),
                    autofocus: true,
                    style: const TextStyle(fontSize: 17, letterSpacing: 0.5),
                    //when search text changes then updated search list
                    onChanged: (val) {
                      //search logic
                      _searchList.clear();

                      for (var i in _list) {
                        if (i.name.toLowerCase().contains(val.toLowerCase()) ||
                            i.email.toLowerCase().contains(val.toLowerCase())) {
                          _searchList.add(i);
                          setState(() {
                            _searchList;
                          });
                        }
                      }
                    },
                  )
                : Text(
                    'Chat',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
            actions: [
              //search user button
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  },
                  icon: Icon(_isSearching ? Icons.clear : Icons.search, 
                  color: Colors.white,)),

              //more features button
              // IconButton(
              //     onPressed: () {
              //       // Navigator.push(
              //       //     context,
              //       //     MaterialPageRoute(
              //       //         builder: (_) => ProfileScreen(user: APIs.me)));
              //     },
              //     icon: const Icon(Icons.more_vert))
            ],
          ),

          //body
          body: StreamBuilder(
            stream: APIs.firestore.collection('users').snapshots(),
            // APIs.getMyUsersId(),

            //get id of only known users
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                //if data is loading
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.none:
                  return const Center(child: CircularProgressIndicator());

                //if some or all data is loaded then show it
                case ConnectionState.active:
                case ConnectionState.done:
                  return StreamBuilder(
                    stream: APIs.getAllUsers(APIs.me.id),

                    //get only those user, who's ids are provided
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        //if data is loading
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                        // return const Center(
                        //     child: CircularProgressIndicator());

                        //if some or all data is loaded then show it
                        case ConnectionState.active:
                        case ConnectionState.done:
                          final data = snapshot.data?.docs;
                          _list = data
                                  ?.map((e) => ChatUser.fromJson(e.data()))
                                  .toList() ??
                              [];

                          if (_list.isNotEmpty) {
                            return ListView.builder(
                                itemCount: _isSearching
                                    ? _searchList.length
                                    : _list.length,
                                padding: const EdgeInsets.only(top: 1),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ChatUserCard(
                                      user: _isSearching
                                          ? _searchList[index]
                                          : _list[index]);
                                });
                          } else {
                            return const Center(
                              child: Text('No Connections Found!',
                                  style: TextStyle(fontSize: 20)),
                            );
                          }
                      }
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
