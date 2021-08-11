import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_title/app/controller/moviesView/movies_view_controller.dart';
import 'package:movies_title/app/routes/app_pages.dart';
import 'package:movies_title/app/ui/theme/app_text_theme.dart';

class MoviesView extends StatelessWidget {
  final MoviesViewController _moviesViewController =
      Get.put(MoviesViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: Container(),
          centerTitle: true,
          title: (Text(
            'Movies',
            style: cardTextStyle,
          ))),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: ListView.builder(
                controller: _moviesViewController.scrollController.value,
                itemCount:
                    _moviesViewController.moviesData.value.results != null
                        ? _moviesViewController.moviesData.value.results.length
                        : 0,
                itemBuilder: (context, index) {
                  final movie =
                      _moviesViewController.moviesData.value.results[index];
                  return ListTile(
                      title: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PreviewView, arguments: movie);
                    },
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 120,
                            child: movie.posterPath != null
                                ? CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: "http://image.tmdb.org/t/p/w92" +
                                        movie.posterPath,
                                    placeholder: (context, url) =>
                                        Transform.scale(
                                      child: CircularProgressIndicator(),
                                      scale: 0.4,
                                    ),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.0, 0.0),
                                              blurRadius: 3.0,
                                              spreadRadius: 1.0)
                                        ],
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error,
                                    ),
                                  )
                                : Icon(Icons.error),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(movie.title,
                                      style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text("Release Date: ${movie.releaseDate}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  Text(movie.overview,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
                }),
          ),
        ),
      ),
    );
  }
}
