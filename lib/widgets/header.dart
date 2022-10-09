import 'package:flutter/material.dart';
import 'package:the_movies_db_app/constants/constants.dart';

import '../styles/styles.dart';

class HeaderAppBar extends StatefulWidget {
  const HeaderAppBar({Key? key}) : super(key: key);

  @override
  _HeaderAppBarState createState() => _HeaderAppBarState();
}

class _HeaderAppBarState extends State<HeaderAppBar> {
  final TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String? query;

  @override
  Widget build(BuildContext context) {
    return _isSearching ? _buildSearchField() : _buildWatch();
  }

  _buildWatch() {
    return Container(
      width: double.infinity,
      height: 60.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(AppStrings.strMenuWatch),
          Container(
            alignment: Alignment.center,
            width: 40,
            height: 40.0,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
              child: const Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
        width: double.infinity,
        height: 60.0,
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: TextFormField(
            onChanged: (key) {
              query = key;
            },
            decoration: InputDecoration(
              fillColor: disableColor,
              filled: true,
              hoverColor: lightGrey,
              contentPadding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              labelText: AppStrings.strSearchHere,
              labelStyle: const TextStyle(color: grey, fontSize: 14.0),
              focusedBorder: OutlineInputBorder(
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
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                  });
                },
                icon: const Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
        ));
  }
}
