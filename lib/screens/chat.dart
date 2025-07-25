import 'package:ekotrack/components/chat_bubble.dart';
import 'package:ekotrack/components/custom_app_bar.dart';
import 'package:ekotrack/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<ChatBubble> chat = [];

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  bool responded = true;
  bool typing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "EcoEmissions",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [
                if (chat.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "There are no messages in the chat yet",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: kDarkGreen,
                      ),
                    ),
                  )
                else
                  ...chat,
                if (typing)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "Waiting for an answer...",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controller,
                onSubmitted: _sendMessage,
                decoration: InputDecoration(
                  fillColor: kLightGreen4,
                  hintText: 'Write your question here',
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(value) {
    if (responded) {
      setState(() {
        controller.clear();
        chat.add(ChatBubble(
          text: value,
          type: ChatBubbleType.chatBubbleAvatarOnRight,
        ));
      });
      if (chat.length > 3) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 150,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
        );
      }

      askChatGpt(value);
    }
  }

  void askChatGpt(String value) {
    setState(() {
      typing = true;
      responded = false;
    });
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          typing = false;
        });
        chat.add(
          ChatBubble(
            text: "This should be a response from CarbonGPT.",
            type: ChatBubbleType.chatBubbleAvatarOnLeft,
            hasQuickQuestions: true,
            onQuickQuestionTap: _sendMessage,
          ),
        );
        setState(() {
          responded = true;
          if (chat.length > 3) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent + 350,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
            );
          }
        });
      },
    );
  }
}
