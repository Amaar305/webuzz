import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:webuzz/core/theme/app_pallete.dart';
import 'package:webuzz/core/utils/pick_image.dart';

import '../widgets/buzz_editor.dart';
import '../widgets/create_buzz_app_bar.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  CustomPageRoute({
    required this.child,
    this.direction = AxisDirection.up,
  }) : super(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              child,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getDirection(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

  Offset getDirection() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(0, 1);
    }
  }
}

class CreateBuzzPage extends StatefulWidget {
  const CreateBuzzPage({super.key});

  static route() => CustomPageRoute(
        child: const CreateBuzzPage(),
        direction: AxisDirection.up,
      );

  @override
  State<CreateBuzzPage> createState() => _CreateBuzzPageState();
}

class _CreateBuzzPageState extends State<CreateBuzzPage> {
  late TextEditingController editingController;
  File? image;
  final List<String> _items = [
    'Public',
    'Private',
  ];

  String _selectedValue = 'Public';

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController();
  }

  void selectImage() async {
    final pickedImage = await pickImage();

    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  void cancelImage() {
    if (image != null) {
      setState(() {
        image = null;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    editingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              CreateBuzzAppBar(
                title: 'New Buzz',
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
                selectedValue: _selectedValue,
                items: _items,
              ),
              Expanded(
                child: ListView(
                  children: [
                    BuzzEditor(controller: editingController),
                    const SizedBox(height: 12),
                    if (image != null)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: image != null
                            ? MediaQuery.sizeOf(context).height * 0.32
                            : 0,
                        curve: Curves.fastEaseInToSlowEaseOut,
                        child: Stack(
                          alignment: Alignment.topRight,
                          clipBehavior: Clip.antiAlias,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      AppPallete.kGreyColour.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    cancelImage();
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: AppPallete.kWhiteColour,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    const SizedBox(height: 20),
                    _buitBuzzActionButton(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buitBuzzActionButton(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            MyIconButton(
              color: Theme.of(context).colorScheme.primary,
              backgroundColor: AppPallete.kBlackColour,
              onPressed: () {
                selectImage();
              },
              icon: IconlyBold.image_2,
            ),
            MyIconButton(
              color: AppPallete.kBlackColour,
              backgroundColor: Colors.grey.shade200,
              onPressed: () {},
              icon: Icons.gif,
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
          ),
          child: const Text(
            'Buzz Now',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: AppPallete.kBlackColour,
            ),
          ),
        ),
      ],
    );
  }
}

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    this.backgroundColor,
    this.color,
    this.onPressed,
    required this.icon,
  });
  final IconData icon;
  final Color? backgroundColor;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(10),
        ),
        icon: Icon(
          icon,
          color: color,
          size: 30,
        ),
      ),
    );
  }
}
