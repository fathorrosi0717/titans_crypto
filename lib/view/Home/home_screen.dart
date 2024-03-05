import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:titans_crypto/bloc/coin/coin_bloc.dart';
import 'package:titans_crypto/main.dart';
import 'package:titans_crypto/view/components/coin_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<CoinsBloc>(context).add(GetCoins());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          CircleAvatar(
            child: Image.asset('assets/images/avatar.png'),
          ),
          SizedBox(
            width: $styles.insets.sm,
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 221,
              child: ListView(
                padding: EdgeInsets.only(
                    left: $styles.insets.md, top: $styles.insets.md),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 207,
                    width: 337,
                    decoration: BoxDecoration(
                        color: $styles.colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: $styles.insets.sm,
                          top: $styles.insets.sm,
                          right: $styles.insets.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Wallet',
                            style: $styles.text.titleMedium,
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Text(
                            'Balance',
                            style: $styles.text.bodyLarge,
                          ),
                          Text(
                            '\$1357.00',
                            style: $styles.text.headlineLarge,
                          ),
                          Text(
                            '/usd',
                            style: $styles.text.bodyMedium,
                          ),
                          SizedBox(
                            height: $styles.insets.sm,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.monetization_on,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Deposit',
                                    style: $styles.text.labelSmall,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.money_off,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Withdraw',
                                    style: $styles.text.labelSmall,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'More',
                                    style: $styles.text.labelLarge,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: $styles.insets.sm,
                  ),
                  Container(
                    height: 207,
                    width: 337,
                    decoration: BoxDecoration(
                        color: $styles.colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: $styles.insets.sm,
                          top: $styles.insets.sm,
                          right: $styles.insets.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Wallet',
                            style: $styles.text.titleMedium,
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Text(
                            'Balance',
                            style: $styles.text.bodyLarge,
                          ),
                          Text(
                            '\$1357.00',
                            style: $styles.text.headlineLarge,
                          ),
                          Text(
                            '/usd',
                            style: $styles.text.bodyMedium,
                          ),
                          SizedBox(
                            height: $styles.insets.sm,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.monetization_on,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Deposit',
                                    style: $styles.text.labelSmall,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.money_off,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Withdraw',
                                    style: $styles.text.labelSmall,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'More',
                                    style: $styles.text.labelLarge,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: $styles.insets.sm,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'For You',
                style: $styles.text.titleLarge
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: $styles.insets.md,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    height: 119,
                    width: 119,
                    decoration: BoxDecoration(
                        color: $styles.colors.green,
                        borderRadius: BorderRadius.circular(17)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.school,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: $styles.insets.sm,
                        ),
                        Text(
                          'Learn Crypto\nEarn Crypto',
                          style: $styles.text.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    height: 119,
                    width: 119,
                    decoration: BoxDecoration(
                        color: const Color(0xFF333333),
                        borderRadius: BorderRadius.circular(17)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: $styles.insets.sm,
                        ),
                        Text(
                          'BCA\nSimulation',
                          style: $styles.text.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    height: 119,
                    width: 119,
                    decoration: BoxDecoration(
                        color: const Color(0xFF333333),
                        borderRadius: BorderRadius.circular(17)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: $styles.insets.sm,
                        ),
                        Text(
                          'Join\nCommunity',
                          style: $styles.text.bodyMedium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Popular Cryptos',
                style: $styles.text.titleLarge
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: $styles.insets.md,
            ),
            BlocBuilder<CoinsBloc, CoinsState>(builder: (context, state) {
              if (state is CoinsLoading) {
                return Center(
                  child: CircularProgressIndicator(color: $styles.colors.green),
                );
              } else if (state is CoinsLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.coins.length,
                  itemBuilder: (context, index) {
                    return CoinCard(width: width, coin: state.coins[index]);
                  },
                );
              } else if (state is CoinsError) {
                return Center(
                    child: Text(
                  state.error.toString(),
                  style: $styles.text.bodyMedium,
                ));
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      )),
    );
  }
}
