import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_title/app/controller/moviesView/preview_view_controller.dart';
import 'package:movies_title/app/ui/theme/app_text_theme.dart';
import 'package:movies_title/app/utils/asset_strings.dart';

class PreviewView extends StatelessWidget {
  final PreviewViewController _previewViewController =
      Get.put(PreviewViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: (Text(
            _previewViewController.movieData.title,
            style: cardTextStyle,
          ))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  height: 400,
                  child: SizedBox(
                    width: Get.width,
                    child: _previewViewController.movieData.posterPath != null
                        ? CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: "http://image.tmdb.org/t/p/w92" +
                                _previewViewController.movieData.posterPath,
                            placeholder: (context, url) => Transform.scale(
                              child: CircularProgressIndicator(),
                              scale: 0.4,
                            ),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.contain),
                              ),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                            ),
                          )
                        : Icon(Icons.error),
                  ),
                ),
                Text(_previewViewController.movieData.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(height: 8.0),
                Text(
                    "Rating: ${_previewViewController.movieData.voteAverage} (${_previewViewController.movieData.voteCount})",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 8.0),
                Text(
                    "Release Date: ${_previewViewController.movieData.releaseDate}",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 8.0),
                Text(_previewViewController.movieData.overview,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
