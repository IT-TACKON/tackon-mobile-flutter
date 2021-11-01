import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tackon/bloc/question/question_bloc.dart';
// import 'package:tackon/data/local_storage/preferences.dart';
import 'package:tackon/routes/routes.dart';
// import 'package:tackon/screen/auth_screen.dart';
import 'package:tackon/screen/dashboard_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // final Preferences _prefs = Preferences();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<QuestionBloc>(
          create: (_) => QuestionBloc(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Tackon',
        getPages: router,
        home: const DashboardScreen(),
        // home: !_prefs.isAuthenticated
        //     ? const AuthScreen()
        //     : const DashboardScreen(),
      ),
    );
  }
}
