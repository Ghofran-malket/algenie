import 'package:algenie/core/styles/app_style.dart';
import 'package:algenie/presentation/screens/customer_screens/details_screen.dart';
import 'package:algenie/presentation/screens/customer_screens/store_details_screen.dart';
import 'package:algenie/presentation/widgets/customer_home_bar_widget.dart';
import 'package:algenie/presentation/widgets/store_card_widget.dart';
import 'package:algenie/providers/item_provider.dart';
import 'package:algenie/providers/offer_provider.dart';
import 'package:algenie/providers/store_provider.dart';
import 'package:algenie/providers/sub_items_provider.dart';
import 'package:algenie/services/customer_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _current = 0;

  @override
  void initState() {
    super.initState();

    final storeProvider = Provider.of<StoreProvider>(context, listen: false);
    Future.microtask(() {
      storeProvider.fetchStores();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OfferProvider()..fetchOffers()),
        ChangeNotifierProvider(create: (_) => ItemProvider()..fetchItems()),
      ],
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) async {
          SystemNavigator.pop();
        },
        child: Scaffold(
          key: _scaffoldKey,
          body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(17)),
              child: ListView(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  //appBar
                  CustomerHomeBar(
                      scaffoldKey: _scaffoldKey,
                      currentAddress: 'currentAddress'),

                  SizedBox(height: ScreenUtil().setHeight(20)),

                  Text('What would you like to order ?',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        shadows: [AppStyle.softShowStyle],
                      )),
                  SizedBox(height: ScreenUtil().setHeight(10)),

                  Text('New offres',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          shadows: [AppStyle.softShowStyle],
                          color: Colors.black54)),
                  SizedBox(height: ScreenUtil().setHeight(5)),

                  SizedBox(
                    height: ScreenUtil().setHeight(120),
                    child: Consumer<OfferProvider>(
                        builder: (context, provider, _) {
                      if (provider.isLoading) {
                        return SpinKitFadingCircle(
                          color: Color(0xFFAB2929),
                          size: 30,
                        );
                      }

                      final offersList = provider.offers;
                      return ListView.builder(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: offersList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              splashColor:
                                  Color(0xFF252B37).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.all(Radius.circular(
                                ScreenUtil().setWidth(7),
                              )),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                        data: offersList[index],
                                        scaffoldKey: _scaffoldKey),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(5),
                                width: ScreenUtil().setHeight(100),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          ScreenUtil().setWidth(7))),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(offersList[index].image),
                                    fit: BoxFit.fill,
                                    colorFilter: ColorFilter.mode(
                                      Color(0xFF252B37).withValues(alpha: 0.2),
                                      BlendMode.darken,
                                    ),
                                  ),
                                  boxShadow: [AppStyle.softShowStyle],
                                ),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    offersList[index].title,
                                    overflow: TextOverflow.clip,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(30)),

                  Text('Pick Your Items quickly',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          shadows: [AppStyle.softShowStyle],
                          color: Colors.black54)),
                  SizedBox(height: ScreenUtil().setHeight(15)),

                  Consumer<ItemProvider>(builder: (context, provider, _) {
                    if (provider.isLoading) {
                      return SpinKitFadingCircle(
                        color: Color(0xFFAB2929),
                        size: 30,
                      );
                    }
                    final itemsList = provider.items;
                    return Column(
                      children: [
                        CarouselSlider(
                          items: itemsList
                              .map(
                                (item) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                            data: item,
                                            scaffoldKey: _scaffoldKey),
                                      ),
                                    );
                                  },
                                  splashColor:
                                      Color(0xFF252B37).withValues(alpha: 0.1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(
                                    ScreenUtil().setWidth(7),
                                  )),
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ScreenUtil().setWidth(10)),
                                      margin: EdgeInsets.all(
                                          ScreenUtil().setHeight(10)),
                                      height: ScreenUtil().setHeight(130),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(
                                          ScreenUtil().setWidth(7),
                                        )),
                                        image: DecorationImage(
                                          image: NetworkImage(item.image),
                                          fit: BoxFit.contain,
                                        ),
                                        boxShadow: [AppStyle.softShowStyle],
                                      )),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                            height: ScreenUtil().setHeight(140),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: itemsList.map((item) {
                            int index = itemsList.indexOf(item);
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [AppStyle.softShowStyle],
                                color: _current == index
                                    ? Color(0xFFAB2929)
                                    : Color(0xFF252B37).withValues(alpha: 0.3),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }),

                  SizedBox(height: ScreenUtil().setHeight(20)),

                  Text('What’s Near You?',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          shadows: [AppStyle.softShowStyle],
                          color: Colors.black54)),
                  SizedBox(height: ScreenUtil().setHeight(15)),

                  Consumer<StoreProvider>(builder: (context, provider, _) {
                    if (provider.isLoading) {
                      return SpinKitFadingCircle(
                        color: Color(0xFFAB2929),
                        size: 30,
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.nearbyStores.length,
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(0)),
                      itemBuilder: (context, index) {
                        final store = provider.nearbyStores[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                  create: (_) =>
                                      ItemsSubProvider(storeId: store.store.id),
                                  child: StoreDetailsScreen(
                                    store: store.store,
                                    distance: store.distance,
                                  ),
                                ),
                              ),
                            );
                          },
                          splashColor: Color(0xFF252B37).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.all(Radius.circular(
                            ScreenUtil().setWidth(8),
                          )),
                          child: StoreCardWidget(
                              store: store.store,
                              distance: store.distance,
                              initialPosition: store.store.location!),
                        );
                      },
                    );
                  }),
                ],
              )),
        ),
      ),
    );
  }
}
