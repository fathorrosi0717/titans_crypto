import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:titans_crypto/main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $styles.colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    itemCount: data.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => OnboardingContent(
                        image: data[index].image,
                        title: data[index].title,
                        description: data[index].description)),
              ),
              Row(
                children: [
                  ...List.generate(
                      data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 40,
                    width: 70,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_pageIndex == data.length - 1) {
                            context.pushReplacement('/navigationBars');
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: $styles.colors.green,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/arrow.svg',
                          // ignore: deprecated_member_use
                          color: Colors.white,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive
              ? $styles.colors.green
              : $styles.colors.green.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> data = [
  Onboard(
      image: 'assets/images/onboarding1.png',
      title: 'Trade anytime anywhere',
      description:
          'Access Global Markets on the Go\nSeize Opportunities Anytime, Anywhere\nTrade Cryptocurrencies with Ease'),
  Onboard(
      image: 'assets/images/onboarding2.png',
      title: 'Save and invest at the same time',
      description:
          'Grow Your Savings While Investing\nInvest Wisely While Building Savings\nSecure Your Future with Smart Investments'),
  Onboard(
      image: 'assets/images/onboarding3.png',
      title: 'Transact fast and easy',
      description:
          'Effortless Transactions, Instant Results\nSeamless Transactions for Busy Lifestyles\nSwift and Secure Transactions Always'),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(image),
        const Spacer(),
        Text(
          title,
          style: $styles.text.headlineSmall.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: $styles.insets.md,
        ),
        Text(
          description,
          style:
              $styles.text.titleMedium.copyWith(color: const Color(0xff777777)),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
