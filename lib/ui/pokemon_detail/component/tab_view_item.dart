import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;

class TabViewItem extends StatefulWidget {
  final Key _tabKey;
  final List<Widget> _slivers;

  const TabViewItem({
    Key? key,
    required Key tabKey,
    required List<Widget> slivers,
  })  : _tabKey = tabKey,
        _slivers = slivers,
        super(key: key);

  @override
  _TabViewItemState createState() => _TabViewItemState();
}

class _TabViewItemState extends State<TabViewItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return NestedScrollViewInnerScrollPositionKeyWidget(
            widget._tabKey,
            CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context)!,
                ),
                for (Widget sliver in widget._slivers) sliver
              ],
            ),
          );
        },
      ),
    );
  }
}
