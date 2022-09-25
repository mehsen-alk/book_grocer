import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:book_grocer/config/strings_manager.dart';
import 'package:book_grocer/core/app/extensions.dart';

import '../../../../../config/color_manager.dart';
import '../../../../../config/values_manager.dart';
import '../../widgets/book_card_list.dart';
import 'search_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p20.h),
          child: BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(),
            child: Builder(builder: (context) {
              return Column(
                children: [
                  SearchBar(
                    onPressed: (searchWord) {
                      BlocProvider.of<SearchBloc>(context).add(
                        SearchButtonPressed(searchWord: searchWord!),
                      );
                    },
                  ),
                  const Expanded(child: Center(child: BodyContent()))
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final Function(String?) onPressed;

  const SearchBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool hasWord = false;
  String? searchWord;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          onChanged: (value) {
            searchWord = value;

            setState(() {
              if (!value.nullOrEmpty()) {
                hasWord = true;
              } else {
                hasWord = false;
              }
            });
          },
          decoration: InputDecoration(hintText: AppStrings.searchForBook.tr()),
        )),
        IconButton(
            onPressed: hasWord
                ? () {
                    print('pressed');
                    widget.onPressed(searchWord);
                  }
                : null,
            icon: Icon(
              Icons.search,
              color: ColorManager.primary,
            )),
      ],
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchInProgress) {
        return const CircularProgressIndicator();
      } else if (state is SearchFailed) {
        return Text(state.message.tr());
      } else if (state is SearchSuccess) {
        return BookCardList(books: state.books);
      }

      return Container();
    });
  }
}
