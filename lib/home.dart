import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginuicolors/mainpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 2;
  List sublist = [];
  List ylist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDatabaseList();
  }

  Future getBookinfList() async {
    List itemsList = [];

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      CollectionReference Bookinglist =
          FirebaseFirestore.instance.collection('SUBJECT');
      await Bookinglist.get().then((value) {
        value.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  fetchDatabaseList() async {
    dynamic resultant = await getBookinfList();

    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        sublist = resultant;
        print(resultant);
      });
      log(sublist.toString());
    }
  }

  /* Future getUrlList() async {
    List itemsList = [];

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      CollectionReference Bookinglist =
          FirebaseFirestore.instance.collection('Yurl');
      await Bookinglist.get().then((value) {
        value.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  fetchDatabaseUrlList() async {
    dynamic resultant = await getUrlList();

    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        sublist = resultant;
        print(resultant);
      });
    }
  }
 */
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
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Subject List",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        child: sublist.isEmpty
            ? Center(
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: CircularProgressIndicator(),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.grey[200],
                    child: ListTile(
                      enabled: true,
                      isThreeLine: true,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mainpage(
                                    ytlink: sublist[index]['YLINK'],
                                    ebook: sublist[index]['EBOOK'],
                                    websitelink: sublist[index]['WLINK'])));
                      },
                      hoverColor: Colors.black,
                      subtitle: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              sublist[index]['sub'],
                              //sublist[index]['YLINK']
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        "",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      trailing: Column(
                        children: <Widget>[
                          Text(
                            "",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                      contentPadding: EdgeInsets.all(7),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }

  //setState(int Function() param0) {}
}
