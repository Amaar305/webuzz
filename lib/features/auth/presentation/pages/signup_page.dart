import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/top_widget.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static route() => MaterialPageRoute(builder: (context) => const SignupPage());

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
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
          } else if (state is AuthSucess) {
            showSnackBar(context, 'Sucessifully logged In');
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
        height: MediaQuery.sizeOf(context).height * 0.85,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppPallete.kWhiteColour,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Create an account.',
                      style: TextStyle(
                        color: AppPallete.kBlackColour,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, LoginPage.route());
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'Already a member?',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppPallete.kBlackColour,
                          ),
                          children: [
                            TextSpan(
                              text: ' Sign In',
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
                      label: 'Your name',
                      hintext: 'name',
                      controller: nameController,
                      inputType: TextInputType.name,
                    ),
                    AuthField(
                      controller: emailController,
                      label: 'Your e-mail',
                      hintext: 'email',
                      inputType: TextInputType.emailAddress,
                    ),
                    AuthField(
                      controller: passwordController,
                      label: 'Password',
                      hintext: 'password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    AuthButton(
                      label: 'Sign Up',
                      onPressesd: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthSignUp(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                program: '',
                                level: '',
                              ));
                        }
                      },
                    ),
                    // const SizedBox(height: 10),
                    // const OrWidget(),
                    // const SizedBox(height: 10),
                    // const AuthGoogleButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
