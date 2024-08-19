import 'package:flutter/material.dart';
import 'package:loginn/global_colors.dart';

class IsiPesanView extends StatefulWidget {
  const IsiPesanView({super.key});

  @override
  State<IsiPesanView> createState() => _IsiPesanViewState();
}

class _IsiPesanViewState extends State<IsiPesanView> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: _appBar(),
      ),
      backgroundColor: const Color.fromARGB(255, 248, 213, 210),
      body: SafeArea(
            child: Column(
              children: [
                const Expanded(
                  child: 
                    Center(
                    child: Text('Say Hii! 👋',
                    style: TextStyle(fontSize: 20)),
                    )                                                      
                ),               
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
          onTap: () {},
          child: Row(
                  children: [
                    //back button
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black54)),

                    //user profile picture
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/images/Nur.png',
                      width: 50,
                      height: 50,),                      
                    ),

                    //for adding some space
                    const SizedBox(width: 10),

                    //user name & last seen time
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //user name
                        Text('Nurmiati',
                          // list.isNotEmpty ? list[0].name : widget.user.name,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500)),

                        //for adding some space
                        SizedBox(height: 2),

                        //last seen time of user
                       Text('Online',                            
                            style: TextStyle(
                                fontSize: 13, color: Colors.black54)),
                      ],
                    )
                  ],
                )
              
              ),
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

                  Expanded(
                      child: TextField(
                    // controller: _textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    // onTap: () {
                    //   if (_showEmoji) setState(() => _showEmoji = !_showEmoji);
                    // },
                    decoration: InputDecoration(
                        hintText: 'Type Something...',
                        hintStyle: TextStyle(color: GlobalColors.mainColor),
                        border: InputBorder.none),
                  )),

                  //pick image from gallery button
                  IconButton(
                      onPressed: () {
                        // final ImagePicker picker = ImagePicker();

                        // // Picking multiple images
                        // final List<XFile> images =
                        //     await picker.pickMultiImage(imageQuality: 70);

                        // // uploading & sending image one by one
                        // for (var i in images) {
                        //   log('Image Path: ${i.path}');
                        //   setState(() => _isUploading = true);
                        //   await APIs.sendChatImage(widget.user, File(i.path));
                        //   setState(() => _isUploading = false);
                        // }
                      },
                      icon: Icon(Icons.image,
                          color: GlobalColors.mainColor, size: 26)),

                  //take image from camera button
                  IconButton(
                      onPressed: () {
                        // final ImagePicker picker = ImagePicker();

                        // // Pick an image
                        // final XFile? image = await picker.pickImage(
                        //     source: ImageSource.camera, imageQuality: 70);
                        // if (image != null) {
                        //   log('Image Path: ${image.path}');
                        //   setState(() => _isUploading = true);

                        //   await APIs.sendChatImage(
                        //       widget.user, File(image.path));
                        //   setState(() => _isUploading = false);
                        // }
                      },
                      icon: Icon(Icons.camera_alt_rounded,
                          color: GlobalColors.mainColor, size: 26)),

                  //adding some space
                  SizedBox(width: mq.width * .02),
                ],
              ),
            ),
          ),

          //send message button
          MaterialButton(
            onPressed: () {             
              // if (_textController.text.isNotEmpty) {
              //   if (_list.isEmpty) {
              //     //on first message (add user to my_user collection of chat user)
              //     APIs.sendMessage(
              //         widget.user, _textController.text, Type.text);
              //   } 
              //   else {
              //     //simply send message
              //     APIs.sendMessage(
              //         widget.user, _textController.text, Type.text);
              //   }
              //   _textController.text = '';
              // }
            },
            minWidth: 0,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
            shape: const CircleBorder(),
            color: GlobalColors.mainColor,
            child: const Icon(Icons.send, color: Colors.white, size: 28),
          )
        ],
      ),
    );
  }
}