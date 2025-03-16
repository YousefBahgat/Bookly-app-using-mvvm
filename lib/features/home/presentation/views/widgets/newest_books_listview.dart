import 'package:bookly_app_mvvm/core/utils/widgets/custom_err_widget.dart';
import 'package:bookly_app_mvvm/core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookly_app_mvvm/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_mvvm/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: BookListViewItem(
                    book: state.books[index],
                  ),
                );
              },
              childCount: state.books.length, // Number of items
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
              child: CustomErrWidget(errMessage: state.errMessage));
        } else {
          return const SliverToBoxAdapter(
            child: CustomLoadingIndicator(),
          );
        }
      },
    );
  }
}
