import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:telware_cross_platform/features/chat/enum/message_enums.dart';
import 'package:telware_cross_platform/features/chat/view_model/chatting_controller.dart';

class DeletePopUpMenu extends ConsumerWidget {
  final String chatId;
  final String messageId;
  final bool isUsingMsgLocalId;
  const DeletePopUpMenu(
      {super.key,
      required this.chatId,
      required this.messageId,
      this.isUsingMsgLocalId = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text("Confirm Deletion"),
      content: const Text("Are you sure you want to delete this Message?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            ref.read(chattingControllerProvider).deleteMsg(
                messageId, chatId, DeleteMessageType.all,
                isUsingMsgLocalId: isUsingMsgLocalId);
            Navigator.pop(context);
          },
          child: const Text(
            "Delete",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

Future<void> showDeleteMessageAlert(
    {required BuildContext context,
    required String msgId,
    required String chatId,
    bool isUsingMsgLocalId = false}) {
  /// the msgId could be the id or the local id, whichever is available
  return showDialog<void>(
    context: context,
    builder: (context) {
      return DeletePopUpMenu(
        chatId: chatId,
        messageId: msgId,
        isUsingMsgLocalId: isUsingMsgLocalId,
      );
    },
  );
}
