import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderStatusTimeline extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isFirst;
  final bool isLast;
  final IconData icon;

  const OrderStatusTimeline(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isCompleted,
      this.isFirst = false,
      this.isLast = false,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        alignment: TimelineAlign.start,
        indicatorStyle: IndicatorStyle(
          width: ScreenUtil().setWidth(20),
          color: isCompleted ? Color(0xFFAB2929) : Colors.grey[700]!,
          iconStyle: isCompleted
              ? IconStyle(
                  iconData: Icons.check,
                  color: Colors.white,
                )
              : null,
        ),
        beforeLineStyle: LineStyle(
          color: isCompleted ? Color(0xFFAB2929) : Color(0xFF252B37).withValues(alpha: 0.7),
          thickness: 2,
        ),
        endChild: Padding(
            padding: EdgeInsets.symmetric(
              vertical:  ScreenUtil().setHeight(16),
              horizontal: ScreenUtil().setWidth(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon, size: ScreenUtil().setWidth(35), color: Color(0xFF252B37).withValues(alpha: 0.7),),
                SizedBox(width:  ScreenUtil().setWidth(20),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: isCompleted ? Colors.black : Color(0xFF252B37),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF252B37),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
