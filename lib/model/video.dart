class Video {
  String? title;
  String? description;
  String? thumbnail;
  String? publishedDate;

  Video.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    publishedDate = json['publishedAt'];
    thumbnail = json['thumbnails'].isNotEmpty
        ? json['thumbnails']['maxres'] == null
            ? json['thumbnails']['high']['url']
            : json['thumbnails']['maxres']['url']
        : 'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U';
  }
}
