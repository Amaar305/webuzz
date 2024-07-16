import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../pages/create_buzz.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onChange,
  });

  final int currentIndex;
  final void Function(int index) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .2,
      child: Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // This will take space as minimum as posible(to center)
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => onChange(0),
                icon: Icon(
                  currentIndex == 0 ? IconlyBold.home : IconlyLight.home,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () => onChange(1),
                icon: Icon(
                  currentIndex == 1 ? IconlyBold.chat : IconlyLight.chat,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () => onChange(2),
                icon: Icon(
                  currentIndex == 2
                      ? IconlyBold.document
                      : IconlyLight.document,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () => onChange(3),
                icon: Icon(
                  currentIndex == 3 ? IconlyBold.user_2 : IconlyLight.user,
                  size: 25,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, size: 25),
                onPressed: () =>
                    Navigator.push(context, CreateBuzzPage.route()),
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
