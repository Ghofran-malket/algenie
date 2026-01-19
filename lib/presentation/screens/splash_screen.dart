import 'package:algenie/presentation/screens/welcome_screen.dart';
import 'package:algenie/providers/auth_provider.dart';
import 'package:algenie/startup_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Consumer<AuthProvider>(builder: (context, auth, _) {
      //if authenticated go to start up screen
      return auth.isLoggedIn
          ? StartupWidget()
          //else go to welcome screen
          : Center(
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
            );
    }));
  }
}
