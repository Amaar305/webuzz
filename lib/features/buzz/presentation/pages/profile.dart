import 'package:flutter/material.dart';

import '../widgets/profile_app_bar.dart';
import '../widgets/profile_tab_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  // AppBar
                  const ProfileAppBar(),

                  // TabBar
                  const ProfileTab(),
                ];
              },
              body: const TabBarView(
                children: [
                  Center(child: Text('Buzz')),
                  Center(child: Text('Draft')),
                  Center(child: Text('About')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
