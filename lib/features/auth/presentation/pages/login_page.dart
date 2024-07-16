import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_google_button.dart';
import '../widgets/forgot_password.dart';
import '../widgets/or_widget.dart';
import '../widgets/top_widget.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static route() => MaterialPageRoute(builder: (context) => const LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }
          return Stack(
            children: [
              const SignupTopWidget(),
              bottom(context),
            ],
          );
        },
      ),
    );
  }

  Widget bottom(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppPallete.kWhiteColour,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.25,
                child: Image.asset(
                  'assets/images/bee2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: AppPallete.kBlackColour,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, SignupPage.route());
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Don\'t have an account?',
                              style: TextStyle(
                                  fontSize: 14, color: AppPallete.kBlackColour),
                              children: [
                                TextSpan(
                                  text: ' Register',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppPallete.kPrimaryColour,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AuthField(
                          label: 'Your e-mail',
                          hintext: 'email',
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                        ),
                        AuthField(
                          label: 'Password',
                          hintext: 'password',
                          controller: passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        const ForgotPasswordWidget(),
                        const SizedBox(height: 20),
                        AuthButton(
                          label: 'Sign In',
                          onPressesd: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    AuthLogin(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  );
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        const OrWidget(),
                        const SizedBox(height: 10),
                        AuthGoogleButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthGooleSignIn());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
