import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:loginuicolors/home.dart';
//import 'package:url_launcher/url_launcher.dart';

class Mainpage extends StatelessWidget {
  final String ytlink;
  final String ebook;
  final String websitelink;

  const Mainpage(
      {required this.ytlink, required this.ebook, required this.websitelink});

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 50,
      ),
      Icon(
        Icons.search,
        size: 50,
      ),
      Icon(Icons.person, size: 50),
    ];
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[100],
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: InkWell(
                onTap: () {
                  _launchInBrowser(ebook);
                },
                splashColor: Colors.amber[100],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.book,
                        size: 70.0,
                      ),
                      Text("E Book", style: new TextStyle(fontSize: 20.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: InkWell(
                onTap: () {
                  _launchInBrowser(ytlink);
                },
                splashColor: Colors.amber[100],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.video_collection_outlined,
                        size: 70.0,
                      ),
                      Text("video", style: new TextStyle(fontSize: 20.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: InkWell(
                onTap: () {
                  _launchInBrowser(websitelink);
                },
                splashColor: Colors.amber[100],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.web_stories,
                        size: 70.0,
                      ),
                      Text("web site", style: new TextStyle(fontSize: 20.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                },
                splashColor: Colors.amber[100],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back_outlined,
                        size: 70.0,
                      ),
                      Text("Back", style: new TextStyle(fontSize: 20.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setState(int Function() param0) {}
}
