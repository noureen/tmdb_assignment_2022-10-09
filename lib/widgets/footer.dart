import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constants.dart';
import '../styles/styles.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _buildFooter();
  }

  Widget _buildFooter() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(40)),
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
                    label: AppStrings.strMenuDashboard),
                BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.youtube),
                    label: AppStrings.strMenuWatch),
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_library),
                    label: AppStrings.strMenuMediaLibrary),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz),
                    label: AppStrings.strMenuMore),
              ],
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              showUnselectedLabels: true,
              backgroundColor: Colors.black,
              currentIndex: _selectedIndex,
              onTap: (int index) {
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    break;
                  case 2:
                    break;
                  case 3:
                    break;
                }
                setState(
                  () {
                    _selectedIndex = index;
                  },
                );
              })),
    );
  }
}
