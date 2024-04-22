import 'package:flutter/material.dart';
import 'package:photos_real_estate/presentation/screens/objects_list/objects_list_screen.dart';

class MainPageApp extends StatefulWidget {
  const MainPageApp({super.key});

  @override
  State<MainPageApp> createState() => _MainPageAppState();
}

class _MainPageAppState extends State<MainPageApp> {
  int _selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pagesApp = <Widget>[
    const ObjectsListScreen(),
    const ObjectsListScreen(),
    const ObjectsListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: _pagesApp.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          selectedItemColor: theme.hoverColor,
          unselectedItemColor: theme.hintColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Объекты",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallpaper),
              label: "Сеты",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_4_outlined),
              label: "Профиль",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _selectedPage,
        ),
      ),
    );
  }
}
