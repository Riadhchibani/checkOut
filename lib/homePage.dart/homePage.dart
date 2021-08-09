import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 150,
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 310.0,
              flexibleSpace: FlexibleSpaceBar(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                child: Center(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
                children: [Text("data"), Text("data"), Text("data")]),
          ),
        ));
  }
}
/*



        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: NestedScrollView(
          slivers: <Widget>[
            SliverAppBar(
                shadowColor: Colors.black,
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 370.0,
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                )
                flexibleSpace: FlexibleSpaceBar(
                title: Center(),
                background: Container(
                  height: 1500,
                ),
              ),
                ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                child: Center(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
                children: [Text("data"), Text("data"), Text("data")]),
          ),
        )
 */