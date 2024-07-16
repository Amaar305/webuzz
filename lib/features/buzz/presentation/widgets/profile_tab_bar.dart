import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/theme/app_pallete.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
        const TabBar(
          dividerHeight: 0,
          indicatorColor: AppPallete.kPrimaryColour2,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(child: Icon(IconlyLight.discovery)),
            Tab(child: Icon(IconlyLight.folder)),
            Tab(child: Icon(IconlyLight.user)),
          ],
        ),
      ),
      pinned: true,
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return tabBar;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
