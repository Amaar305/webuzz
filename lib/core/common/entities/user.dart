import 'package:cloud_firestore/cloud_firestore.dart';

class WebuzzUser {
  final String userId;
  final String email;
  final String name;
  final String username;
  final String lastActive;
  final String bio;
  final String location;

  final String? imageUrl;
  final String? program;
  final String? level;
  final String? phone;
  final String? lastBook;

  late String pushToken;
  final int? adPoint;

  final bool isOnline;
  final bool isStaff;
  final bool isAdmin;
  final bool isSuspended;
  final bool isUndergraduate;
  final bool notifications;
  final bool postNotifications;
  final bool likeNotifications;
  final bool commentNotifications;
  final bool saveNotifications;
  final bool followNotifications;
  final bool userBlockNotifications;
  final bool chatMessageNotifications;
  final bool sponsor;
  final bool bot;
  final bool premium;
  final bool isCompleteness;
  final bool isClassRep;
  final bool hasPaid;
  final bool isVerified;

  final int followers;
  final int following;

  final Timestamp createdAt;
  final Timestamp? lastUpdatedPassword;

  final DirectMessagePrivacy directMessagePrivacy;
  final DirectMessagePrivacy onlineStatusIndicator;

  WebuzzUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.username,
    required this.lastActive,
    required this.bio,
    required this.location,
    this.imageUrl,
    this.program,
    this.level,
    this.phone,
    this.lastBook,
    this.adPoint,
    this.pushToken = '',
    required this.isOnline,
    required this.isStaff,
    required this.isAdmin,
    required this.isSuspended,
    required this.isUndergraduate,
    required this.notifications,
    required this.postNotifications,
    required this.likeNotifications,
    required this.commentNotifications,
    required this.saveNotifications,
    required this.followNotifications,
    required this.userBlockNotifications,
    required this.chatMessageNotifications,
    required this.sponsor,
    required this.bot,
    required this.premium,
    required this.isCompleteness,
    required this.isClassRep,
    required this.hasPaid,
    required this.isVerified,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.lastUpdatedPassword,
    required this.directMessagePrivacy,
    required this.onlineStatusIndicator,
  });
}

enum DirectMessagePrivacy {
  everyone,
  followers,
  following,
  mutual,
  unknown,
}
