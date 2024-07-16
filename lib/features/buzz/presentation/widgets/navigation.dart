import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/common/cubits/bottom_nav/bottom_nav_cubit.dart';
import 'custom_nav.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBottomNavCubit, bool>(
      builder: (context, state) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          right: state ? 10 : 5,
          curve: Easing.emphasizedAccelerate,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Easing.emphasizedDecelerate,
            child: state
                ? GestureDetector(
                    onHorizontalDragUpdate: (details) =>
                        onHorizontalDragUpdate(details, context),
                    child: BlocBuilder<BottomNavCubit, int>(
                      builder: (context, state) {
                        return CustomBottomBar(
                          currentIndex: state,
                          onChange: (index) {
                            context.read<BottomNavCubit>().updatePage(index);
                          },
                        );
                      },
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      context.read<ShowBottomNavCubit>().show();
                    },
                    icon: Icon(
                      IconlyBold.category,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                  ),
          ),
        );
      },
    );
  }
}

void onHorizontalDragUpdate(
  DragUpdateDetails details,
  BuildContext context,
) {
  if (details.delta.dx > 50) {
    context.read<ShowBottomNavCubit>().show();
  } else if (details.delta.dx < 50) {
    context.read<ShowBottomNavCubit>().show();
  }
}
