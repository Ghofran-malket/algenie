import 'package:algenie/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //if Authenticated then
    //  if genie then go to genie home
    // if genie is busy with order go to order details page
    //  if customer then go to customer home
    //if not authenticated go to first route

    return Scaffold(
        body: Center(
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const WelcomeScreen(),
            ),
          )
        },
        child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/algenie_logo.png')),
      ),
    ));
  }
}
