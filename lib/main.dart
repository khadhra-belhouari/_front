import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet/pages/categorie.dart';
import 'package:projet/pages/favorites/favourites.dart';
import 'package:projet/pages/personalinfo.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      // home: const Search(),
      initialRoute: '/.',
      routes: {
        '/.': (context) => const HomePage(),
        Myfavourites.route: (context) => const Myfavourites(),
        Category.route: (context) => const Category(),
        Perinfo.route: (context) => const Perinfo(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Category.route);
          },
          child: const Text('Click'),
        ),
      ),
    );
  }
}
