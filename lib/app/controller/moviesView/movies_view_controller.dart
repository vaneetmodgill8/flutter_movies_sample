import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_title/app/data/model/movies_model.dart';
import 'package:movies_title/app/data/provider/APIError.dart';
import 'package:movies_title/app/data/provider/api.dart';
import 'package:movies_title/app/routes/app_pages.dart';

class MoviesViewController extends GetxController {
  Rx<DataMoviesList> moviesData = DataMoviesList().obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  var _pageNo = 1;

  @override
  void onInit() {
    getMovies();
    scrollController.value.addListener(() {
      if ((scrollController.value.position.pixels + 200.0) >=
          scrollController.value.position.maxScrollExtent) {
        _pageNo += 1;
        getMovies();
      }
    });
    super.onInit();
  }

  void getMovies() async {
    // Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    var response = await Api().getMovies({
      "query": "superman",
      "page": "$_pageNo",
    });
    // Get.back();
    if (response is APIError) {
      Get.snackbar("", response.error);
      return;
    }
    if (_pageNo == 1) {
      moviesData.value = response;
    } else {
      DataMoviesList data = moviesData.value;
      data.results.addAll(response.results);
      moviesData.value = data;
      moviesData.refresh();
      update();
    }
    // Get.toNamed(Routes.SignUpUserInfoView); // navigate to otp
  }

  @override
  void onClose() {
    scrollController.value.dispose();
    super.onClose();
  }
}
