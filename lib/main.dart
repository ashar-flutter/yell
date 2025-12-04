import 'package:yell/core/barrel/barrel.dart';
import 'feature/controller/dashboard/bloc/dashboard_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository: AuthRepository()),
        ),
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc(
          ),
        ),
      ],
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