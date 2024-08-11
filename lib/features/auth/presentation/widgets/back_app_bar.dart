import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';

PreferredSize BackAppBar(
  BuildContext context,
  String title,
) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: SafeArea(
      child: AppBar(
        elevation: 0,
        primary: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        titleSpacing: 10,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios, color: AppColors.black)),
            Text(
              title,
              style: TextStyle(
                  color: AppColors.black, fontFamily: 'Ubuntu', fontSize: 23),
            )
          ],
        ),
      ),
    ),
  );
}
