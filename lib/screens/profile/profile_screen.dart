import 'package:flutter/material.dart';
import 'package:open_chat/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffcf3f4),
        centerTitle: false,
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: 22,
            color: Color(0xff6a515e),
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _topProfile(),
            _midProfile(),
            _bottomProfile(),
          ],
        ),
      ),
    );
  }

  Widget _bottomProfile() {
    return Container(
      color: Color(0xfffae7e9),
      child: Container(
        padding: const EdgeInsets.only(top: 30, bottom: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
          color: Color(0xfffcf3f4),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/img3.png',
                  width: 150,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/img2.png',
                      width: 150,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/img1.png',
                      width: 150,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _midProfile() {
    return Container(
      color: Color(0xfffcf3f4),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Color(0xfffae7e9),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                bottomRight: Radius.circular(60))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Photos',
                  style: TextStyle(
                    color: Color(0xffc7abba),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '3',
                  style: TextStyle(
                    color: Color(0xff6a515e),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Followers',
                  style: TextStyle(
                    color: Color(0xffc7abba),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '0',
                  style: TextStyle(
                    color: Color(0xff6a515e),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Follows',
                  style: TextStyle(
                    color: Color(0xffc7abba),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '0',
                  style: TextStyle(
                    color: Color(0xff6a515e),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _topProfile() {
    return Container(
      color: Color(0xfffae7e9),
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Color(0xfffcf3f4),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(60),
            )),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.imgUrl),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              user.name,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff6a515e),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '@${user.name}',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xffc7abba),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
