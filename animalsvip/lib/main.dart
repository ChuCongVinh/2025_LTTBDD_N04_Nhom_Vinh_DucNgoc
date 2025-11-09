import 'package:flutter/material.dart';
import 'trang_chu.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const UngDungCuaToi());
}

class UngDungCuaToi extends StatefulWidget {
  const UngDungCuaToi({super.key});

  static TrangThaiUngDungCuaToi? of(
          BuildContext context) =>
      context.findAncestorStateOfType<
          TrangThaiUngDungCuaToi>();

  @override
  State<UngDungCuaToi> createState() =>
      TrangThaiUngDungCuaToi();
}

class TrangThaiUngDungCuaToi
    extends State<UngDungCuaToi> {
  Locale _locale = const Locale('vi');
  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Động Vật Việt Nam',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme:
            GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const TrangChu(),
    );
  }
}
