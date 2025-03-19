import 'package:bookly_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchBooksInitialStateWidget extends StatelessWidget {
  const SearchBooksInitialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        textAlign: TextAlign.center,
        'Enter some keywords to search for books..',
        style: Styles.textstyle18,
      ),
    );
  }
}
