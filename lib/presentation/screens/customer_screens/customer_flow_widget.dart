import 'package:algenie/presentation/screens/customer_screens/home_screen.dart';
import 'package:algenie/presentation/screens/customer_screens/order_inprogress_screen.dart';
import 'package:algenie/providers/customer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CustomerFlowWidget extends StatelessWidget {
  const CustomerFlowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => CustomerProvider()..loadCustomerOrder()),
        ],
        child: Consumer<CustomerProvider>(builder: (context, provider, _) {
          if (provider.isLoading) {
            return SpinKitFadingCircle(
              color: Color(0xFFAB2929),
              size: 30,
            );
          }
          print('the order status is ${provider.order!.orderStatus.toString()}');
          //if customer has no order yet, or his order has beeen delivered
          if (provider.order == null ||
              provider.order!.orderStatus == 'delivered') {
            return CustomerHomeScreen();
          }
          //if his order has beeen taken
          if (provider.order!.orderStatus == 'taken') {
            return OrderInProgressScreen();
          }
          //if his order is in process mode
          if ([
            'unpublished',
            'published',
            'matching',
            'pending',
            'rejected',
            'canceled'
          ].contains(provider.order!.orderStatus)) {
            return Scaffold(
              body: Text('Looking for genie'),
            );
          }
          return CustomerHomeScreen();
        }),
      ),
    );
  }
}
