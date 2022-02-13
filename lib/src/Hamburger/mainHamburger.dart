import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'header.dart';
// import 'categories.dart';
// import 'hamburgers_list.dart';
// import 'burger_page.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //WelcomeTheme
//     final textTheme = Theme.of(context).textTheme;

//     return MaterialApp(
//       title: 'Flutter project',
//       home: const Hamburger(),

//       routes: {Burger.tag: (_) => Burger()},
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         canvasColor: Colors.teal,
//         cardColor: Colors.white,
//         primaryColor: Colors.teal,
//         appBarTheme: const AppBarTheme(color: Colors.teal, centerTitle: true),
//         bottomAppBarColor: Colors.teal,
//         floatingActionButtonTheme: const FloatingActionButtonThemeData(
//           backgroundColor: Colors.orange,
//         ),
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         canvasColor: Colors.teal,
//         cardColor: const Color.fromRGBO(20, 20, 20, 1),
//         primaryColor: Colors.teal,
//         appBarTheme: const AppBarTheme(color: Colors.teal, centerTitle: true),
//         bottomAppBarColor: Colors.teal,
//         floatingActionButtonTheme: const FloatingActionButtonThemeData(
//           backgroundColor: Colors.orange,
//         ),
//       ),
//     );
//   }
// }

class Hamburger extends StatefulWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  _HamburgerState createState() => _HamburgerState();
}

// ignore: camel_case_types
class _HamburgerState extends State<Hamburger> {
  @override
  Widget build(BuildContext context) {
    /// Set variable for switching the DarkMode
    bool light = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      ///Change Background in DarkMode
      backgroundColor: light
          ? const Color.fromRGBO(240, 240, 240, 1)
          : const Color.fromRGBO(35, 35, 35, 1),

      ///Scrollable body
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Deliver Me'),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart))
            ],
            pinned: true,
          ),
          // Header(),
          // Categories(),
          // const HamburgersList(row: 1),
          // const HamburgersList(row: 2),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home, color: Colors.white),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(45)),
        child: Container(
            color: Colors.black38,
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_alert),
                    color: Colors.white,
                  ),
                  const Spacer(),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.logout),
                    color: Colors.white,
                  ),
                  const Spacer(),
                ],
              ),
            )),
      ),
    );
  }
}
