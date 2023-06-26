import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding/NewPage.dart';
import 'package:onboarding/cubit/welcome_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeCubit>(
      create: (context) => WelcomeCubit(),
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Onboarding',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              fontFamily: "RobotoFlex"),
          home: Onboarding(),
        ),
      ),
    );
  }
}

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<WelcomeCubit, WelcomeIndex>(
          builder: (context, state) => Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: controller,
                onPageChanged: (value) {
                  state.currentPage = value;
                  BlocProvider.of<WelcomeCubit>(context).changeScreenIndex();
                },
                children: [
                  _page(
                      context,
                      1,
                      "assets/images/1.png",
                      "Welcome",
                      "Consectetur excepteur minim occaecat quis cupidatat Lorem. Ad sint ullamco velit velit dolore. Voluptate qui cillum excepteur est ex reprehenderit. Et duis aliquip voluptate sit aute reprehenderit. Sunt consectetur nostrud deserunt anim velit ullamco non qui minim laboris laboris minim deserunt. Quis officia excepteur id nulla pariatur pariatur culpa. Fugiat sunt irure sunt id officia qui.",
                      "Next"),
                  _page(
                      context,
                      2,
                      "assets/images/2.png",
                      "Friendly work environment",
                      "Consectetur excepteur minim occaecat quis cupidatat Lorem. Ad sint ullamco velit velit dolore. Voluptate qui cillum excepteur est ex reprehenderit. Et duis aliquip voluptate sit aute reprehenderit. Sunt consectetur nostrud deserunt anim velit ullamco non qui minim laboris laboris minim deserunt. Quis officia excepteur id nulla pariatur pariatur culpa. Fugiat sunt irure sunt id officia qui.",
                      "Next"),
                  _page(
                      context,
                      3,
                      "assets/images/3.png",
                      "Join our team",
                      "Consectetur excepteur minim occaecat quis cupidatat Lorem. Ad sint ullamco velit velit dolore. Voluptate qui cillum excepteur est ex reprehenderit. Et duis aliquip voluptate sit aute reprehenderit. Sunt consectetur nostrud deserunt anim velit ullamco non qui minim laboris laboris minim deserunt. Quis officia excepteur id nulla pariatur pariatur culpa. Fugiat sunt irure sunt id officia qui.",
                      "Get Started"),
                ],
              ),
              Positioned(
                bottom: 20.h,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: state.currentPage,
                  decorator: DotsDecorator(
                    activeColor: const Color(0xFF41AB81),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    activeSize: const Size(15, 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _page(BuildContext context, int index, String image, String title,
      String description, String buttonTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        Image.asset(image, height: 200.h),
        SizedBox(height: 50.h),
        Text(
          title,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 30.h),
        Text(
          description,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.5)),
        ),
        SizedBox(height: 50.h),
        FilledButton.tonal(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              backgroundColor:
                  const MaterialStatePropertyAll(Color(0xFF41AB81)),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 80.w))),
          onPressed: () {
            if (index < 3) {
              controller.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewPage(),
                  ));
            }
          },
          child: Text(
            buttonTitle,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
