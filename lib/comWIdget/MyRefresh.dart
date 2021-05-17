import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:model_app/common/my_material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///下拉刷新 , 上拉加载组件
class MyRefresh extends StatefulWidget {
  final Function() onRefresh; //刷新
  final Function(RefreshController refreshController) onLoading; //加载
  final Widget child; //子组件
  final RefreshController refreshController;
  final bool nodata;
  final bool enablePullDown;
  final bool enablePullUp;

  const MyRefresh(
      {Key key,
      this.onRefresh,
      this.onLoading,
      this.child,
      this.refreshController,
      this.nodata = false,
      this.enablePullDown = true,
      this.enablePullUp = true})
      : super(key: key);

  @override
  _MyRefreshState createState() => _MyRefreshState();
}

class _MyRefreshState extends State<MyRefresh>
    with SingleTickerProviderStateMixin {
  RefreshController _refreshController;
  Timer timer;
  double jindu = 0;
  @override
  void initState() {
    super.initState();
    _refreshController =
        widget.refreshController ?? RefreshController(initialRefresh: false);
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    RefreshStatus modestatus;

    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () async {
        await widget.onRefresh();
        _refreshController.refreshCompleted();
        _refreshController.loadComplete();
        if (widget.nodata) {
          _refreshController.loadNoData();
        }
      },
      onOffsetChange: (up, offset) {
        if (modestatus == RefreshStatus.idle && offset > 0) {
          jindu = offset / 80;
          if (jindu > 1) jindu = 1;
          jindu *= 300.w;
          setState(() {});
        }
      },
      onLoading: () async {
        await widget.onLoading(_refreshController);
        if (widget.nodata) {
          _refreshController.loadNoData();
        } else {
          _refreshController.loadComplete();
        }
      },
      enablePullDown: widget.enablePullDown,
      enablePullUp: widget.enablePullUp,
      header: CustomHeader(builder: (BuildContext context, RefreshStatus mode) {
        modestatus = mode;
        if (mode == RefreshStatus.refreshing ||
            mode == RefreshStatus.completed) {
          if (timer == null) {
            timer = Timer.periodic(Duration(milliseconds: 50), (t) {
              jindu += 20.w;
              setState(() {});
              if (t.tick > 40) {
                t?.cancel();
                timer?.cancel();
                timer = null;
                _refreshController?.refreshCompleted();
              }
            });
          }
        }
        return Stack(
          children: [
            MyImage.asset("icon/xiala", end: 'gif'),
            Positioned(
                bottom: 0,
                left: jindu,
                child: MyImage.asset(
                  "icon/xiala_car",
                  height: 42.w,
                )),
          ],
        );
      }),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("上拉加载");
          } else if (mode == LoadStatus.loading) {
            body = Text("加载中!");
          } else if (mode == LoadStatus.failed) {
            body = Text("加载失败！点击重试！");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("松手,加载更多!");
          } else {
            body = Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60.w,
                  height: 1.h,
                  color: cD8D8D8,
                ),
                SizedBox(width: 30.w),
                MyText("到底啦", 24.s, cD8D8D8),
                SizedBox(width: 30.w),
                Container(
                  width: 60.w,
                  height: 1.h,
                  color: cD8D8D8,
                ),
              ],
            );
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      child: widget.child,
    );
  }
}
