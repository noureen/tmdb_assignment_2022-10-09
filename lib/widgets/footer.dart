import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constants/constants.dart';
import '../main.dart';
import '../styles/styles.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return _buildFooter();
  }

  Widget _buildFooter() {
    return Padding(
      padding: EdgeInsets.all(8.0.px),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: menuBgColor,
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard_outlined),
                      label: strMenuDashboard),
                  BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.youtube),
                      label: strMenuWatch),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.video_library),
                      label: strMenuMediaLibrary),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.more_horiz), label: strMenuMore),
                ],
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.white,
                showUnselectedLabels: true,
                backgroundColor: Colors.black,
                currentIndex: globalSelectIndex,
                onTap: (int index) {
                  switch (index) {
                    case 0:
                      if (globalSelectIndex != 0) Get.offAllNamed('/');
                      break;
                    case 1:
                      if (globalSelectIndex != 1) Get.offAllNamed('/genre');
                      break;
                    case 2:
                      break;
                    case 3:
                      break;
                  }
                  setState(
                    () {
                      globalSelectIndex = index;
                    },
                  );
                })),
      ),
    );
  }
}
