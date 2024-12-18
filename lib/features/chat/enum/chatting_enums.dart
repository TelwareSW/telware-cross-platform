import 'package:hive/hive.dart';

part 'chatting_enums.g.dart';

enum EventType {
  sendMessage(event: 'SEND_MESSAGE'),
  pinMessageClient(event: 'PIN_MESSAGE_CLIENT'),
  unpinMessageClient(event: 'UNPIN_MESSAGE_CLIENT'),
  pinMessageServer(event: 'PIN_MESSAGE_SERVER'),
  unpinMessageServer(event: 'UNPIN_MESSAGE_SERVER'),
  sendAnnouncement(event: 'SEND_ANNOUNCEMENT'),
  updateDraft(event: 'UPDATE_DRAFT'),
  editMessageClient(event: 'EDIT_MESSAGE_CLIENT'),
  editMessageServer(event: 'EDIT_MESSAGE_SERVER'),
  deleteMessageClient(event: 'DELETE_MESSAGE_CLIENT'),
  deleteMessageServer(event: 'DELETE_MESSAGE_SERVER'),
  replyOnMessage(event: 'REPLY_MESSAGE'),
  forwardMessage(event: 'FORWARD_MESSAGE'),
  readChat(event: 'READ_CHAT'),
  //////////////////////////////
  receiveMessage(event: 'RECEIVE_MESSAGE'),
  receiveReply(event: 'RECEIVE_REPLY'),
  ;

  final String event;

  const EventType({required this.event});
}

@HiveType(typeId: 5)
enum ChatType {
  @HiveField(0)
  private(type: 'private'),
  @HiveField(1)
  group(type: 'group'),
  @HiveField(2)
  channel(type: 'channel');

  static ChatType getType(String type) {
    switch (type) {
      case 'group':
        return ChatType.group;
      case 'channel':
        return ChatType.channel;
      default:
        return ChatType.private;
    }
  }

  final String type;
  const ChatType({required this.type});
}