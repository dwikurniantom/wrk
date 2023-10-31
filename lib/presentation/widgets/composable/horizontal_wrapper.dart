import 'package:flutter/material.dart';

class HorizontalWrapper extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final int itemCount;
  final EdgeInsetsGeometry? padding;

  const HorizontalWrapper({
    required this.itemBuilder,
    required this.separatorBuilder,
    this.itemCount = 0,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (padding != null) {
      return Padding(
        padding: padding!,
        child: Wrap(
          children: actualWidget(context),
        ),
      );
    } else {
      return Wrap(
        children: actualWidget(context),
      );
    }
  }

  List<Widget> actualWidget(BuildContext context) {
    var separatorLength = itemCount - 1;
    var widgetLength = itemCount + separatorLength;
    var childrens = (itemCount == 0)
        ? <Widget>[]
        : List<Widget>.generate(
            widgetLength,
            (index) {
              final int itemIndex = index ~/ 2;
              final Widget widget;
              if (index.isEven) {
                widget = itemBuilder(context, itemIndex);
              } else {
                widget = separatorBuilder(context, itemIndex);
              }
              return widget;
            },
          );
    return childrens;
  }
}
