import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomIconButton extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String iconName;
  final Function onPressed;

  CustomIconButton({
    this.index,
    this.currentIndex,
    @required this.iconName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == currentIndex ? true : false;
    return CircleAvatar(
        backgroundColor: isSelected ? kEnapledIconColor : kDisabledButtonColor,
        minRadius: 32,
        child: IconButton(
            icon: Transform.scale(
              scale: 1.4,
              child: ImageIcon(
                AssetImage(iconName),
                color: isSelected ? kPrimaryColor : kDisabledIconColor,
              ),
            ),
            onPressed: onPressed));
  }
}
