import 'package:bitcoin_checker/assets/constants.dart';
import 'package:bitcoin_checker/services/exchangeRates.dart';
import 'package:bitcoin_checker/widgets/coinCard.dart';
import 'package:bitcoin_checker/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/coin.dart';

Coin coin = Coin();

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String resultBTC = '?';
  String resultETH = '?';
  String resultDOGE = '?';

  String selectedValue = '?';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CoinCard(
                    text: 'BTC = $resultBTC $selectedValue',
                  ),
                  CoinCard(
                    text: 'ETH = $resultETH $selectedValue',
                  ),
                  CoinCard(
                    text: 'DOGE = $resultDOGE $selectedValue',
                  ),
                ],
              ),
              CustomButton(
                label: 'Exchange Rates',
                onPress: () async {
                  resultBTC = await exchangeRates('BTC', selectedValue);
                  resultETH = await exchangeRates('ETH', selectedValue);
                  resultDOGE = await exchangeRates('DOGE', selectedValue);

                  setState(() {});
                },
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: kContentBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: CupertinoPicker(
                      looping: true,
                      itemExtent: 32,
                      onSelectedItemChanged: (value) {
                        selectedValue = coin.currencies[value];
                      },
                      children: [
                        for (int i = 0; i < coin.currencies.length; i++) ...[
                          Text(
                            coin.currencies[i],
                            style: kTextStyle.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
