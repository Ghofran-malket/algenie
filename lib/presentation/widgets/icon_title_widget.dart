import 'package:algenie/core/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTitleWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function onAction;
  const IconTitleWidget({super.key, required this.title, required this.icon, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onAction,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8))),
            boxShadow: [AppStyle.softShowStyle],
          ),
          padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
          margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
          child: Column(
            children: [
              Icon(icon, color: Color(0xFF252B37)),
              Text(
                title,
                softWrap: true,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Color(0xFF252B37)),
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
