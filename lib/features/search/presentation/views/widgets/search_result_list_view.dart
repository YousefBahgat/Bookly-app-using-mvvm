import 'package:bookly_app_mvvm/core/utils/widgets/custom_err_widget.dart';
import 'package:bookly_app_mvvm/core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookly_app_mvvm/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app_mvvm/features/search/presentation/views/widgets/search_books_initial_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksInitial) {
          return const SearchBooksInitialStateWidget();
        } else if (state is SearchBooksSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            padding: EdgeInsets.zero, // remove the extra default padding
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,
                        extra: state.books[index]);
                  },
                  child: BookListViewItem(
                    book: state.books[index],
                  ),
                ),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
