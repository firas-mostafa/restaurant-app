import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/components/bottom_nav_bar.dart';
import 'package:restoorder/pages/loading_screen.dart';
import 'package:restoorder/pages/home/accuont_page.dart';
import 'package:restoorder/pages/home/history_page.dart';
import 'package:restoorder/provider/theme_provider.dart';
import 'home_page.dart';
import 'settingspage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IndexProvider(),
      child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Scaffold(
                  body: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: listofbody[
                          context.watch<IndexProvider>().currentIndex]),
                  bottomNavigationBar: Consumer<ThemeProvider>(
                    builder: (context, value, child) => BottomNavBar(),
                  ));
            } else {
              return const LoadingScreen();
            }
          }),
    );
  }
}

List<Widget> listofbody = const [
  HomePage(),
  HistoryPage(),
  SettingsPage(),
  AccountPage(),
];

class IndexProvider with ChangeNotifier {
  int currentIndex = 0;
  void changeCurrentIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
