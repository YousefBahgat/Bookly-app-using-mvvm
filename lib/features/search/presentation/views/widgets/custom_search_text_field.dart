import 'package:bookly_app_mvvm/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});
  final TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchBarController,
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: Opacity(
          opacity: .8,
          child: IconButton(
            onPressed: () {
              BlocProvider.of<SearchBooksCubit>(context).searchForBooks(
                  searchText: searchBarController.text.isEmpty
                      ? 'General'
                      : searchBarController.text);
            },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
          ),
        ),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  /*  VoidCallback? _buildSearchCallback(BuildContext context) {
    if (searchBarController.text.isEmpty) {
      return null; // Disable the button if the text field is empty
    }
    return () {
      BlocProvider.of<SearchBooksCubit>(context)
          .searchForBooks(searchText: searchBarController.text);
    };
  } */

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
