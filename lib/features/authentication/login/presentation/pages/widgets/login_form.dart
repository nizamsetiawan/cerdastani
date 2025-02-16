import 'package:cerdastani/new_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cerdastani/features/authentication/login/presentation/bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginStateLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is LoginStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        } else if (state is LoginStateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.userCredential.user!.email!)),
          );
          Navigator.pushReplacementNamed(context, "/home");
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: SMDimens.size24),
          child: Column(
            children: [
              SMInputField(
                controller: _emailController,
                label: 'Email',
                prefixWidget: const Padding(
                  padding: EdgeInsets.all(SMDimens.size8),
                  child: SmSvgPicture.asset(
                    value: SMAssetPaths.emailIcon,
                    fit: BoxFit.contain,
                  ),
                ),
                isRequired: true,
              ),
              const SizedBox(height: SMDimens.size16),
              SMInputField(
                controller: _passwordController,
                label: 'Kata Sandi',
                prefixWidget: const Padding(
                  padding: EdgeInsets.all(SMDimens.size8),
                  child: SmSvgPicture.asset(
                    value: SMAssetPaths.passwordIcon,
                    fit: BoxFit.contain,
                  ),
                ),
                obscureText: true,
                isRequired: true,
              ),
              const SizedBox(height: SMDimens.size10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/forgot-password");
                  },
                  child: Text(
                    SMDisplayStrings.forgotPassword,
                    style: SMFontPoppins.actionMedium12.copyWith(
                      color: SMColors.stateErrorBase,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: SMDimens.size10),

              SizedBox(
                width: double.infinity,
                child: SMButtonFill.primaryMedium(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginBloc>().add(
                            LoginWithEmailAndPasswordEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                    }
                  },
                  text: SMDisplayStrings.login,
                ),
              ),
              const SizedBox(height: SMDimens.size16),
              SizedBox(
                width: double.infinity,
                child: SMButtonOutline.secondaryMedium(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  text: SMDisplayStrings.register,
                ),
              ),
              const SizedBox(height: SMDimens.size16),
              const SMDivider(
                height: SMDimens.size24,
              ),
              const SizedBox(height: SMDimens.size16),
              SizedBox(
                width: double.infinity,
                child: SMButtonGhost.primaryMedium(
                  iconPath: SMAssetPaths.googleLogo,
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  text: SMDisplayStrings.loginwithGoogle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
