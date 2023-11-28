


import 'package:flutter/material.dart';

class SimpleScrollView extends StatefulWidget {
  final Widget child;
  final Axis scrollDirection;
  final EdgeInsets scrollPadding;
  const SimpleScrollView({super.key, required this.child,
  required this.scrollPadding,
  this.scrollDirection=Axis.vertical});

  @override
  State<SimpleScrollView> createState() => _SimpleScrollViewState();
}

class _SimpleScrollViewState extends State<SimpleScrollView> {


  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget child = SingleChildScrollView(

      physics: AlwaysScrollableScrollPhysics(),
      controller: scrollController,
      scrollDirection: widget.scrollDirection,
      child: Padding(
        padding: widget.scrollPadding,
        child: widget.child,
      ),
    );

    return child;

    return Scrollbar(
      trackVisibility: true,
        thumbVisibility: true,
        controller: scrollController,
        child: child);
  }
}
