import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCategoryWidget extends StatelessWidget {
  final String title;
  final String assetImage;
  final VoidCallback onTap;
  const CardCategoryWidget({Key key, this.title, this.assetImage, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12.0,
                offset: Offset(4.0, 8.0),
              ),
            ]),
        child: Column(
          children: [
            Spacer(),
            Image(
              image: AssetImage(assetImage),
              height: 70,
              width: 70,
            ),
            Spacer(),
            Text(title,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.black, fontSize: 14))),
          ],
        ),
      ),
    );
  }
}
