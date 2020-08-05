import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_chat/blocs/chat_list_bloc/chat_list_bloc.dart';
import 'package:open_chat/blocs/home_bloc/home_bloc.dart';
import 'package:open_chat/models/user.dart';
import 'package:open_chat/screens/profile/profile_screen.dart';

import 'chat_list/chat_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              topLeft: Radius.circular(45),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: state.page,
              backgroundColor: Theme.of(context).accentColor,
              onTap: (idx) {
                _pageController.jumpToPage(idx);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Container(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat_bubble,
                    color: Theme.of(context).primaryColor,
                  ),
                  activeIcon: Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                  ),
                  title: Container(),
                )
              ],
            ),
          ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (idx) {
              if (idx == 0) {
                context.bloc<HomeBloc>().add(ChangeProfile());
              } else {
                context.bloc<HomeBloc>().add(ChangeChatList());
              }
              _pageController.jumpToPage(idx);
            },
            children: <Widget>[
              ProfileScreen(
                user: user,
              ),
              BlocProvider(
                  create: (context) => ChatListBloc(user: user)..add(ChatListStart()),
                  child: ChatListScreen(user: user)),
            ],
          ),
        );
      },
    );
  }
}
