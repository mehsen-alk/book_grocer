import 'package:book_grocer/config/color_manager.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double _rating;
  const RatingBar({Key? key, required double rating})
      : _rating = rating,
        super(key: key);

  IconData getStar(int index) {
    if (_rating >= index) {
      return Icons.star;
    } else if ((_rating + 1) > index) {
      return Icons.star_half;
    } else {
      return Icons.star_border;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          getStar(1),
          color: ColorManager.primary,
          size: 30,
        ),
        Icon(
          getStar(2),
          color: ColorManager.primary,
          size: 30,
        ),
        Icon(
          getStar(3),
          color: ColorManager.primary,
          size: 30,
        ),
        Icon(
          getStar(4),
          color: ColorManager.primary,
          size: 30,
        ),
        Icon(
          getStar(5),
          color: ColorManager.primary,
          size: 30,
        ),
      ],
    );
  }
}
