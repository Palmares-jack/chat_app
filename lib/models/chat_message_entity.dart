class ChatMessageEntity {
  final String text;
  final String? imageUrl;
  final String id;
  final int createdAt;
  final Author author;

  ChatMessageEntity({
    required this.text,
    required this.id,
    required this.createdAt,
    this.imageUrl,
    required this.author,
  });

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      text: json['text'],
      id: json['id'],
      createdAt: json['createdAt'],
      imageUrl: json['image'], // Adjust if JSON uses a different key
      author: Author.fromJson(json['author']),
    );
  }
}

class Author {
  final String userName;

  Author({required this.userName});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(userName: json['username']);
  }
}
