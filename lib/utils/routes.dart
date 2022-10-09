import 'package:get/get.dart';
import 'package:the_movies_db_app/screens/dashboard/dashboard_page.dart';

appRoutes() => [
      GetPage(
        name: '/',
        page: () => DashboardPage(),
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
