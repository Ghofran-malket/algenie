import 'package:algenie/core/styles/app_style.dart';
import 'package:algenie/data/models/store_model.dart';
import 'package:algenie/presentation/widgets/item_card_widget.dart';
import 'package:algenie/services/customer_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class StoreDetailsScreen extends StatefulWidget {
  final Store store;
  final String distance;
  const StoreDetailsScreen(
      {super.key, required this.store, required this.distance});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF252B37),
                      size: ScreenUtil().setWidth(25),
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    widget.store.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      shadows: [AppStyle.softShowStyle],
                      color: const Color(0xFF252B37),
                    ),
                  ),
                  InkWell(
                    splashColor: Color(0xFF252B37).withValues(alpha: 0.1),
                    customBorder: const CircleBorder(),
                    onTap: () {
                      //navigate to cart screen
                    },
                    child: Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(10)),
                      child: Badge(
                        alignment: Alignment(1, -1.5),
                        backgroundColor: Color(0xFFAB2929),
                        label: Text('5'),
                        child: SizedBox(
                            width: ScreenUtil().setWidth(20),
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: SvgPicture.string(
                                '<svg viewBox="0.0 0.0 20.0 19.3" ><path transform="translate(0.0, -0.5)" d="M 19.92459678649902 8.314640045166016 C 16.70118141174316 15.14137268066406 15.65239715576172 15.14137268066406 15.02667236328125 15.14137268066406 L 8.861884117126465 15.14137268066406 C 6.702666282653809 15.14137268066406 5.048191547393799 13.87142562866211 4.646709442138672 11.90485954284668 C 4.634379863739014 11.84475135803223 3.413751602172852 5.853348255157471 3.101659059524536 4.17960786819458 C 2.948309898376465 3.358920812606812 2.558387279510498 2.811795949935913 1.155897974967957 2.811795949935913 C 0.5170716643333435 2.811795949935913 0 2.294724225997925 0 1.655897855758667 C 0 1.017071723937988 0.5170716643333435 0.5 1.155897974967957 0.5 C 3.483105182647705 0.5 4.981149196624756 1.655897855758667 5.374154090881348 3.755008220672607 C 5.683164119720459 5.411024570465088 6.899940013885498 11.38239288330078 6.912269115447998 11.44327068328857 C 7.158090591430664 12.65002822875977 8.239238739013672 12.83034706115723 8.861884117126465 12.83034706115723 L 14.72228527069092 12.83034706115723 C 15.3518648147583 12.1537618637085 16.78672027587891 9.54682731628418 17.83396148681641 7.327502727508545 C 18.10675430297852 6.750324726104736 18.79644012451172 6.50450325012207 19.37284851074219 6.775753974914551 C 19.9507942199707 7.047775745391846 20.1973876953125 7.736690521240234 19.92459678649902 8.314640045166016 Z M 8.091283798217773 15.91197109222412 C 7.02708911895752 15.91197109222412 6.164788246154785 16.77427101135254 6.164788246154785 17.83847045898438 C 6.164788246154785 18.90266609191895 7.027088165283203 19.76496505737305 8.091283798217773 19.76496505737305 C 9.155482292175293 19.76496505737305 10.01778125762939 18.90266609191895 10.01778125762939 17.83847045898438 C 10.01778125762939 16.77427101135254 9.155481338500977 15.91197109222412 8.091283798217773 15.91197109222412 Z M 15.02667236328125 15.91197109222412 C 13.96247482299805 15.91197109222412 13.10017585754395 16.77427101135254 13.10017585754395 17.83847045898438 C 13.10017585754395 18.90266609191895 13.96247482299805 19.76496505737305 15.02667236328125 19.76496505737305 C 16.09086990356445 19.76496505737305 16.95316696166992 18.90266609191895 16.95316696166992 17.83847045898438 C 16.95316696166992 16.77427101135254 16.09086990356445 15.91197109222412 15.02667236328125 15.91197109222412 Z" fill="#252b37" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                allowDrawingOutsideViewBox: true,
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                child: Text(
                  "Items",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Color(0xFFAB2929)),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: CustomerService().getItemsByStoreId(widget.store.id),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                      return SpinKitFadingCircle(
                        color: Color(0xFFAB2929),
                        size: 30,
                      );
                    }

                    final items = snapshot.data!;
                    return Scrollbar(
                        thumbVisibility: true,
                        child: GridView.builder(
                            padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.65,
                            ),
                            itemCount: items.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {},
                                  splashColor:
                                      Color(0xFF252B37).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                    ScreenUtil().setWidth(8),
                                  )),
                                  child: ItemCardWidget(
                                    item: items[index % items.length],
                                  ));
                            }),
                      );
                  }
                )
                ,
              ),
            ],
          )),
    );
  }
}
