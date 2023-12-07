import 'Utils/splash.dart';
import 'Feature/Auth/Controller/sign_up.dart';
import 'Utils/exports.dart';

void main() async {
  // ? this helps to http licenses and issues
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
            create: (_) => LoginProvider(GoRouter.instance)),
        ChangeNotifierProvider<SignUpProvider>(
            create: (context) => SignUpProvider()),
        ChangeNotifierProvider<ProfileProvider>(
            create: (_) => ProfileProvider(GoRouter.instance))
      ],
      child: MaterialApp(
        navigatorKey: GoRouter.instance.navigationKey,
        title: 'Todo Dude',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splash(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
