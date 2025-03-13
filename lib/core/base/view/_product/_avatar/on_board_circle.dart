import 'package:flutter/material.dart';

class OnBoardCircle extends StatelessWidget {
  final bool isSelected;
  const OnBoardCircle({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: CircleAvatar(
        radius: isSelected ? 8 : 5,
        backgroundColor: Theme.of(
          context,
        ).primaryColor.withOpacity(isSelected ? 1 : 0.2),
      ),
    );
  }
}
