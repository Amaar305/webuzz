import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/theme/app_pallete.dart';
import 'profile_numbers_widget.dart';
import 'user_avatar.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.27,
      floating: false,
      pinned: false,
      titleSpacing: 0,
      backgroundColor: AppPallete.kTransparentColour,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image and username
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // user image
                    UserAvatar(
                      imageUrl: 'assets/images/OIP.jpeg',
                    ),
                    SizedBox(width: 5),
                    // username and name
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Jude Bellingham',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              Icons.verified,
                              color: AppPallete.kPrimaryColour2,
                              size: 12,
                            )
                          ],
                        ),
                        Text(
                          '@judeb2003',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconlyLight.setting,
                    size: 25,
                  ),
                ),

                // OutlineIconButton(
                //   icon: Icon(
                //     IconlyLight.setting,
                //     size: 24,
                //   ),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     OutlineIconButton(
                //       icon: Icon(
                //         IconlyLight.setting,
                //         size: 20,
                //       ),
                //     ),
                //     SizedBox(width: 5),
                //     FollowButton(),
                //   ],
                // ),
              ],
            ),

            // Bio
            const SizedBox(height: 20),
            const Text(
              '⚽Footballer is always what i encherished and will always cherish to last of my breath...',
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.clip,
            ),

            //Counts
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileNumbers(count: '295', title: 'Buzz'),
                ProfileNumbers(count: '123.9K', title: 'Followers'),
                ProfileNumbers(count: '670', title: 'Following'),
                ProfileNumbers(count: '3.7M', title: 'Likes'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
