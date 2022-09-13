import 'package:book_grocer/config/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class HomeInfo extends StatelessWidget {
  final String bookName;
  final String bookInfo;
  final String image;

  const HomeInfo(
      {Key? key,
      required this.bookName,
      required this.bookInfo,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: AppPadding.p20,
            left: AppPadding.p20,
          ),
          child: Container(
            height: AppSize.s180,
            width: AppSize.s120,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)),
                borderRadius: BorderRadius.circular(AppSize.s20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p8,
            bottom: AppPadding.p8,
          ),
          child: Text(
            bookName,
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p8,
            bottom: AppPadding.p8,
          ),
          child: Text(
            bookInfo,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
class Titl1e extends StatelessWidget {
  final String title;
  const Titl1e({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppPadding.p20,
          top: AppPadding.p25,
          right: AppPadding.p20),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge,
      ).tr(),
    );
  }
}

