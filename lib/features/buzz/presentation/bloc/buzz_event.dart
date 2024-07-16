part of 'buzz_bloc.dart';

@immutable
sealed class BuzzEvent {}

final class BuzzUpload extends BuzzEvent {
  final File? image;
  final String authorId;
  final String content;
  final String location;
  final String buzzType;
  final List<String> hashtags;
  final List<String> links;

  BuzzUpload({
    this.image,
    required this.authorId,
    required this.content,
    required this.location,
    required this.buzzType,
    required this.hashtags,
    required this.links,
  });
}
