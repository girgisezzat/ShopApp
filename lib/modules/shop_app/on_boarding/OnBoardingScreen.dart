import 'package:shop_app/modules/shop_app/login/ShopLoginScreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  var boardController = PageController();

  List<BoardingModel> boarding =
  [
    BoardingModel(
      image: 'assets/images/OnlineShop.png',
      title: 'Choose Whatever Products that you wish using ShopMarket',
      body: 'Explore',
    ),
    BoardingModel(
      image: 'assets/images/Delivery.png',
      title: 'Your Order will be shipped to you as fast as possible by our carrier',
      body: 'Shipping',
    ),
    BoardingModel(
      image: 'assets/images/Payment.png',
      title: 'Pay with the safest way possible either by cash or credit cards',
      body: 'Payment',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions:
        [
          TextButton(
            onPressed: ()
            {
              navigateAndFinish(context, ShopLoginScreen(),);
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
        title: Text(
          'Welcome to Shop App',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  }
                  else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children:
              [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.indigo,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 20,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast)
                    {
                      navigateAndFinish(context, ShopLoginScreen(),);
                    }
                    else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded  (
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
            fontSize: 20.0,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  );
}