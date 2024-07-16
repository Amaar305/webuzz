import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/common/entities/user.dart';

class WebuzzUserModel extends WebuzzUser {
  WebuzzUserModel({
    required super.userId,
    required super.email,
    required super.name,
    required super.username,
    required super.lastActive,
    super.bio = 'Hey, \'m using Webuzz!',
    required super.location,
    super.imageUrl,
    super.program,
    super.level,
    super.phone,
    super.lastBook,
    super.adPoint,
    super.isOnline = true,
    super.isStaff = false,
    super.isAdmin = false,
    super.isUndergraduate = false,
    super.notifications = true,
    super.postNotifications = true,
    super.likeNotifications = true,
    super.commentNotifications = true,
    super.saveNotifications = true,
    super.followNotifications = true,
    super.userBlockNotifications = true,
    super.chatMessageNotifications = true,
    super.sponsor = false,
    super.bot = false,
    super.isSuspended = false,
    super.premium = false,
    super.isCompleteness = false,
    super.isClassRep = false,
    super.hasPaid = false,
    super.isVerified = false,
    super.followers = 0,
    super.following = 0,
    super.pushToken,
    required super.createdAt,
    super.directMessagePrivacy = DirectMessagePrivacy.everyone,
    super.onlineStatusIndicator = DirectMessagePrivacy.everyone,
    super.lastUpdatedPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'name': name,
      'username': username,
      'lastActive': lastActive,
      'pushToken': pushToken,
      'bio': bio,
      'location': location,
      'isOnline': isOnline,
      'isStaff': isStaff,
      'isAdmin': isAdmin,
      'isSuspended': isSuspended,
      'notifications': notifications,
      'postNotifications': postNotifications,
      'likeNotifications': likeNotifications,
      'commentNotifications': commentNotifications,
      'saveNotifications': saveNotifications,
      'followNotifications': followNotifications,
      'userBlockNotifications': userBlockNotifications,
      'chatMessageNotifications': chatMessageNotifications,
      'premium': premium,
      'isVerified': isVerified,
      'followers': followers,
      'following': following,
      'createdAt': createdAt,
      'directMessagePrivacy': directMessagePrivacy.name,
      'onlineStatusIndicator': onlineStatusIndicator.name,
      'imageUrl': imageUrl,
      'program': program,
      'level': level,
      'phone': phone,
      'lastUpdatedPassword': lastUpdatedPassword,
      'sponsor': sponsor,
      'bot': bot,
      'isClassRep': isClassRep,
      'isCompleteness': isCompleteness,
      'isUndergraduate': isUndergraduate,
      'hasPaid': hasPaid,
      'lastBook': lastBook,
      'adPoint': adPoint,
    };
  }

  factory WebuzzUserModel.fromMap(Map<String, dynamic> map) {
    DirectMessagePrivacy directMessagePrivacy;
    DirectMessagePrivacy onlineStatusIndicator;

    switch (map['directMessagePrivacy']) {
      case "mutual":
        directMessagePrivacy = DirectMessagePrivacy.mutual;
        break;
      case "following":
        directMessagePrivacy = DirectMessagePrivacy.following;
        break;
      case "followers":
        directMessagePrivacy = DirectMessagePrivacy.followers;
        break;
      case "everyone":
        directMessagePrivacy = DirectMessagePrivacy.everyone;
        break;
      default:
        directMessagePrivacy = DirectMessagePrivacy.unknown;
    }
    switch (map['onlineStatusIndicator']) {
      case "mutual":
        onlineStatusIndicator = DirectMessagePrivacy.mutual;
        break;
      case "following":
        onlineStatusIndicator = DirectMessagePrivacy.following;
        break;
      case "followers":
        onlineStatusIndicator = DirectMessagePrivacy.followers;
        break;
      case "everyone":
        onlineStatusIndicator = DirectMessagePrivacy.everyone;
        break;
      default:
        onlineStatusIndicator = DirectMessagePrivacy.unknown;
    }

    return WebuzzUserModel(
      userId: map['userId'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      isOnline: map['isOnline'] as bool,
      isStaff: map['isStaff'] as bool,
      isAdmin: map['isAdmin'] as bool,
      notifications: map['notifications'] as bool,
      createdAt: map['createdAt'] as Timestamp,
      pushToken: map['pushToken'] as String,
      bio: map['bio'] as String,
      imageUrl: map['imageUrl'] as String?,
      program: map['program'] as String?,
      level: map['level'] as String?,
      name: map['name'] as String,
      lastUpdatedPassword: map['lastUpdatedPassword'] as Timestamp?,
      lastActive: map['lastActive'] as String,
      phone: map['phone'] as String?,
      location: map['location'] as String,
      isCompleteness: map['isCompleteness'] as bool,
      premium: map['premium'] as bool,
      isVerified: map['isVerified'] as bool,
      followers: map['followers'] as int,
      following: map['following'] as int,
      directMessagePrivacy: directMessagePrivacy,
      onlineStatusIndicator: onlineStatusIndicator,
      chatMessageNotifications: map['chatMessageNotifications'] as bool,
      commentNotifications: map['commentNotifications'] as bool,
      followNotifications: map['followNotifications'] as bool,
      isSuspended: map['isSuspended'] as bool,
      likeNotifications: map['likeNotifications'] as bool,
      postNotifications: map['postNotifications'] as bool,
      saveNotifications: map['saveNotifications'] as bool,
      userBlockNotifications: map['userBlockNotifications'] as bool,
      bot: map['bot'] as bool,
      hasPaid: map['hasPaid'] as bool,
      sponsor: map['sponsor'] as bool,
      isClassRep: map['isClassRep'] as bool,
      isUndergraduate: map['isUndergraduate'] as bool,
      lastBook: map['lastBook'] as String?,
      adPoint: map['adPoint'] as int?,
    );
  }

  
  factory WebuzzUserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WebuzzUserModel.fromMap(data);
  }




}
