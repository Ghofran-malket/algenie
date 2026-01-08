import 'package:algenie/core/styles/app_style.dart';
import 'package:algenie/data/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class StoreCardWidget extends StatelessWidget {
  final Store store;
  final Position initialPosition;
  final String distance;
  const StoreCardWidget(
      {super.key,
      required this.store,
      required this.initialPosition,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Color(0xFF252B37).withValues(alpha: 0.1),
      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8),)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ScreenUtil().setHeight(130),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8))),
                image: DecorationImage(
                  image: NetworkImage(store.image),
                  fit: BoxFit.cover,
                ),
                boxShadow: [AppStyle.softShowStyle],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(5),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  store.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Color(0xFF252B37)),
                ),
                Text(
                  double.parse(distance) < 1 ? 
                  '${(double.parse(distance)*1000).toInt()} M' : '$distance KM',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Color(0xFF252B37)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Open at : ${store.openAt}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Color(0xFF252B37)),
                ),
                Text(
                  "Close at : ${store.closeAt}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Color(0xFF252B37)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
