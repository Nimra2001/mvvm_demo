import 'package:flutter/material.dart';
import 'package:mvvm_demo/resources/color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPress})
      : super(key: key);
  final String title;
  final bool loading;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.buttonColor,
        ),
        child: Center(
            child: loading ? CircularProgressIndicator(color: Colors.white,) : Text(
          title,
          style: const TextStyle(color: AppColors.whiteColor),
        )),
      ),
    );
  }
}
