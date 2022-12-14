
import 'package:aladdin_project/login_succece/logined_shoppingcart_page/page/locker_page.dart';
import 'package:aladdin_project/login_succece/logined_shoppingcart_page/page/purchased_page.dart';
import 'package:aladdin_project/login_succece/logined_shoppingcart_page/page/shopping_basket_page.dart';
import 'package:aladdin_project/login_succece/logined_shoppingcart_page/page/today_product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginedShoppingCartPage extends StatefulWidget {
  const LoginedShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<LoginedShoppingCartPage> createState() => _LoginedShoppingCartPageState();
}

class _LoginedShoppingCartPageState extends State<LoginedShoppingCartPage>
    with SingleTickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTabBar(),
          Expanded(child: _buildTabBarView()),

        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 30, child: Image.asset("assets/logo.png")),
            SizedBox(
              width: 20,
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onTap: () {
                      Navigator.pushNamed(context, "/search");
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200, top: 5),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, color: Colors.grey)),
              )
            ]),
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.grey),
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("?????? ???????????? ?????? ???????????????."),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("??????"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              iconSize: 25,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.blueAccent,
      indicatorWeight: 3,
      tabs: [
        Tab(child: Text(
            " ????????????", style: TextStyle(color: Colors.black, fontSize: 12))),
        Tab(child: Text(
            "?????????", style: TextStyle(color: Colors.black, fontSize: 12))),
        Tab(child: Text(
            "?????????", style: TextStyle(color: Colors.black, fontSize: 12))),
        Tab(child: Text(
            "?????? ??? ??????", style: TextStyle(color: Colors.black, fontSize: 12))),
      ],
    );
  }

  Widget _buildTabBarView() {
    return Container(
      color: Colors.black,
      child: TabBarView(
        controller: _tabController,
        children: [
          LoginedShoppingBasketPage(),
          LoginedLockerPage(),
          LoginedPurchasedPage(),
          LoginedTodayProduct(),
        ],
      ),
    );
  }
}

