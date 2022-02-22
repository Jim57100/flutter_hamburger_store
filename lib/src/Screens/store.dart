import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salice_flutter/src/Screens/LoginSignUp/welcome.dart';
import 'package:salice_flutter/src/Screens/cart.dart';
import '../Widget/header.dart';
import '../Widget/categories.dart';
import 'hamburgers_list.dart';

class AppStore extends StatelessWidget {
  const AppStore({required this.email, Key? key}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliverMe',
      home: Store(
        email: email,
      ),
      // routes: {Burger.tag: (_) => const Burger()},
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.teal,
        cardColor: Colors.white,
        primaryColor: Colors.teal,
        appBarTheme: const AppBarTheme(color: Colors.teal, centerTitle: true),
        bottomAppBarColor: Colors.teal,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.teal,
        cardColor: const Color.fromRGBO(20, 20, 20, 1),
        primaryColor: Colors.teal,
        appBarTheme: const AppBarTheme(color: Colors.teal, centerTitle: true),
        bottomAppBarColor: Colors.teal,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}

class Store extends StatefulWidget {
  const Store({required this.email, Key? key}) : super(key: key);
  final String email;
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    /// Set variable for switching the DarkMode
    bool light = Theme.of(context).brightness == Brightness.light;
    String email = widget.email;
    return Scaffold(
      ///Change Background in DarkMode
      backgroundColor: light
          ? const Color.fromRGBO(240, 240, 240, 1)
          : const Color.fromRGBO(35, 35, 35, 1),

      ///Scrollable body
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('DeliverMe'),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Cart(),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ],
            pinned: true,
          ),
          Header(
            email: widget.email,
          ),
          const Categories(),
          const HamburgersList(row: 1),
          // const HamburgersList(row: 2),
          // const HamburgersList(row: 3),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppStore(
                email: email,
              ),
            ),
          );
        },
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
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const WelcomePage(title: 'Welcome'),
                        ),
                      );
                    },
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
