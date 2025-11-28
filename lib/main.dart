import 'package:yell/core/barrel/barrel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'yell',
        theme: AMTheme.lightTheme,
        darkTheme: AMTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: AMRoutes.main,
        onGenerateRoute: YellRouter.generateRoute,
      ),
    );
  }
}
