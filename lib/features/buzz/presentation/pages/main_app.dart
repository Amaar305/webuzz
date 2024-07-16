import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/cubits/bottom_nav/bottom_nav_cubit.dart';
import '../widgets/navigation.dart';
import '../../../chat/presentation/pages/chat.dart';
import '../../../document/presentation/pages/document.dart';
import 'home.dart';
import 'profile.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          BlocBuilder<BottomNavCubit, int>(
            builder: (context, state) {
              return IndexedStack(
                index: state,
                children: const [
                  HomePage(),
                  Chat(),
                  Document(),
                  Profile(),
                ],
              );
            },
          ),
          const BottomBar()
        ],
      ),
    );
  }
}
