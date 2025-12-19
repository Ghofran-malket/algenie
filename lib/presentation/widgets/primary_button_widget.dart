import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimaryButtonWidget extends StatelessWidget {
  Color? color;
  String title;
  bool isLoading;
  GestureTapCallback function;

  PrimaryButtonWidget(
      {super.key,
      required this.color,
      required this.title,
      required this.isLoading,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: FilledButton.styleFrom(
        backgroundColor: color,
        shadowColor: Color(0xFF252B37).withValues(alpha: 0.8),
        elevation: ScreenUtil().setWidth(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
        ),
        minimumSize:
            Size(double.infinity, ScreenUtil().setHeight(40)), // height
      ),
      onPressed: function,
      child: Center(
          child: isLoading
              ? SpinKitThreeBounce(
                  color: Colors.white,
                  size: 30,
                )
              : Text(
                  title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                )),
    );
  }
}
