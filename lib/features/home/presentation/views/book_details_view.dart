import 'package:bookly_app_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_mvvm/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app_mvvm/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      widget.bookModel.volumeInfo.categories![0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BookDetailsViewBody(
      book: widget.bookModel,
    )));
  }
}
