import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:delivery_app/src/Features/presentation/profile_detail_page/components/avatar_view.dart';
import 'package:delivery_app/src/Features/presentation/profile_detail_page/components/textfields_view.dart';
import 'package:delivery_app/src/utils/Extensions/screen_size.dart';
import 'package:delivery_app/src/utils/styles/box_decoration_shadows.dart';
import 'package:flutter/material.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        title: headerText('Edit Profile', primaryColor, 17, FontWeight.bold),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0.4,
        leading: Builder(
          builder: (BuildContext context) {
            return backButton(context, Colors.black);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.only(top: 20, right: 15),
              child: headerText('Done', orange, 17, FontWeight.w500),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.only(top: screenHeight.getScreenHeigth(context: context, multiplier: 0.1), left: 15, right: 15),
                decoration: createBoxDecorationWithShadows(),
                width: screenWidth.getScreenWidth(context: context),
                height: screenHeight.getScreenHeigth(context: context, multiplier: 0.7),
                child: Column(
                  children: [
                    Transform.translate(offset: Offset(0, -60), child: AvatarView(backgroundImage: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
                    TextfieldsProfileDetailView()
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
