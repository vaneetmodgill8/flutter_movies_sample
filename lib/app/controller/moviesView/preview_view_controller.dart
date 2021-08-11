import 'package:get/get.dart';
import 'package:movies_title/app/data/model/movies_model.dart';

class PreviewViewController extends GetxController {
  MoviesData movieData;

  @override
  void onInit() {
    movieData = Get.arguments;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
