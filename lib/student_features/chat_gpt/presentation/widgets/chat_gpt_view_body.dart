import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../view_model/chat_cubit.dart';
import 'custom_message.dart';

class ChatGPTViewBody extends StatelessWidget {
  ChatGPTViewBody({super.key});

  final TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: BlocBuilder<ChatCubit, List<CustomMessage>>(
            builder: (context, messages) {
              if (messages.isEmpty) {
                return Lottie.asset(
                  "assets/animation/chatGPT.json",
                  width: 250.w,
                  repeat: true,
                  frameRate: FrameRate.max,
                );
              }
              return ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    child: CustomMessage(
                      isUser: message.isUser,
                      message: message.message,
                      date: DateFormat('hh:mm')
                          .format(DateTime.parse(message.date)),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.right,
                  cursorColor: kPrimaryColor,
                  cursorRadius: Radius.circular(10.r),
                  cursorHeight: 30.h,
                  maxLines: null,
                  controller: chatController,
                  decoration: const InputDecoration(
                    hintText: "ChatGPT تحدث مع",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              IconButton(
                onPressed: () {
                  if (chatController.text.isNotEmpty) {
                    context
                        .read<ChatCubit>()
                        .addMessage(chatController.text, true);
                    chatController.clear();
                  } else {
                    warningCherryToast(
                        context, 'تحذير', "من فضلك قم بكتابة سوال");
                  }
                },
                icon: const Icon(Icons.send_rounded, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  fixedSize: Size.fromRadius(23.r),
                  padding: EdgeInsets.only(left: 5.w),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
