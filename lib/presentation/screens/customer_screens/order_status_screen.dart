import 'package:algenie/data/models/user_model.dart';
import 'package:algenie/presentation/screens/customer_screens/track_order_screen.dart';
import 'package:algenie/presentation/widgets/icon_title_widget.dart';
import 'package:algenie/presentation/widgets/user_data_widget.dart';
import 'package:algenie/utils/auth_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  OrderStatusScreenState createState() => OrderStatusScreenState();
}

class OrderStatusScreenState extends State<OrderStatusScreen> {
  late User user;

  getUserData() async {
    user = (await AuthStorage().getUser())!;
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(17),
                vertical: ScreenUtil().setHeight(30)),
            child: Column(children: [
              UserDataWidget(user: user, title: 'Title'),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(25)),
                child: Text(
                  'Congrats, your order has been accepted',
                  style: TextStyle(
                    fontFamily: "Poppins-Regular",
                    fontSize: ScreenUtil().setSp(13.2),
                    color: Color(0xFF858585),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    IconTitleWidget(
                      title: 'Chat',
                      icon: Icons.chat,
                      onAction: () {},
                    ),
                    IconTitleWidget(
                      title: 'Tracking',
                      icon: Icons.track_changes,
                      onAction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrackOrderScreen(),
                          ),
                        );
                      },
                    ),
                    IconTitleWidget(
                      title: 'Info',
                      icon: Icons.info_rounded,
                      onAction: () {},
                    ),
                    IconTitleWidget(
                      title: 'Report',
                      icon: Icons.flag,
                      onAction: () {},
                    ),
                  ],
                ),
              ),
              Spacer()
            ])),
      ),
    );
  }
}
