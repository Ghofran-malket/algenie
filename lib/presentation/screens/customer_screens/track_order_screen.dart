import 'package:algenie/presentation/widgets/order_status_timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(17),
            vertical: ScreenUtil().setHeight(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.keyboard_arrow_left,
                      color: Color(0xFF252B37), size: ScreenUtil().setSp(25)),
                ),
                Expanded(
                  child: Text(
                    'Track your order',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(30)),
            OrderStatusTimeline(
                title: 'Taken',
                subtitle: 'subtitle',
                isCompleted: true,
                isFirst: true,
                icon: Icons.assignment_turned_in),
            OrderStatusTimeline(
                title: 'Go to store',
                subtitle: 'subtitle',
                isCompleted: false,
                icon: Icons.directions),
            OrderStatusTimeline(
                title: 'Arrive to store',
                subtitle: 'subtitle',
                isCompleted: false,
                icon: Icons.check_circle),
            OrderStatusTimeline(
                title: 'Pick up done',
                subtitle: 'subtitle',
                isCompleted: false,
                icon: Icons.shopping_cart_checkout),
            OrderStatusTimeline(
                title: 'Take a receipt photo',
                subtitle: 'subtitle',
                isCompleted: false,
                icon: Icons.receipt_long),
            OrderStatusTimeline(
                title: 'Coming to you',
                subtitle: 'subtitle',
                isCompleted: false,
                icon: Icons.local_shipping),
            OrderStatusTimeline(
                title: 'Delivered',
                subtitle: 'subtitle',
                isCompleted: false,
                isLast: true,
                icon: Icons.done_all),
          ],
        ),
      ),
    );
  }
}
