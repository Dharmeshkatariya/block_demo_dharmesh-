import 'package:block_demo_dharmesh/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CardGridCustomAnimation extends StatefulWidget {
  const CardGridCustomAnimation({super.key, required this.widgetList});
  final List<Widget> widgetList;

  @override
  State<CardGridCustomAnimation> createState() =>
      _CardGridCustomAnimationState();
}

class _CardGridCustomAnimationState extends State<CardGridCustomAnimation> {
  @override
  Widget build(BuildContext context) {
    var columnCount = 2;

    return AnimationLimiter(
      child: GridView.count(
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 2.h,
          mainAxisSpacing: 2.w,
          crossAxisCount: columnCount,
          childAspectRatio: MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.height *
              1.7,
          children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: MediaQuery.of(context).size.width / 2,
                child: FadeInAnimation(child: widget),
              ),
              children: widget.widgetList)),
    );
  }
}
