import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {

  final List<BarItem> items;

  final ValueChanged<int>? onTap;

  final int currentIndex;

  final double topPadding;
  final double bottomPadding;

  final NotchedShape? shape;

  const BottomBar({Key? key,required this.items,this.onTap,this.currentIndex = 0,this.topPadding = 8,this.bottomPadding = 8,this.shape}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  List<Widget> _createTiles() {
    final List<Widget> tiles = <Widget>[];
    for (int i = 0; i < widget.items.length; i++) {
      tiles.add(_BottomTile(
        item: widget.items[i],
        iconSize: 24,
        selected: i == this.widget.currentIndex,
        onTap: (){
          this.widget.onTap?.call(i);
        },
      ));
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {

    return BottomAppBar(
      shape: widget.shape,
      child: Padding(
        padding: EdgeInsets.only(top: widget.topPadding, bottom: widget.bottomPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _createTiles(),
        ),
      ),
    );
  }
}

class _BottomTile extends StatelessWidget {
  _BottomTile({Key? key,required this.item,required this.iconSize,this.selected = false,this.onTap}) : super(key: key);

  final BarItem item;
  final double iconSize;
  final bool selected;
  final VoidCallback? onTap;

  Widget _createContentView(){
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topCenter,
            heightFactor: 1.0,
            child: IconTheme(
              data: IconThemeData(
                //color: iconColor,
                size: iconSize,
              ),
              child: this.selected ? this.item.activeIcon : this.item.icon,
            ),
          ),
          this.item.title,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var contentView = _createContentView();
    Widget result = item.isEnabled ? (item.hasRipple ? InkResponse(
      child: contentView,
      onTap: this.onTap,
    ) : GestureDetector(
      child: contentView,
      onTap: this.onTap,
    )) : contentView;

    return Expanded(
      flex: 1,
      child: result,
    );
  }
}


class BarItem {

  final Widget icon;
  final Widget activeIcon;

  final Widget title;

  final double topPadding;
  final double bottomPadding;

  final bool isEnabled;
  final bool hasRipple;

  BarItem({required this.icon,required this.activeIcon,required this.title,this.topPadding = 0,this.bottomPadding = 0,this.isEnabled = true,this.hasRipple = true});
}
