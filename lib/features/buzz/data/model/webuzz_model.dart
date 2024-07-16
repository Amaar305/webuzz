import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/webuzz.dart';

class WebuzzModel extends Webuzz {
  WebuzzModel({
    required super.id,
    required super.docId,
    required super.authorId,
    required super.originalId,
    required super.content,
    required super.location,
    required super.source,
    required super.buzzType,
    required super.createdAt,
    required super.hashtags,
    required super.links,
    super.reportCount = 0,
    super.likesCount = 0,
    super.repliesCount = 0,
    super.reBuzzsCount = 0,
    super.duration = 0,
    super.isRebuzz = false,
    super.isSuspended = false,
    super.isSponsor = false,
    super.hasPaid = false,
    super.expired = false,
    super.isPublished = true,
    super.amount,
    super.imageUrl,
    super.whatsapp,
    super.websiteUrl,
    super.videoUrl,
    super.images,
    super.refrence,
  });

  // Create a method for encoding to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'docId': docId,
      'authorId': authorId,
      'content': content,
      'location': location,
      'source': source,
      'reBuzzsCount': reBuzzsCount,
      'createdAt': createdAt,
      'buzzType': buzzType,
      'hashtags': hashtags,
      'originalId': originalId,
      'rebuzz': isRebuzz,
      'likesCount': likesCount,
      'repliesCount': repliesCount,
      'imageUrl': imageUrl,
      "isPublished": isPublished,
      "isSuspended": isSuspended,
      "isSponsor": isSponsor,
      "links": links,
      "images": images,
      "amount": amount,
      "duration": duration,
      "hasPaid": hasPaid,
      "websiteUrl": websiteUrl,
      "whatsapp": whatsapp,
      "videoUrl": videoUrl,
      "expired": expired,
      "reportCount": reportCount,
    };
  }

  // Create a factory constructor for decoding from JSON
  factory WebuzzModel.fromJson(
    Map<String, dynamic> json,
    String docId,
    DocumentReference refrence,
  ) {
    return WebuzzModel(
      id: json['id'],
      docId: docId,
      authorId: json['authorId'],
      originalId: json['originalId'],
      content: json['content'],
      location: json['location'],
      source: json['source'],
      createdAt: json['createdAt'],
      buzzType: json['buzzType'],
      hashtags: List<String>.from(json['hashtags']),
      imageUrl: json['imageUrl'],
      isRebuzz: json['rebuzz'],
      reBuzzsCount: json['reBuzzsCount'],
      likesCount: json['likesCount'],
      repliesCount: json['repliesCount'],
      isPublished: json['isPublished'],
      isSuspended: json['isSuspended'],
      refrence: refrence,
      isSponsor: json['isSponsor'] as bool,
      links: List<String>.from(json['links']),
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      amount: json['amount'],
      duration: json['duration'],
      expired: json['expired'],
      hasPaid: json['hasPaid'],
      websiteUrl: json['websiteUrl'],
      whatsapp: json['whatsapp'],
      videoUrl: json['videoUrl'],
      reportCount: json['reportCount'],
    );
  }

  // Create a factory constructor for decoding from DocumentSnapshot
  factory WebuzzModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['docId'] = doc.id;
    final refrence = doc.reference;
    return WebuzzModel.fromJson(data, doc.id, refrence);
  }

  bool validSponsor() {
    DateTime currentDate = DateTime.now();
    bool isValid = false;

    if (hasPaid && isSponsor) {
      DateTime sponsorEndDate =
          createdAt.toDate().add(Duration(days: duration! * 7));

      if (sponsorEndDate.isAfter(currentDate)) {
        isValid = true;
      } else {
        // Sponsorship has expired, update the 'expired' field
        expired = true;
        _updateExpiredStatusInFirestore(docId);
      }
    }

    return isValid;
  }

  void _updateExpiredStatusInFirestore(String docId) {}

  WebuzzModel copyWith({
    String? id,
    String? docId,
    String? authorId,
    String? originalId,
    String? content,
    String? location,
    String? source,
    String? buzzType,
    int? reBuzzsCount,
    int? likesCount,
    int? repliesCount,
    int? reportCount,
    int? duration,
    Timestamp? createdAt,
    List<String>? hashtags,
    List<String>? links,
    bool? isRebuzz,
    bool? isSuspended,
    bool? isSponsor,
    bool? expired,
    bool? hasPaid,
    bool? isPublished,
    double? amount,
    String? imageUrl,
    String? whatsapp,
    String? websiteUrl,
    String? videoUrl,
    List<String>? images,
    DocumentReference? refrence,
  }) {
    return WebuzzModel(
      id: id ?? this.id,
      docId: docId ?? this.docId,
      authorId: authorId ?? this.authorId,
      originalId: originalId ?? this.originalId,
      content: content ?? this.content,
      location: location ?? this.location,
      source: source ?? this.source,
      buzzType: buzzType ?? this.buzzType,
      reBuzzsCount: reBuzzsCount ?? this.reBuzzsCount,
      likesCount: likesCount ?? this.likesCount,
      repliesCount: repliesCount ?? this.repliesCount,
      reportCount: reportCount ?? this.reportCount,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
      hashtags: hashtags ?? this.hashtags,
      links: links ?? this.links,
      isRebuzz: isRebuzz ?? this.isRebuzz,
      isSuspended: isSuspended ?? this.isSuspended,
      isSponsor: isSponsor ?? this.isSponsor,
      expired: expired ?? this.expired,
      hasPaid: hasPaid ?? this.hasPaid,
      isPublished: isPublished ?? this.isPublished,
      amount: amount ?? this.amount,
      imageUrl: imageUrl ?? this.imageUrl,
      whatsapp: whatsapp ?? this.whatsapp,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      images: images ?? this.images,
      refrence: refrence ?? this.refrence,
    );
  }
}
