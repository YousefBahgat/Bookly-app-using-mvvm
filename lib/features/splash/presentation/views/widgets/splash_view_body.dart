import 'package:bookly_app_mvvm/core/utils/app_router.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    /*
    applying single responsibility principle that each method should be responsible
    for one thing only.
      */
    initSlidingAnimation();

    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(
        const Duration(seconds: 2, milliseconds: 500),
        /*   () => Get.to(const HomeView(),
          transition: Transition.fade, duration: kTransitionDuration), */
        () => GoRouter.of(context).push(AppRouter.kHomeView));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //make the child stretch in width and take the full width of the screen so it can be centered
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 4,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
