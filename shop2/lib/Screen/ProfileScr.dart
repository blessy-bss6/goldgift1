import 'package:flutter/material.dart';
import 'package:shop2/Screen/splashScr.dart';
import '../Backend/Resp/reg_login_resp.dart';
import '../Elements/baseAppbar.dart';
import '../Screen/notificationScr.dart';
import '../utils/common.dart';
import '../utils/style.dart';
import 'OrderDetScr.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            heightSizedBox(10.0),
            Text('Account Settings', style: liteHeadingTS),

            ProfileCard(
              cardText: 'Personal Information',
              icon: Icons.person_add_alt,
              onTap: () => navigationPush(context, OrderDeatilsScreen()),
            ),
            ProfileCard(
              cardText: 'Orders',
              icon: Icons.shopping_bag,
              onTap: () => navigationPush(context, OrderDeatilsScreen()),
            ),
            ProfileCard(
              cardText: 'Address & Homes',
              icon: Icons.home,
              onTap: () => navigationPush(context, NotificationScreen()),
            ),
            ProfileCard(
              cardText: 'Notifications',
              icon: Icons.notifications,
              onTap: () => navigationPush(context, NotificationScreen()),
            ),
            // heightSizedBox(10.0),
            ProfileCard(
              cardText: 'Get Help ',
              icon: Icons.help,
            ),
            ProfileCard(
              cardText: 'Abous us ',
              icon: Icons.info,
            ),
            ProfileCard(
              cardText: 'Privacy Policies ',
              icon: Icons.policy,
            ),
            ProfileCard(cardText: 'Feedback', icon: Icons.feedback),
            // heightSizedBox(10.0),
            ProfileCard(
                cardText: 'Term & Condition ', icon: Icons.policy_outlined),
            ProfileCard(
              cardText: 'Logout',
              icon: Icons.logout, onTap: (){
                  logout();
                navigationPush(context, SplashScreen());
              },
            )
            
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String cardText;
  final String? imagePath;
  final VoidCallback? onTap;
  final IconData? icon;

  ProfileCard({required this.cardText, this.icon, this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    cardText,
                    style:
                        TextStyle(fontSize: 14.0, fontFamily: montserratMedium),
                  ),
                ),
                // Image.asset(imagePath, height: 20)
                // Image.asset(profileIcon)
                Icon(
                  icon,
                  size: 20,
                  color: Colors.black38,
                )
              ],
            ),
          ),
        ),
        divider(),
      ],
    );
  }
}
