import 'package:flutter/material.dart';
import 'package:meals_app/routes/routes.dart';

class TabsScreen extends StatelessWidget {
  final String title;
  final Widget activePage;
  const TabsScreen({
    super.key,
    required this.title,
    required this.activePage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          _selectPage(index, context);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void _selectPage(int index, BuildContext ctx) {
    if (index == 0) {
      Navigator.pushNamed(ctx, Routes.categories);
    }
    if (index == 1) {
      Navigator.pushNamed(ctx, Routes.favorites);
    }
  }
}
