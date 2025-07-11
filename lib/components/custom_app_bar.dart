import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const CustomAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: Semantics(
        image: true,
        readOnly: true,
        label: "The application logo.",
        child: Image.asset("assets/logo.png"),
      ),
      title: Text(
        title ?? "EcoEmissions",
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
