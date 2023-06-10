

class Hash {
  final String titile;

  Hash({required this.titile});
}

class BlogModel {
  final int id;
  final String imageUrl;
  final String title;

  final String writer;
  final String writerImageUrl;
  final String date;
  final String content;
  final String views;

  BlogModel(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.writer,
      required this.writerImageUrl,
      required this.date,
      required this.content,
      required this.views});
}
