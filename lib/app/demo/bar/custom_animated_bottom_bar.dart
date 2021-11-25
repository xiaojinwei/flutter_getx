import 'package:flutter/material.dart';

class CustomAnimatedBottomBar extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavigatorBarItem> items;
  final ValueChanged<int> onItemSelected;
  final ValueChanged<int>? onItemDoubleTap;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;
  final bool isRippleEffect;

  const CustomAnimatedBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 24,
    this.containerHeight = 48,
    this.animationDuration = const Duration(milliseconds: 200),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.onItemDoubleTap,
    this.curve = Curves.easeInOut,
    this.isRippleEffect = true,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;
    return LayoutBuilder(builder: (context,constraints){
      double width = constraints.maxWidth;
      double itemWidth = (width) / items.length;
      return SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [
                if(showElevation)
                  const BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                  )
              ]
          ),
          child: Container(
            width: double.infinity,
            height: containerHeight,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: List.generate(items.length, (index) {
                return RippleLayout(
                    isRippleEffect: isRippleEffect,
                    borderRadius: BorderRadius.circular(itemCornerRadius), // 圆角
                    onTap: () {
                      onItemSelected(index);
                    },
                    onDoubleTap: (){
                      onItemDoubleTap?.call(index);
                    },
                    child: _ItemWidget(
                      item: items[index],
                      isSelected: index == selectedIndex,
                      backgroundColor: bgColor,
                      animationDuration: animationDuration,
                      itemCornerRadius: itemCornerRadius,
                      iconSize: iconSize,
                      curve: curve,
                      width: itemWidth,
                    ));
              }),
            ),
          ),
        ),
      );
    });
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavigatorBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;
  final double width;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.bounceInOut,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = width;
    double minWidth =  maxWidth / 2;
    double _iconSize = iconSize * 4 > maxWidth ? (maxWidth / 4) : iconSize;
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? maxWidth : minWidth,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color:
              isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected ? maxWidth : minWidth,
            padding: isSelected ? EdgeInsets.symmetric(horizontal: 8) : EdgeInsets.zero,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconTheme(
                    data: IconThemeData(
                      size: _iconSize ,
                      color: isSelected
                          ? item.activeColor.withOpacity(1)
                          : (item.inactiveColor ?? item.activeColor),
                    ),
                    child: item.icon),
                isSelected ? Expanded(child: Container(
                  //padding: EdgeInsets.symmetric(horizontal: 4),
                  alignment: Alignment.center,
                  child: DefaultTextStyle.merge(
                      child: item.title,
                      style: TextStyle(
                        color: item.activeColor,
                        fontWeight: FontWeight.bold,
                        height: 1.1,//解决Android上显示偏移问题
                      ),
                    maxLines: 1,
                    textAlign: item.textAlign,
                  ),
                )):Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RippleLayout extends StatelessWidget {
  final Widget? child;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final BorderRadius? borderRadius;
  final bool isRippleEffect;

  const RippleLayout({
    Key? key,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.borderRadius,
    this.isRippleEffect = true,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return isRippleEffect ? Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        child: child,
        borderRadius: borderRadius,
      ),
    ) : GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: child,
    );
  }
}


class BottomNavigatorBarItem {
  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;

  BottomNavigatorBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.inactiveColor,
    this.textAlign,
  });
}
