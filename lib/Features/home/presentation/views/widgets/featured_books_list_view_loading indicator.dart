import 'package:clean_arc_bookly_app/Features/home/presentation/views/widgets/custom_book_image_loading_indecator.dart';
import 'package:clean_arc_bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
