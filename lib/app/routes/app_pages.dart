import 'package:movies_title/app/ui/views/moviePreview/preview_page.dart';
import 'package:movies_title/app/ui/views/moviesView/movies_page.dart';
import 'package:movies_title/app/ui/views/splash/splash.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.Splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.MoviesView,
      page: () => MoviesView(),
    ),
    GetPage(
      name: Routes.PreviewView,
      page: () => PreviewView(),
    ),
  ];
}
