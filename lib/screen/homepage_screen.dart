import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screen/bottomappbar/contact.dart';
import '../screen/bottomappbar/home.dart';
import '../screen/bottomappbar/personel.dart';
import '../widgets/float_action_bottom.dart';
import '../widgets/open_url_widget.dart';
import 'bottomappbar/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  bottomNavigatorBarSelectedItem(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return HomeScreenBottomBar();
        break;
      case 1:
        return PersonelScreenBottomBar();
        break;
      case 2:
        return ServicesScreenBottomBar();
        break;
      case 3:
        return ContactScreenBottomBar();
        break;
      default:
        return HomeScreenBottomBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    String instagramUrl = "https://www.instagram.com/terapidukkaniofficial/";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.instagram,
            ),
            onPressed: () => openUrl(instagramUrl),
          )
        ],
        title: Text('TerapiDükkanım.com'),
      ),
      body: bottomNavigatorBarSelectedItem(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(FontAwesomeIcons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(FontAwesomeIcons.users),
            label: 'Personel',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(FontAwesomeIcons.star),
            label: 'Hizmetlerimiz',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(FontAwesomeIcons.mailBulk),
            label: 'İletişim',
          ),
        ],
        onTap: (int index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
      floatingActionButton: MyFAB(),
    );
  }
}
