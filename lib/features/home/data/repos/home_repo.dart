import 'package:bookly_app_mvvm/core/errors/failures.dart';
import 'package:bookly_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  //either failure or success
  //in the request no data needed so, no arguments..
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(String category);
}
