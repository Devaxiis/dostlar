import 'package:dostlar_app/src/presentation/ui/dost_qoshish_screen.dart';
import 'package:dostlar_app/src/presentation/ui/dostlar_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
PageController controller = PageController();
int page = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:PageView(
          controller: controller,
          children:const [
            DostlarScreen(),
            DostQoshishScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Color(0xff14181e)),
        unselectedIconTheme: const IconThemeData(color: Color(0xff818181)),
        selectedItemColor: const Color(0xff14181e),
        unselectedItemColor: const Color(0xff818181),
        currentIndex: page,
        onTap: (value){
          page = value;
          controller.animateToPage(page, duration: const Duration(milliseconds: 700), curve:Curves.easeInToLinear);
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined),label: "Do'stlarim"),
          BottomNavigationBarItem(icon: Icon(Icons.person_add_outlined),label: "Do'st qo'shish"),
        ],
      ),
    );
  }
}
