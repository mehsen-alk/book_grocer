import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/app/di.dart';
import '../../../data/models/requests.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/repository/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository = instance<SearchRepository>();

  SearchBloc() : super(SearchInitial()) {
    on<SearchButtonPressed>((event, emit) async {
      emit(SearchInProgress());
      (await _repository.searchForBook(
              SearchFooBookRequest(searchWord: event.searchWord)))
          .fold((failure) {
        emit(SearchFailed(message: failure.message));
      }, (books) {
        emit(SearchSuccess(books: books));
      });
    });

    // * for test
    // on<SearchButtonPressed>((event, emit) {
    //   List<Book> books = [
    //     Book(
    //         title: 'Atomic Habits',
    //         subtitle:
    //             'An Easy & Proven Way to Build Good Habits & Break Bad Ones',
    //         authors: ['James Clear'],
    //         description:
    //             'The #1 New York Times bestseller. Over 4 million copies sold! Tiny Changes, Remarkable Results No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world\'s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results. If you\'re having trouble changing your habits, the problem isn\'t you. The problem is your system. Bad habits repeat themselves again and again not because you don\'t want to change, but because you have the wrong system for change. You do not rise to the level of your goals. You fall to the level of your systems. Here, you\'ll get a proven system that can take you to new heights. Clear is known for his ability to distill complex topics into simple behaviors that can be easily applied to daily life and work. Here, he draws on the most proven ideas from biology, psychology, and neuroscience to create an easy-to-understand guide for making good habits inevitable and bad habits impossible. Along the way, readers will be inspired and entertained with true stories from Olympic gold medalists, award-winning artists, business leaders, life-saving physicians, and star comedians who have used the science of small habits to master their craft and vault to the top of their field. Learn how to: • make time for new habits (even when life gets crazy); • overcome a lack of motivation and willpower; • design your environment to make success easier; • get back on track when you fall off course; ...and much more. Atomic Habits will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal.',
    //         pageCount: 320,
    //         categories: ["Business & Economics"],
    //         averageRating: 4,
    //         thumbnail:
    //             "http://books.google.com/books/content?id=XfFvDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"),
    //     Book(
    //         title: 'The Little Book of Game of Thrones Facts',
    //         subtitle: '',
    //         authors: [],
    //         description:
    //             'The Fact Bomb Company proudly presents the Little Book of Game of Thrones Facts.We have complied the ultimate list of Game of Thrones facts covering the books, television series, major houses, key organizations, religions, history and more! This book makes a fine addition to the collection of any Game of Thrones fan and will provide plenty of unbelievable facts to impress family, friends or work colleagues. In the spirit of House Stark, "THE FACTS ARE COMING!"',
    //         pageCount: 113,
    //         categories: ["Fiction"],
    //         averageRating: 2.2,
    //         thumbnail:
    //             "http://books.google.com/books/content?id=rwR6DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
    //     Book(
    //         title: 'Atomic Habits',
    //         subtitle:
    //             'An Easy & Proven Way to Build Good Habits & Break Bad Ones',
    //         authors: ['James Clear', 'James Clear'],
    //         description:
    //             'The #1 New York Times bestseller. Over 4 million copies sold! Tiny Changes, Remarkable Results No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world\'s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results. If you\'re having trouble changing your habits, the problem isn\'t you. The problem is your system. Bad habits repeat themselves again and again not because you don\'t want to change, but because you have the wrong system for change. You do not rise to the level of your goals. You fall to the level of your systems. Here, you\'ll get a proven system that can take you to new heights. Clear is known for his ability to distill complex topics into simple behaviors that can be easily applied to daily life and work. Here, he draws on the most proven ideas from biology, psychology, and neuroscience to create an easy-to-understand guide for making good habits inevitable and bad habits impossible. Along the way, readers will be inspired and entertained with true stories from Olympic gold medalists, award-winning artists, business leaders, life-saving physicians, and star comedians who have used the science of small habits to master their craft and vault to the top of their field. Learn how to: • make time for new habits (even when life gets crazy); • overcome a lack of motivation and willpower; • design your environment to make success easier; • get back on track when you fall off course; ...and much more. Atomic Habits will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal.',
    //         pageCount: 320,
    //         categories: ["Business & Economics"],
    //         averageRating: 4.5,
    //         thumbnail:
    //             "http://books.google.com/books/content?id=XfFvDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"),
    //     Book(
    //         title: 'The Little Book of Game of Thrones Facts',
    //         subtitle: '',
    //         authors: [],
    //         description:
    //             'The Fact Bomb Company proudly presents the Little Book of Game of Thrones Facts.We have complied the ultimate list of Game of Thrones facts covering the books, television series, major houses, key organizations, religions, history and more! This book makes a fine addition to the collection of any Game of Thrones fan and will provide plenty of unbelievable facts to impress family, friends or work colleagues. In the spirit of House Stark, "THE FACTS ARE COMING!"',
    //         pageCount: 113,
    //         categories: ["Fiction"],
    //         averageRating: 1.9,
    //         thumbnail:
    //             "http://books.google.com/books/content?id=rwR6DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
    //   ];

    //   emit(SearchSuccess(books: books));
    // });
  }
}
