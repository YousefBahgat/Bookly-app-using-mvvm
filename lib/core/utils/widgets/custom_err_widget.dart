import 'package:bookly_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrWidget extends StatelessWidget {
  const CustomErrWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles.textstyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
