import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/model/home/home_response.dart';
import 'package:estadio/view/home/widgets/ground_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroundCategory extends StatelessWidget {
  const GroundCategory(
      {super.key,
      required this.img,
      required this.tittle,
      required this.turfList});
  final String img;
  final String tittle;
  final List<Datum> turfList;

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
              itemCount: turfList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: greyColor,
                );
              },
              itemBuilder: (BuildContext context, int index) => GroundCards(
                turfList: turfList[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
