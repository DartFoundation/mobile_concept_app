import 'package:flutter/material.dart';

class ChatMenu extends StatelessWidget {
  final String title;
  final String avatar;
  const ChatMenu({
    super.key,
    required this.title,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(avatar),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Color(0xFF36383D))),
                const Text('mein Status steht hier.', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFA2A9B7))),
              ],
            ),
          ],
        ),
      ),

      // body part started

      body: EnterText(),

      //  the body part is over
    );
  }
}

class EnterText extends StatefulWidget {
  const EnterText({super.key});

  @override
  State<EnterText> createState() => _EnterTextState();
}

class _EnterTextState extends State<EnterText> {
  TextEditingController controllerFirstText = TextEditingController();
  List user = [];
  bool isSend = false;

  Widget card(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: user[index]['isSend'] ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 20.0, top: 17.0),
          child: Image.asset('images/senna.png', height: 45, fit: BoxFit.fill),
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(color: Color(0xFFE2E9F6), borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0))),
                  child: Text(user[index]['message'], style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFF36383D))),
                ),
                const Icon(Icons.done_all, color: Color(0xFF36383D))
              ],
            ),
            const Text('13:37 Uhr', style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400, color: Color(0xFFA2A9B7))),
          ],
        ),
      ],
    );
  }

  void func() {
    setState(() {
      if (controllerFirstText.text != '') {
        if (isSend) {
          user.add({'message': controllerFirstText.text, 'isSend': true});
          controllerFirstText.clear();
          isSend = false;
        } else {
          user.add({'message': controllerFirstText.text, 'isSend': false});
          controllerFirstText.clear();
          isSend = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // the chat session has started

        // Expanded(child: ListView.separated(itemCount: user.length, separatorBuilder: seperator, itemBuilder: card)),
        Expanded(child: ListView.builder(itemCount: user.length, itemBuilder: card)),
        // the chat session is over

        // the input part has started

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 73.0,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ]),
              child: Row(
                children: [
                  SizedBox(
                    width: 240.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: controllerFirstText,
                        autofocus: true,
                        decoration: const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  const Icon(Icons.mood, color: Color(0xFFDCE3EF)),
                  const Padding(
                    padding: EdgeInsets.only(right: 25.0, left: 10.0),
                    child: Icon(Icons.photo_library, color: Color(0xFFDCE3EF)),
                  ),
                  IconButton(onPressed: func, icon: const Icon(Icons.send, color: Color(0xFF36383D))),
                ],
              ),
            ),
          ],
        ),

        // the text input part is finished
      ],
    );
  }
}
