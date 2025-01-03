import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project/core/config/theme/app_theme.dart';
import 'package:project/firebase_options.dart';
import 'package:project/presentation/Add_to_favourite/provider/FavourtieProvider.dart';
import 'package:project/presentation/Home/pages/HomeScreen.dart';
import 'package:project/presentation/Mini_Music_Player/provider/MiniMusicProvider.dart';
import 'package:project/presentation/auth/pages/SignIn.dart';
import 'package:project/presentation/chooseModePage/bloc/theme_cubit.dart';
import 'package:project/presentation/intro/pages/getStarted.dart';
import 'package:project/presentation/splash/pages/splash.dart';
import 'package:project/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
    SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependency();
  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
   final bool isFirstTime;
  const MyApp({required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        ChangeNotifierProvider(
          create: (_) => Favourtieprovider(),
        ),
         ChangeNotifierProvider(
          create: (_) => AudioPlayerProvider(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          title: 'Spotify Clone',
          theme: Apptheme.lightTheme,
          darkTheme: Apptheme.darkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
           home: SplashPage(isFirstTime: isFirstTime),
      routes: {
        '/getStarted': (context) => const GetStarted(),
        '/signIn': (context) =>  SignIn(),
      },
        ),
      ),
    );
  }
}
