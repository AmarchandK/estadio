import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/view/Home/widgets/current_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grounds extends StatelessWidget {
  const Grounds({super.key, required this.img, required this.tittle});
  final String img;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: .0),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                  )),
            ),
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              centerTitle: true,
              background: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
              title: Text(tittle),
            ),
            expandedHeight: heightSize(context) / 3,
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      color: wColor,
                      endIndent: 15,
                      indent: 15,
                    ),
                itemBuilder: (BuildContext context, int index) =>
                 const   CurrentLocation()),
          )
        ],
      ),
    );
  }
}
