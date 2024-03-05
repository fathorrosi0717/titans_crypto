import 'package:go_router/go_router.dart';
import 'package:titans_crypto/model/coin_model.dart';
import 'package:titans_crypto/view/detailScreen/coin_detail_screen.dart';
import 'package:titans_crypto/view/onboarding/onboarding_screen.dart';
import 'package:titans_crypto/view/components/navbar.dart';

GoRouter buildRouter() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: 'onboardingScreen',
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
        name: 'navigationBars',
        path: '/navigationBars',
        builder: (context, state) => const NavigationBars()),
    GoRoute(
      name: 'coinDetailScreen',
      path: '/coinDetail',
      builder: (context, state) {
        CoinModel coin = state.extra as CoinModel;
        return CoinDetailScreen(coin: coin);
      },
    ),
  ]);
}

final router = buildRouter();
