import 'package:flutter/material.dart';
import 'package:news_app/news_app/presentation/articles_list/articles_screen.dart';
import 'package:news_app/sample_login/presentation/post_list/post_list.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final ListOfScreen = [PostList(), ArticleScreen()];
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListOfScreen[currentScreen],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.post_add), label: "Posts"),
          NavigationDestination(icon: Icon(Icons.newspaper), label: "News"),
        ],
        selectedIndex: currentScreen,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentScreen = index;
          });
        },
      ),
    );
  }
}
