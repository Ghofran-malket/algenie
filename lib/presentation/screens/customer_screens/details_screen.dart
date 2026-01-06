import 'package:algenie/core/models/details_data_model.dart';
import 'package:algenie/core/styles/app_style.dart';
import 'package:algenie/presentation/widgets/customer_home_bar_widget.dart';
import 'package:algenie/presentation/widgets/info_tile_widget.dart';
import 'package:algenie/presentation/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  final DetailsData data;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DetailsScreen({super.key, required this.data,required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(17)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(25),
            ),
            //appBar
            CustomerHomeBar(
              currentAddress: 'currentAddress',
              scaffoldKey: scaffoldKey,
            ),

            SizedBox(height: ScreenUtil().setHeight(20)),

            Container(
              height: ScreenUtil().setHeight(240),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(ScreenUtil().setWidth(7))),
                boxShadow: [AppStyle.softShowStyle],
                image: DecorationImage(
                  image: NetworkImage(data.image),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF252B37).withValues(alpha: 0.35),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(17)),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    data.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      shadows: [AppStyle.softShowStyle],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "\$${data.price}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF252B37)),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(12)),
                      data.discountPercentage!= null ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                          vertical: ScreenUtil().setHeight(4),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFAB2929).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${data.discountPercentage} % OFF",
                          style: TextStyle(
                            color: Color(0xFFAB2929),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ): Container()
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(16)),
                  InfoTileWidget(
                    icon: Icons.category_outlined,
                    title: "Category",
                    value: data.category,
                  ),
                  InfoTileWidget(
                    icon: Icons.store_outlined,
                    title: "Store",
                    value: data.store.name,
                  ),
                  data.expireDate!= null ? InfoTileWidget(
                    icon: Icons.schedule_outlined,
                    title: "Valid Until",
                    value:
                        "${data.expireDate!.day}/${data.expireDate!.month}/${data.expireDate!.year}",
                  ): Container(),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        shadows: [AppStyle.softShowStyle],
                        color: Color(0xFF252B37)),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(8)),
                  Text(
                    data.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: ScreenUtil().setHeight(30)),
                  PrimaryButtonWidget(
                      color: Color(0xFFAB2929),
                      title: 'Add to cart',
                      isLoading: false,
                      function: () => {
                            // TODO: navigate to store
                          }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

