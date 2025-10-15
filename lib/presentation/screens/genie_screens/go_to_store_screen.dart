import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:algenie/presentation/widgets/slider_button_widget.dart';
import 'package:algenie/presentation/widgets/order_stages_bar_widget.dart';
import 'package:algenie/presentation/widgets/order_timer_widget.dart';
import 'package:algenie/data/models/order_model.dart';
import 'package:algenie/data/models/store_model.dart';

class GoToStoreScreen extends StatelessWidget {
  final Order order;
  // final CustomerOrGenie customer;
  final Store store;
  // final int storesLength;
  GoToStoreScreen({required this.store, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //appBar
          OrderStagesBarWidget(order: order),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                height: ScreenUtil().setHeight(2),
                width: MediaQuery.of(context).size.width / 2.01,
                color: Color(0xFf252B37)),
            Container(
                height: ScreenUtil().setHeight(2),
                width: MediaQuery.of(context).size.width / 2.01,
                color: Color.fromRGBO(0, 0, 0, 0.12))
          ]),

          SizedBox(height: ScreenUtil().setHeight(20)),

          //timer
          CountdownTimerWidget(),

          SizedBox(height: ScreenUtil().setHeight(30)),

          Center(
            child: Text(
              "Go to ${store.name}",
              style: TextStyle(
                fontFamily: "Poppins-Medium",
                fontSize: 20,
                color: Color(0xFF000000),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(12),
                vertical: ScreenUtil().setHeight(17)),
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF252B37),
                  borderRadius: BorderRadius.all(Radius.circular(
                    ScreenUtil().setWidth(8),
                  )),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      offset: Offset(
                        0.0,
                        ScreenUtil().setWidth(3.0),
                      ), //(x,y)
                      blurRadius: ScreenUtil().setWidth(6.0),
                    ),
                  ],
                ),
                height: ScreenUtil().setHeight(200),
                width: ScreenUtil().setWidth(340),
                padding: EdgeInsets.all(20),
                child: store.location == null
                    ? Center(child:Text("Google map here shows store's location but the location is null", style: TextStyle(color:Colors.white),))
                    : Center(child:Text("Google map here shows store's location", style: TextStyle(color:Colors.white)))
                ),
          ),

          //items
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(12)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(
                    ScreenUtil().setWidth(8),
                  )),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      offset: Offset(
                        0.0,
                        ScreenUtil().setWidth(3.0),
                      ), 
                      blurRadius: ScreenUtil().setWidth(6.0),
                    ),
                  ],
                ),
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: store.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          store.items[index].title,
                          style: TextStyle(
                            fontFamily: "Poppins-Medium",
                            fontSize: 12,
                            color: Color(0xFF252B37),
                          ),
                        ),
                        Text(
                          store.items[index].quantity,
                          style: TextStyle(
                            fontFamily: "Poppins-Medium",
                            fontSize: 12,
                            color: Color(0xFf252B37),
                          ),
                        ),
                      ],
                    );
                  }
                ),
              
            ),
          ),

          Spacer(),
          
          SliderButtonWidget(
            label: "Go",
            onAction: () {
            },
          ),

          SizedBox(height: ScreenUtil().setHeight(30)),
        ],
      ),
    );
  }
}
