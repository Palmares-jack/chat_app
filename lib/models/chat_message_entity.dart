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
}

class Author {
  final String userName;

  Author({required this.userName});
}
