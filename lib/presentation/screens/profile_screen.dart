import 'package:algenie/core/styles/app_style.dart';
import 'package:algenie/data/models/order_model.dart';
import 'package:algenie/presentation/screens/chat_screen.dart';
import 'package:algenie/presentation/screens/genie_screens/report_a_problem_screen.dart';
import 'package:algenie/presentation/widgets/slider_button_widget.dart';
import 'package:algenie/presentation/widgets/user_data_widget.dart';
import 'package:algenie/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  final Order? order;
  final String userId;

  const ProfileScreen({super.key, this.order, required this.userId});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(17),
            vertical: ScreenUtil().setHeight(30)),
        child: FutureBuilder(
            future: AuthService().getUserInfo(userId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              var user = snapshot.data!;
              return Column(
                children: [
                  UserDataWidget(
                    user: user,
                    title: 'Profile',
                  ),

                  Spacer(),

                  //if genie has order then there is a call and chat button with customer
                  // then the userId is customerId
                  order != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //like button
                            ElevatedButton(
                                onPressed: () {
                                  _makePhoneCall(user.number);
                                },
                                style: AppStyle.secElevatedBtnStyle.copyWith(
                                  minimumSize: WidgetStateProperty.all(
                                    Size(
                                      ScreenUtil().setHeight(60),
                                      ScreenUtil().setHeight(60),
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                      Color(0xFFAB2929).withAlpha(50)),
                                  shape:
                                      WidgetStateProperty.all(CircleBorder()),
                                ),
                                child: Icon(
                                  Icons.call,
                                  color: Color(0xFFAB2929),
                                  size: 25,
                                )),

                            SizedBox(
                              width: ScreenUtil().setWidth(64),
                            ),

                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (context) =>
                                          ChatScreen(order: order!),
                                    ),
                                  );
                                },
                                style: AppStyle.secElevatedBtnStyle.copyWith(
                                  minimumSize: WidgetStateProperty.all(
                                    Size(
                                      ScreenUtil().setHeight(60),
                                      ScreenUtil().setHeight(60),
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                      Color(0xFFAB2929).withAlpha(50)),
                                  shape:
                                      WidgetStateProperty.all(CircleBorder()),
                                ),
                                child: Icon(
                                  Icons.chat,
                                  color: Color(0xFFAB2929),
                                  size: 25,
                                )),
                          ],
                        )
                      : Container(),
                  SizedBox(height: ScreenUtil().setHeight(50)),

                  //button
                  //if genie has order then there is a sliderbutton
                  order != null
                      ? SliderButtonWidget(
                          label: "Report a Customer",
                          onAction: () async {
                            // go to reports screen
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => ReportAProblemScreen(
                                  order: order!,
                                ),
                              ),
                            );
                          })
                      : Container(),
                ],
              );
            }),
      ),
    );
  }
}
