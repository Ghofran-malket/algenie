import 'package:algenie/core/styles/app_style.dart';
import 'package:algenie/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCardWidget extends StatelessWidget {
  final Item item;
  const ItemCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: ScreenUtil().setHeight(130),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8))),
              image: DecorationImage(
                image: NetworkImage(item.image),
                fit: BoxFit.cover,
              ),
              boxShadow: [AppStyle.softShowStyle],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Text(
            item.title,
            softWrap: true,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Color(0xFF252B37),),
            textAlign: TextAlign.center,
          ),
          Text(
            "${item.price}\$",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Color(0xFFAB2929)),
          ),
        ],
      ),
    );
  }
}
