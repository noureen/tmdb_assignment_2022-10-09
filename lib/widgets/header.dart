import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:the_movies_db_app/blocs/search_movie/search_movie_bloc.dart';
import 'package:the_movies_db_app/constants/constants.dart';
import 'package:the_movies_db_app/utils/utility.dart';
import '../styles/styles.dart';

//All three pages have different top bar so I have used enums from which I am differentiating widgets types
enum SearchType {
  watch,//watch/dashboard page
  search,//search page
  genre,// genre page
}

class HeaderAppBar extends StatefulWidget {
  final SearchType searchType;

  const HeaderAppBar({Key? key, required this.searchType}) : super(key: key);

  @override
  _HeaderAppBarState createState() => _HeaderAppBarState();
}

class _HeaderAppBarState extends State<HeaderAppBar> {
  TextEditingController? _searchQueryController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //if search page then search controller is declare
    _searchQueryController = TextEditingController()
      ..addListener(() {
        final query = _searchQueryController?.text.toString();
        BlocProvider.of<SearchMovieBloc>(context).add(SearchMovieInitEvent());//Here I am first reseting the page
        BlocProvider.of<SearchMovieBloc>(context).add(QueryEvent(query: query)); // then calling to set query
      });
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchType == SearchType.search
        ? search
        : widget.searchType == SearchType.genre
            ? genre
            : watch;
  }

  Widget get watch => Container(
        width: double.infinity,
        height: 60.0,
        padding: EdgeInsets.only(left: 16.0.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              strMenuWatch,
              style: mediumText,
            ),
            MaterialButton(
              onPressed: () {
                Get.toNamed('/search');
              },
              child: Icon(size: 30.0.px, Icons.search),
            )
          ],
        ),
      );

  Widget get genre => InkWell(
        onTap: () {
          Get.toNamed('/search');
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            width: double.infinity,
            height: 6.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: lightGrey,
            ),
            child: TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  size: 3.0.h,
                ),
                label: Text(
                  strSearchTvShows,
                  style: TextStyle(
                      fontWeight: weight400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0.sp,
                      color: grey,
                      fontFamily: 'PoppinsRegular'),
                )),
          ),
        ),
      );

  Widget get search => Container(
      width: double.infinity,
      height: 60.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Center(
        child: searchField,
      ));

  Widget get searchField => TextFormField(
        enableInteractiveSelection: widget.searchType == SearchType.search,
        // will disable paste operation
        focusNode: widget.searchType != SearchType.search
            ? AlwaysDisabledFocusNode()
            : null,
        controller: widget.searchType == SearchType.search
            ? _searchQueryController
            : null,
        decoration: searchDecor,
      );

  InputDecoration get searchDecor => InputDecoration(
        fillColor: disableColor,
        filled: true,
        hoverColor: lightGrey,
        contentPadding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        labelText: widget.searchType == SearchType.search
            ? strSearchHere
            : strSearchTvShows,
        labelStyle: TextStyle(
            fontWeight: weight400,
            fontStyle: FontStyle.normal,
            fontSize: 16.0.sp,
            color: grey,
            fontFamily: 'PoppinsRegular'),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: blackColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: lightGrey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: redColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: redColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        suffixIcon: widget.searchType == SearchType.search
            ? IconButton(
                onPressed: () {
                  _searchQueryController?.clear();
                },
                icon: const Icon(Icons.clear),
              )
            : null,
      );

  @override
  void dispose() {
    _searchQueryController?.dispose();
    super.dispose();
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
