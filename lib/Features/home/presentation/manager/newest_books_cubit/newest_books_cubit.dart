import 'package:clean_arc_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  final List<BookEntity> _books = [];

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
      _books.clear();
    } else {
      emit(NewestBooksPaginationLoading());
    }

    final result = await fetchNewestBooksUseCase.call(pageNumber);

    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailure(failure.message));
      } else {
        emit(NewestBooksPaginationFailure(failure.message));
      }
    }, (books) {
      if (pageNumber == 0) {
        _books.clear();
      }
      _books.addAll(books);
      emit(NewestBooksSuccess(List<BookEntity>.from(_books)));
    });
  }
}
