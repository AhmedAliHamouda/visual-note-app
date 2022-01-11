import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visual_notes/Helpers/routes.dart';
import 'package:visual_notes/Utils/colors_utils.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  TopBar({required this.title, required this.back});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsUtils.kPrimaryColor,
      leading: back == true
          ? Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                  color: ColorsUtils.whiteColor,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    CustomNavigator.popScreen(context);
                  }),
            )
          : Container(),
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.cairo(color: ColorsUtils.whiteColor, fontSize: 17.0),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
