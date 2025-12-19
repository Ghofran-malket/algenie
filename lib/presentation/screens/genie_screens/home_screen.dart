import 'dart:async';
import 'package:algenie/core/styles/app_style.dart';
import 'package:algenie/data/models/order_model.dart';
import 'package:algenie/presentation/screens/genie_screens/order_details-screen.dart';
import 'package:algenie/presentation/widgets/drawer.dart';
import 'package:algenie/presentation/widgets/order_card_widget.dart';
import 'package:algenie/providers/auth_provider.dart';
import 'package:algenie/services/api_service.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GenieHome extends StatefulWidget {
  final Order? order;
  const GenieHome({super.key, this.order});
  @override
  _GenieHomeState createState() => _GenieHomeState();
}

class _GenieHomeState extends State<GenieHome> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  bool show = false;
  bool data = true;

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings);
  }

  @override
  void initState() {
    super.initState();
    final auth = context.read<AuthProvider>();

    Future.microtask(() {
      auth.checkOnlineStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    return WillPopScope(
        onWillPop: () async {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            Navigator.of(context).pop();
            return false;
          }
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
            key: scaffoldKey,
            drawer: GenieDrawer(),
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                        'assets/background.jpg',
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                          'assets/bg-genie.png',
                        ),
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                    ),
                    child: SlidingUpPanel(
                        panel: show
                            ? loading
                                ? Center(
                                    child: SpinKitThreeBounce(
                                      color: Color(0xFFAB2929),
                                      size: 30,
                                    ),
                                  )
                                : auth.isOnline!
                                    ? _goOfflineWidget(context)
                                    : _buildGoOnlineBar()
                            : Container(),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.16),
                            offset: Offset(
                              0.0,
                              ScreenUtil().setWidth(-2.0),
                            ),
                            blurRadius: ScreenUtil().setWidth(6.0),
                          ),
                        ],
                        onPanelOpened: () {
                          setState(() {
                            show = true;
                          });
                        },
                        onPanelClosed: () {
                          setState(() {
                            show = false;
                          });
                        },
                        minHeight: ScreenUtil().setHeight(90), //146
                        maxHeight: ScreenUtil().setHeight(190), //246
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(ScreenUtil().setWidth(11)),
                            topLeft:
                                Radius.circular(ScreenUtil().setWidth(11))),
                        collapsed: loading
                            ? Center(
                                child: SpinKitThreeBounce(
                                  color: Color(0xFFAB2929),
                                  size: 30,
                                ),
                              )
                            : auth.isOnline!
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(20)),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(1.5),
                                              bottom:
                                                  ScreenUtil().setHeight(29.5)),
                                          child: SizedBox(
                                            height: ScreenUtil().setHeight(2.0),
                                            width: ScreenUtil().setWidth(43),
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFC4C4C4)),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.keyboard_arrow_up,
                                              color: Color(
                                                  0xFFED1B24), //AnimatedTextKit FadeAnimatedText
                                              size: 40,
                                              shadows: [AppStyle.softShowStyle],
                                            ),
                                            Expanded(
                                              child: AnimatedTextKit(
                                                animatedTexts: [
                                                  FadeAnimatedText(
                                                    "looking for customers",
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                      shadows: [
                                                        AppStyle.softShowStyle
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  FadeAnimatedText(
                                                    "You are online in collapsed",
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                      shadows: [
                                                        AppStyle.softShowStyle
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                                repeatForever: true,
                                              ),
                                            ),
                                            Center(
                                              child: Image.asset(
                                                'assets/look-for-customer.png',
                                                width: ScreenUtil().setWidth(48),
                                                height: ScreenUtil().setHeight(48),
                                            ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : _buildGoOnlineBar(),
                        body: Stack(children: [
                          Positioned(
                            top: ScreenUtil().setHeight(50),
                            right: ScreenUtil().setWidth(17),
                            left: ScreenUtil().setWidth(17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Container(
                                    width: ScreenUtil().setWidth(33),
                                    height: ScreenUtil().setWidth(33),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(
                                        ScreenUtil().setWidth(19),
                                      )),
                                      boxShadow: [AppStyle.softShowStyle],
                                    ),
                                    padding: EdgeInsets.all(
                                        ScreenUtil().setWidth(5)),
                                    child: Image.asset('assets/group55.png'),
                                  ),
                                ),
                                Text(
                                  'Enjoy your offers',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          shadows: [AppStyle.softShowStyle]),
                                ),
                                Builder(
                                  builder: (context) => (InkWell(
                                      onTap: () {},
                                      child: Image.asset('assets/alert.png',
                                          width: ScreenUtil().setWidth(30),
                                          height: ScreenUtil().setHeight(30)))),
                                )
                              ],
                            ),
                          ),
                          !auth.isOnline!
                              ? Container()
                              : widget.order != null
                                  ? Positioned(
                                      top: ScreenUtil().setHeight(100),
                                      right: ScreenUtil().setWidth(5),
                                      left: ScreenUtil().setWidth(5),
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  ScreenUtil().setWidth(17)),
                                          child: ElevatedButton(
                                              style: AppStyle
                                                  .primaryElevatedBtnStyle,
                                              onPressed: () async {
                                                final navigator =
                                                    Navigator.of(context);
                                                await AuthService()
                                                    .updateGenieProgress(
                                                        orderId: widget
                                                            .order!.orderId,
                                                        step: 'orderDetails');
                                                navigator.push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderDetailsScreen(
                                                              order: widget
                                                                  .order!)),
                                                );
                                              },
                                              child: OrderCardWidget(
                                                  order: widget.order!))),
                                    )
                                  : Container()
                        ]))),
              ],
            )));
  }

  Column _goOfflineWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(1.5),
              bottom: ScreenUtil().setHeight(29.5)),
          child: SizedBox(
            height: ScreenUtil().setHeight(2.0),
            width: ScreenUtil().setWidth(43),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFFC4C4C4)),
            ),
          ),
        ),
        Text(
          "You Are Online",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(shadows: [AppStyle.softShowStyle]),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(18),
              bottom: ScreenUtil().setHeight(8)),
          child: ElevatedButton(
            onPressed: () async {
              await context.read<AuthProvider>().goOffline();
            },
            style: AppStyle.secElevatedBtnStyle.copyWith(
              minimumSize: WidgetStateProperty.all(
                Size(
                  ScreenUtil().setHeight(60),
                  ScreenUtil().setHeight(60),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(Color(0xFFAB2929)),
              shape: WidgetStateProperty.all(CircleBorder()),
            ),
            child: Icon(
              Icons.power_settings_new,
              size: ScreenUtil().setHeight(40),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "Go Offline",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(shadows: [AppStyle.softShowStyle]),
        ),
      ],
    );
  }

  _buildGoOnlineBar() {
    return Container(
      height: ScreenUtil().setHeight(90),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(ScreenUtil().setWidth(11)),
            topLeft: Radius.circular(ScreenUtil().setWidth(11))),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.16),
            offset: Offset(
              0.0,
              ScreenUtil().setWidth(-2.0),
            ), //(x,y)
            blurRadius: ScreenUtil().setWidth(6.0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(1.5),
                  bottom: ScreenUtil().setHeight(29.5)),
              child: SizedBox(
                height: ScreenUtil().setHeight(2.0),
                width: ScreenUtil().setWidth(43),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFFC4C4C4)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "You Are Offline",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(shadows: [AppStyle.softShowStyle]),
                ),
                InkWell(
                  onTap: () async {
                    // genieBloc.add(
                    //   GoOnlineRequested(
                    //     lat: _initialPosition!.latitude,
                    //     long: _initialPosition!.longitude,
                    //   ),
                    // );
                    //genieRepository.updateGenieLocation();
                    await context
                        .read<AuthProvider>()
                        .goOnline(currentLocation: await getCurrentLocation());
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(126),
                    height: ScreenUtil().setHeight(33),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFAB2929),
                        width: ScreenUtil().setWidth(1.5),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(
                        ScreenUtil().setWidth(8),
                      )),
                      color: Colors.white,
                      boxShadow: [AppStyle.softShowStyle],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.power_settings_new,
                          color: Color(0xFFAB2929),
                          size: ScreenUtil().setWidth(18),
                          shadows: [AppStyle.softShowStyle],
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(4),
                        ),
                        Text(
                          "Go Online",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Color(0xFFAB2929),
                            shadows: [AppStyle.softShowStyle],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
