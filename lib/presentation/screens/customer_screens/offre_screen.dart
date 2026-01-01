import 'package:algenie/core/styles/app_style.dart';
import 'package:algenie/data/models/offer_model.dart';
import 'package:algenie/presentation/widgets/customer_home_bar_widget.dart';
import 'package:algenie/presentation/widgets/info_tile_widget.dart';
import 'package:algenie/presentation/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferDetailsScreen extends StatelessWidget {
  final Offer offer;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const OfferDetailsScreen({super.key, required this.offer,required this.scaffoldKey});

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
                  image: NetworkImage(offer.image),
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
                    offer.title,
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
                        "\$${offer.price}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF252B37)),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(12)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                          vertical: ScreenUtil().setHeight(4),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFAB2929).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${offer.discountPercentage} % OFF",
                          style: TextStyle(
                            color: Color(0xFFAB2929),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(16)),
                  InfoTileWidget(
                    icon: Icons.category_outlined,
                    title: "Category",
                    value: offer.category,
                  ),
                  InfoTileWidget(
                    icon: Icons.store_outlined,
                    title: "Store",
                    value: offer.storeId,
                  ),
                  InfoTileWidget(
                    icon: Icons.schedule_outlined,
                    title: "Valid Until",
                    value:
                        "${offer.expireDate.day}/${offer.expireDate.month}/${offer.expireDate.year}",
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        shadows: [AppStyle.softShowStyle],
                        color: Color(0xFF252B37)),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(8)),
                  Text(
                    offer.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: ScreenUtil().setHeight(30)),
                  PrimaryButtonWidget(
                      color: Color(0xFFAB2929),
                      title: 'Order from this store',
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

