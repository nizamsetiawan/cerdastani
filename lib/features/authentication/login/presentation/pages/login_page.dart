import 'package:cerdastani/features/authentication/login/presentation/pages/widgets/login_form.dart';
import 'package:cerdastani/features/authentication/login/presentation/pages/widgets/login_header.dart';
import 'package:cerdastani/new_ui_kit.dart';
import 'package:flutter/material.dart';


import '../../../../../utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SMDimens.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SMDimens.size60),
              LoginHeader(),
              LoginForm(),

            ],
          ),
        ),
      ),
    );
  }
}
