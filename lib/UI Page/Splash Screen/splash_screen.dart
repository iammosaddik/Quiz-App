import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_app/Style/app_color.dart';
import 'package:quiz_app/UI%20Page/Authentication/wellcome_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //Future add ........
  Future<void> goToScreen()async {
   await Future.delayed(const Duration(seconds: 4)).then((value) => const WellComeScreen().launch(context,isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide));
}
@override
  void initState() {
    goToScreen();
    super.initState();
  }
  //Future End .........

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                ),
                child: Lottie.asset('images/quiz.json'),
              ),
            Container(
              height: 200,
              width: 200,
                child: Lottie.asset('images/loadding.json'),
              ),
          ],
        ),
      ),
    );
  }
}
