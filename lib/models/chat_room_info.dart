class ChatRoomInfo {
  final String title;
  final String imgUrl;
  final lastMessage;
  final lastModified;

  ChatRoomInfo({this.title, this.imgUrl, this.lastMessage, this.lastModified});

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'imgUrl': this.imgUrl,
      'lastMessage': this.lastMessage,
      'lastModified': this.lastModified,
    };
  }
}