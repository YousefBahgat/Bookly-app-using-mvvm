import 'package:flutter/material.dart';

import 'package:bookly_app_mvvm/constants.dart';
import 'package:bookly_app_mvvm/core/utils/styles.dart';
import 'package:bookly_app_mvvm/features/home/presentation/views/widgets/newest_books_listview.dart';

import 'custom_app_bar.dart';
import 'featured_books_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: kPadding30,
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: kPadding30,
                child: Text('Newest Books', style: Styles.textstyle18),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        //expand and fill the remaining space in the screen..
        NewestBooksListView(),
      ],
    );
  }
}
