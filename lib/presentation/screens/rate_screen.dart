import 'package:algenie/data/models/order_model.dart';
import 'package:algenie/presentation/widgets/slider_button_widget.dart';
import 'package:algenie/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateScreen extends StatefulWidget {
  final Order order;

  const RateScreen({super.key, required this.order});

  @override
  _RateScreenState createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        //SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(17),
              vertical: ScreenUtil().setHeight(30)),
          child: FutureBuilder(
            future: AuthService().getUserInfo(widget.order.customerId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              final customer = snapshot.data!;
              return Column(
                children: <Widget>[
                  //appBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Reviews",
                          textAlign: TextAlign.center,
                          //style: FontConfig.semiBold_20,
                        ),
                      ),
                      Image.asset('assets/logoCircle.png')
                    ],
                  ),
              
                  SizedBox(height: ScreenUtil().setHeight(50)),
              
                  Container(
                      height: ScreenUtil().setHeight(100),
                      width: ScreenUtil().setHeight(100),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(customer.image!)))),
                  
                  SizedBox(height: ScreenUtil().setHeight(10)),
              
                  Text(
                    customer.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil().setSp(18),
                      color: Color(0xFF252B37),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(3)),
                  Text(
                    "${customer.city!} , ${customer.country!}",
                    style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontSize: ScreenUtil().setSp(12),
                      //color: HexColor("#858585"),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(3)),
              
                  Text(
                    "${customer.name} knows these languages : ${customer.languages}",
                    style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontSize: ScreenUtil().setSp(12),
                      color: Color(0xFF858585),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        spacing: ScreenUtil().setWidth(5.3),
                        children: <Widget>[
                          Text(
                            customer.likeCount.toString(),
                            //style: FontConfig.semiBold_12
                          ),
                          Icon(
                            Icons.thumb_up_alt,
                            color: Color(0xFFAB2929),
                          )
                        ],
                      ),
                      Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          spacing: ScreenUtil().setWidth(5.3),
                          children: <Widget>[
                            Text(
                              customer.disLikeCount.toString(),
                              //style: FontConfig.semiBold_12
                            ),
                            Icon(
                              Icons.thumb_down_alt,
                              color: Color(0xFFAB2929),
                            )
                          ])
                    ],
                  ),
              
                  SizedBox(height: ScreenUtil().setHeight(20)),
              
                  Text(
                    customer.bio!,
                    style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontSize: ScreenUtil().setSp(13.2),
                      color: Color(0xFF858585),
                    ),
                  ),
              
                  SizedBox(height: ScreenUtil().setHeight(40)),
              
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Review Customer by Pressing Like or Dislike",
                          style: TextStyle(
                            fontFamily: "Poppins-Medium",
                            fontSize: ScreenUtil().setSp(15),
                            color: Color(0xFF252B37),
                          ),
                        ),
                      ),
                    ],
                  ),
              
                  SizedBox(height: ScreenUtil().setHeight(15)),
              
                  //like or dislike this customer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //like button
                      InkWell(
                        onTap: () async {
                          //Evaluate the Customer and then go to online screen
                        },
                        child: Container(
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setHeight(60),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.grey)),
                            child:
                                Icon(Icons.thumb_up_rounded, color: Colors.grey)),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(64),
                      ),
                      InkWell(
                        onTap: () async {
                          //Evaluate the Customer and then go to online screen
                        },
                        child: Container(
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setHeight(60),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.grey)),
                            child:
                                Icon(Icons.thumb_down_rounded, color: Colors.grey)),
                      ),
                    ],
                  ),
              
                  SizedBox(height: ScreenUtil().setHeight(50)),
              
                  //button
                  SliderButtonWidget(
                      label: "Report a Customer",
                      onAction: () async {
                        // go to reports screen
                      }),
              
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
