import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/cubits/app_user/app_user_cubit.dart';
import 'core/common/cubits/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/buzz/presentation/pages/main_app.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return AnimatedTheme(
          duration: const Duration(milliseconds: 500),
          data: theme,
          curve: Curves.bounceInOut,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Webuzz',
            theme: theme,
            // darkTheme: AppTheme.appDarkTheme,
            // themeMode: ThemeMode.light,
            home: BlocSelector<AppUserCubit, AppUserState, bool>(
              selector: (state) {
                return state is AppUserLoggedIn;
              },
              builder: (context, isLoggedIn) {
                if (isLoggedIn) {
                  return const MyBottomNav();
                }
                return const LoginPage();
              },
            ),
          ),
        );
      },
    );
  }
}
