import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class SignupTopWidget extends StatelessWidget {
  const SignupTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.44,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppPallete.kPrimaryColour,
        image: DecorationImage(
          image: AssetImage('assets/images/bee1.png'),
          fit: BoxFit.cover,
        ),
      ),
      // child: const SafeArea(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       SizedBox(height: 10),
      //       Text(
      //         'Webuzz.',
      //         style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //           color: AppPallete.kWhiteColour,
      //           shadows: [
      //             Shadow(
      //               blurRadius: 2,
      //               color: AppPallete.kBlackColour,
      //               offset: Offset(2, 2),
      //             ),
      //             Shadow(
      //               blurRadius: 2,
      //               color: AppPallete.kGreyColour,
      //               offset: Offset(-0.5, 2),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
