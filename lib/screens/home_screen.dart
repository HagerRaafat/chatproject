import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/widgets/category_selector.dart';
import 'package:flutter_chat_ui_starter/widgets/recent_chats.dart';
import 'package:flutter_chat_ui_starter/widgets/search.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  final List<String> list = List.generate(10, (index) => 'Text $index');

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                expandedHeight: 40.0,
                backgroundColor: Theme.of(context).accentColor,
                title: Text(
                  'Chats',
                  style: TextStyle(
                    fontFamily: 'RobotoSlab',
                    fontSize: 28.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                elevation: 0.0,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white,
                    iconSize: 30.0,
                    onPressed: () {
                      //Navigator.pushNamed(context, SearchScreen.id);
                      showSearch(
                          context: context, delegate: Search(widget.list));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('assets/images/greg.jpg'),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  )
                ],
              ),
            )
          ];
        },
        body: Column(
          children: [
            CategorySelector(),
            RecentChats(),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          elevation: 0.0,
          child: Image.asset(
            'assets/images/icon.png',
            width: 30.0,
            height: 30.0,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
