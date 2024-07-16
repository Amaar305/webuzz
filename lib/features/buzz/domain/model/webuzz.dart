// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Webuzz {
  final String id;
  final String docId;
  final String authorId;
  final String originalId;
  final String content;
  final String location;
  final String source;
  final String buzzType;
  final int reBuzzsCount;
  final int likesCount;
  final int repliesCount;
  final int reportCount;
  final int? duration;
  final Timestamp createdAt;
  final List<String> hashtags;
  final List<String> links;
  final bool isRebuzz;
  final bool isSuspended;
  final bool isSponsor;
  late bool expired;
  final bool hasPaid;
  final bool isPublished;
  final double? amount;
  final String? imageUrl;
  final String? whatsapp;
  final String? websiteUrl;
  final String? videoUrl;
  final List<String>? images;
  final DocumentReference? refrence;

  Webuzz({
    required this.id,
    required this.docId,
    required this.authorId,
    required this.originalId,
    required this.content,
    required this.location,
    required this.source,
    required this.buzzType,
    required this.reBuzzsCount,
    required this.likesCount,
    required this.repliesCount,
    required this.reportCount,
    required this.duration,
    required this.createdAt,
    required this.hashtags,
    required this.links,
    required this.isRebuzz,
    required this.isSuspended,
    required this.isSponsor,
    required this.hasPaid,
    required this.isPublished,
    required this.amount,
    required this.imageUrl,
    required this.whatsapp,
    required this.websiteUrl,
    required this.videoUrl,
    required this.images,
    required this.refrence,
    required this.expired,
  });
}
enum BuzzType {
  original,
  rebuzz,
  reply,
  qoute,
  sponsor,
}
