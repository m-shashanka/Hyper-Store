import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/account.dart';
import '../screens/landingScreen.dart';
import '../screens/products_overview_screen.dart';
import '../helpers/custom_route.dart';

import '../screens/chat_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context);
    String username = authData.username;
    String url = authData.userImage;
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 22,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: url != null ? CachedNetworkImageProvider(url) : null,
                    radius: 20,
                    child: url == null ? Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ClipOval(
                        child: Image.asset('assets/images/profile_pic.png'),
                      ),
                    ) : null,
                  ),
                ),

                const SizedBox(width: 8),

                username != null ? Text('Hello $username!') : Text('Hello friend!'),
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProductsOverviewScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
              // Navigator.of(context).pushReplacement(
              //   CustomRoute(
              //     builder: (ctx) => OrdersScreen(),
              //   ),
              // );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Seller\'s Arena'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ChatScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle, size: 28,),
            title: Text('Your Account'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(Account.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              await Provider.of<Auth>(context,listen: false).newlogout();
              // Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
