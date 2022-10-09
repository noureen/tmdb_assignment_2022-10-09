import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';

class CustomLoader {
  static CustomLoader? _customLoader;
  bool isLoaderShown = false;

  CustomLoader._createObject();

  factory CustomLoader() {
    if (_customLoader != null) {
      return _customLoader!;
    } else {
      _customLoader = CustomLoader._createObject();
      return _customLoader!;
    }
  }

  //static OverlayEntry _overlayEntry;
  OverlayState? _overlayState; //= new OverlayState();
  OverlayEntry? _overlayEntry;

  _buildLoader() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return SizedBox(
            height: context.height,
            width: context.width,
            child: buildLoader(context));
      },
    );
  }

  showLoader(context) {
    if (isLoaderShown) {
      return;
    }
    _overlayState = Overlay.of(context)!;
    _buildLoader();
    _overlayState!.insert(_overlayEntry!);
    isLoaderShown = true;
  }

  hideLoader() {
    if (!isLoaderShown) {
      return;
    }
    try {
      _overlayEntry?.remove();
      _overlayEntry = null;
      isLoaderShown = false;
    } catch (e) {
      print("Exception:: $e");
    }
  }

  buildLoader(BuildContext context, {Color? backgroundColor}) {
    backgroundColor ??= const Color(0xffa8a8a8).withOpacity(.5);
    var height = 50.0;
    return CustomScreenLoader(
      height: height,
      width: height,
      backgroundColor: backgroundColor,
    );
  }
}

class CustomScreenLoader extends StatelessWidget {
  final Color backgroundColor;
  final double height;
  final double width;

  const CustomScreenLoader(
      {Key? key,
      this.backgroundColor = const Color(0xfff8f8f8),
      this.height = 30,
      this.width = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Container(
        height: height,
        width: height,
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              kIsWeb
                  ? CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    )
                  : Platform.isIOS
                      ? CupertinoActivityIndicator(
                          radius: 35,
                          color: Colors.black,
                        )
                      : CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
