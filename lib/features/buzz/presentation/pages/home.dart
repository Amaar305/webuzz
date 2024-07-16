import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:webuzz/features/buzz/presentation/widgets/user_avatar.dart';

import '../../../../core/common/cubits/app_user/app_user_cubit.dart';
import '../../../../core/common/cubits/theme/app_theme.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Webuzz',
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 0.8,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/OIP.jpeg',
                  fit: BoxFit.cover,
                  width: 35,
                  height: 35,
                ),
              ),
            );
          },
        ),
        actions: [
          const NotificationIcon(),
          // Extra space
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.search,
              size: 21,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('Buzz here...'),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.5,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          BlocBuilder<AppUserCubit, AppUserState>(
            builder: (context, state) {
              if (state is AppUserLoggedIn) {
                return DrawerHeader(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/OIP.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppPallete.kBlackColour.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: '🎓 ',
                            children: [
                              TextSpan(
                                text: '200',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                  shadows: [
                                    BoxShadow(
                                      color: AppPallete.kGreyColour,
                                      blurRadius: 2,
                                      offset: Offset.fromDirection(3),
                                    ),
                                    BoxShadow(
                                      color: AppPallete.kWhiteColour,
                                      blurRadius: 0.8,
                                      offset: Offset.fromDirection(-3.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppPallete.kBlackColour.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: '🪙 ',
                            children: [
                              TextSpan(
                                text: '200',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                  shadows: [
                                    BoxShadow(
                                      color: AppPallete.kGreyColour,
                                      blurRadius: 2,
                                      offset: Offset.fromDirection(3),
                                    ),
                                    BoxShadow(
                                      color: AppPallete.kWhiteColour,
                                      blurRadius: 0.8,
                                      offset: Offset.fromDirection(-3.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          const DrawerSectionTitle(
            title: 'Mutual Friends',
          ),
          const MutualFriendWidget(
            name: 'Mustapha MDV',
            image: 'assets/images/him.jpg',
          ),
          const MutualFriendWidget(
            name: 'Chloe',
            image: 'assets/images/her.jpg',
          ),
          const MutualFriendWidget(
            name: 'Samuel',
            image: 'assets/images/sam.jpg',
          ),
          const MutualFriendWidget(
            name: 'Jaden Smith',
            image: 'assets/images/jade.jpg',
          ),
          const DrawerSectionTitle(
            title: 'Quick Settings',
          ),
          BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, state) {
              return ListTile(
                leading: state.brightness == Brightness.light
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined),
                title: Text(
                  state.brightness == Brightness.light ? 'Light' : 'Dark',
                  style: const TextStyle(fontSize: 12),
                ),
                onTap: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.logout),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 12),
            ),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog.adaptive(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  content: const Text('Are you sure?'),
                  title: const Text('Logout'),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<AuthBloc>().add(AuthUserLogout());
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),
          const ListTile(
            leading: Icon(IconlyLight.setting),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        const Icon(IconlyLight.notification),
        Positioned(
          left: 10,
          child: Container(
            padding: const EdgeInsets.all(2),
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppPallete.kRedColour,
            ),
            child: const FittedBox(
              child: Text(
                '20',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppPallete.kWhiteColour,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DrawerSectionTitle extends StatelessWidget {
  const DrawerSectionTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}

class MutualFriendWidget extends StatelessWidget {
  const MutualFriendWidget({
    super.key,
    required this.name,
    required this.image,
    this.onTap,
  });
  final String name;
  final String image;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar(
        imageUrl: image,
        width: 25,
        height: 25,
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 12),
      ),
      onTap: onTap,
    );
  }
}
