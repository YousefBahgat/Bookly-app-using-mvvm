import 'package:flutter/material.dart';
import 'package:bookly_app_mvvm/constants.dart';
import 'package:bookly_app_mvvm/features/home/presentation/views/widgets/custom_bookdetails_appbar.dart';
import '../../../data/models/book_model/book_model.dart';
import 'books_details_section.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /*
        responsivness is applied in this screen, if the screen size is small it will be scrollable, 
        and if its big the sizedbox will expanded and increase in height before the last section..
       */
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: kPadding30,
            child: Column(
              children: [
                const CustomBookdetailsAppbar(),
                BooksDetailsSection(book: book),
                const Expanded(child: SizedBox(height: 50)),
                const SimilarBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
