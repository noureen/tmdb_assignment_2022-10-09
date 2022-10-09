import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movies_db_app/blocs/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:the_movies_db_app/di/component/locator.dart';
import 'package:the_movies_db_app/utils/routes.dart';
import 'package:the_movies_db_app/widgets/custom_loader.dart';
import 'blocs/bloc_delegate.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final CustomLoader progress = CustomLoader();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  Bloc.observer = AppBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UpcomingMoviesBloc>(
        create: (_) => UpcomingMoviesBloc(
            upcomingMoviesRepo: locator.get(), moviesDbRepo: locator.get()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          // Remove the debug banner
          debugShowCheckedModeBanner: false,
          title: 'TMDB',
          theme: Theme.of(context).copyWith(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          getPages: appRoutes(),
        );
      },
    );
  }
}
