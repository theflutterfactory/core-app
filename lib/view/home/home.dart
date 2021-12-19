import 'package:flutter/material.dart';
import 'package:flutterfactory/controller/video_notifier.dart';
import 'package:flutterfactory/view/docs_page.dart';
import 'package:flutterfactory/view/video_page.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<VideoNotifier>(context, listen: false).fetchVideos();
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      children: [
        VideoPage(),
        DocsPage(),
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      indicatorWeight: 5,
      indicatorColor: Colors.white,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(
          icon: Icon(Icons.video_collection),
          child: Text('Videos'),
        ),
        Tab(
          icon: Icon(Icons.library_books),
          child: Text('Docs'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (_, __) {
            return <Widget>[
              SliverAppBar(
                title: Text('Home'),
                backgroundColor: Colors.black,
                pinned: true,
                floating: true,
                snap: true,
                leading: Image.asset('images/logo.png'),
                expandedHeight: 300,
                bottom: _buildTabBar(),
                actions: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: IconButton(
                      icon: Icon(Icons.info),
                      color: Colors.blue,
                      onPressed: () => print('Map pressed'),
                      highlightColor: Colors.blue,
                      splashColor: Colors.purple,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.settings),
                      onPressed: () => print('Settings pressed'),
                      highlightColor: Colors.blue,
                      splashColor: Colors.purple,
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.symmetric(vertical: kToolbarHeight),
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
            ];
          },
          body: _buildTabBarView(),
        ),
      ),
    );
  }
}
