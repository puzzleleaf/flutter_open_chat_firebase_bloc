import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_chat/models/chat_message.dart';
import 'package:open_chat/models/chat_room_info.dart';
import 'package:open_chat/models/user.dart';

class RepositoryService {
  final Firestore _firestore = Firestore.instance;

  Future<User> getUser(String id) async {
    var doc = await _firestore.collection('users').document(id).get();

    if (doc.data != null) {
      return User(
        id: doc.data['id'],
        name: doc.data['name'],
        email: doc.data['email'],
        imgUrl: doc.data['imgUrl'],
      );
    }
    return null;
  }

  Future<void> registerUser(User user) async {
    _firestore.collection('users').document(user.id).setData({
      'id': user.id,
      'email': user.email,
      'name': user.name,
      'imgUrl': user.imgUrl
    });
  }

  Future<void> setChatRoom(ChatRoomInfo chatRoomInfo) async {
    return await _firestore
        .collection('chat_rooms')
        .document(chatRoomInfo.title)
        .setData(chatRoomInfo.toJson());
  }

  Future<DocumentSnapshot> getChatRoom(String title) async {
    return await _firestore.collection('chat_rooms').document(title).get();
  }

  Future<void> updateUserChatList(String id, String title) async {
    var chatListDoc =
        await _firestore.collection('user_chats').document(id).get();
    if (chatListDoc.exists) {
      return chatListDoc.reference.updateData({title: true});
    } else {
      return chatListDoc.reference.setData({title: true});
    }
  }

  Stream<DocumentSnapshot> getChatList(String id) {
    return _firestore.collection('user_chats').document(id).snapshots();
  }

  Stream<QuerySnapshot> getChatMessages(String title) {
    return _firestore
        .collection('chat_rooms')
        .document(title)
        .collection('messages')
        .orderBy('time', descending: false)
        .limit(20)
        .snapshots();
  }

  Stream<QuerySnapshot> getChatRoomInfo(List<String> chatTitles) {
    return _firestore
        .collection('chat_rooms')
        .where('title', whereIn: chatTitles)
        .snapshots();
  }

  Future<void> sendChatMessage(String title, ChatMessage chatMessage) async {
    var reference = _firestore
        .collection('chat_rooms')
        .document(title)
        .collection('messages')
        .document(chatMessage.time);

    return _firestore.runTransaction((transaction) async {
      await transaction.set(reference, {
        'message': chatMessage.message,
        'time': chatMessage.time,
        'senderId': chatMessage.senderId,
      });
    });
  }

  Future<void> setChatRoomLastMessage(
      String title, ChatMessage chatMessage) async {
    var reference = _firestore.collection('chat_rooms').document(title);

    return _firestore.runTransaction((transaction) async {
      await transaction.update(reference, {
        'lastMessage': chatMessage.message,
        'lastModified': chatMessage.time,
      });
    });
  }
}
