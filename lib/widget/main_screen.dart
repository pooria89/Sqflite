import 'package:flutter/material.dart';
// DB
import 'package:loginregister/data/sql_helper.dart';
import 'package:loginregister/model/user.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<User> users = [];

  //controllers used in insert operation UI
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text('My app'),
        leading: Icon(Icons.person),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: ListView(
          children: [
            SizedBox(
                width: 360.0,
                height: 330.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 350.0,
                    height: 240.0,
                    child: Image.asset(
                      'asset/miki.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: const [
                Center(
                  child: Text(
                    'Welcome to App',
                    style: TextStyle(fontSize: 30.0, color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: Text(
                    'Do you like my App ?',
                    style: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Username'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Password'),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: 310.0,
              height: 50.0,
              child: RaisedButton(
                disabledColor: Colors.red.withOpacity(0.12),
                disabledTextColor: Colors.red.withOpacity(0.38),
                onPressed: () {
                  // String username = usernameController.text;
                  // String password = passwordController.text;
                  // SQLHelper.insert(username, password);
                  // print(username+password +"has been saved successfully");
                  insertDb(usernameController.text, passwordController.text);
                },
                child: Text('Save in Db'),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 310.0,
              height: 50.0,
              child: RaisedButton(
                disabledColor: Colors.red.withOpacity(0.12),
                disabledTextColor: Colors.red.withOpacity(0.38),
                onPressed: () {
                  getItems();
                },
                child: GestureDetector(
                    onTap: () {
                      getItems();
                    },
                    child: const Text('Read From Db')),
              ),
            )
          ],
        ),
      ),
    );
  }

  void insertDb(String username, String password) async {
    SQLHelper.insert(username, password);
    print('user saved $username + $password');
  }

  void getItems() async {
    final rows = await SQLHelper.getItems();
    print('query all rows');
    rows.forEach(print);
  }
}
