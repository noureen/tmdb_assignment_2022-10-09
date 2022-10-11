import 'package:get/get.dart';
import 'package:the_movies_db_app/screens/dashboard/dashboard_page.dart';
import 'package:the_movies_db_app/screens/genre/genre_page.dart';

import '../screens/details/details.dart';
import '../screens/search/search_page.dart';

appRoutes() => [
      GetPage(
        name: '/',
        page: () => const DashboardPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/detail',
        page: () => DetailsScreen(),
        middlewares: [MyMiddleware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/search',
        page: () => const SearchPage(),
        middlewares: [MyMiddleware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/genre',
        page: () => const GenrePage(),
        middlewares: [MyMiddleware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];

class MyMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }
}
