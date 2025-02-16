import 'package:cerdastani/features/authentication/login/presentation/bloc/login_bloc.dart';
import 'package:cerdastani/injection.dart';
import 'package:cerdastani/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cerdastani/routes/app_routes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRoutes = AppRoutes();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => myInjection<LoginBloc>(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: ThemeData(
            scaffoldBackgroundColor: SMColors.white,

          ),
          routerConfig: appRoutes.router,
        ));
  }
}
