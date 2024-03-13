import 'package:flutter/material.dart';

///
///created time: 2019-06-25 16:42
///author linzhiliang
///version 1.5.0
///since
///file name: toast_content_widget.dart
///description: Toast with icon
///
class IconToastWidget extends StatelessWidget {
  final Color? backgroundColor;
  final String? message;
  final Widget? textWidget;
  final double? height;
  final double? width;
  final String? assetName;
  final EdgeInsetsGeometry? padding;

  IconToastWidget({
    super.key,
    this.backgroundColor,
    this.textWidget,
    this.message,
    this.height,
    this.width,
    @required this.assetName,
    this.padding,
  });

  factory IconToastWidget.fail({String? msg}) => IconToastWidget(
        message: msg,
        assetName: 'assets/icons/01.png',
      );

  factory IconToastWidget.success({String? msg}) => IconToastWidget(
        message: msg,
        assetName: 'assets/icons/01.png',
      );

  @override
  Widget build(BuildContext context) {
    Widget content = Material(
      color: Colors.transparent,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50.0),
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 17.0),
          decoration: ShapeDecoration(
            color: backgroundColor ?? const Color(0x9F000000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(
                  assetName!,
                  fit: BoxFit.fill,
                  width: 30,
                  height: 30,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: textWidget ??
                    Text(
                      message ?? '',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.titleLarge!.fontSize,
                          color: Colors.white),
                      softWrap: true,
                      maxLines: 200,
                    ),
              ),
            ],
          )),
    );

    return content;
  }
}
