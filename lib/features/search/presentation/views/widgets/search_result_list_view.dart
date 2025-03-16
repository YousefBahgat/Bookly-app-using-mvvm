import 'package:flutter/material.dart';

/* import '../../../../home/presentation/views/widgets/book_list_view_item.dart'; */

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.zero, // remove the extra default padding
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          /* child: BookListViewItem(), */
          child: Text('Hello'),
        );
      },
    );
  }
}
