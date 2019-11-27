import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<bool> showPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "No",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => Navigator.pop((context), false),
          ),
          RaisedButton(
            child: Text("Yes"),
            textColor: Colors.white,
            onPressed: () => Navigator.pop((context), true),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[900],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileImage(),
                    ProfileDetails(),
                    ProfileHolder(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ContactButton(Icons.call, "Mobile"),
                          ContactButton(Icons.chat, "iM"),
                          ContactButton(Icons.email, "Email"),
                          ContactButton(Icons.web, "Web"),
                          ContactButton(Icons.link, "LinkedIn"),
                        ],
                      ),
                    ),
                    ProfileHolder(Section2()),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileHolder extends StatelessWidget {
  final Widget child;

  ProfileHolder(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300], width: 3.0),
          // bottom: BorderSide(color: Colors.grey[300], width: 3.0),
        ),
      ),
      child: child,
    );
  }
}

class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(80.0)),
        child: Container(
          margin: EdgeInsets.only(right: 0),
          child: Image.asset('assets/images/person.png',
              width: 80, height: 80, fit: BoxFit.fill),
        ),
      ),
    );
  }
}

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Jeff Jordan',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16
                // backgroundColor: Colors.red
                ),
          ),
          Text(
            'PromoMax',
            textAlign: TextAlign.center,
          ),
          // Text('Member since: Invalid date', textAlign: TextAlign.left),
          // Text('Market: Out of Town', textAlign: TextAlign.left)
        ],
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String text;

  ContactButton(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              child: Container(
                height: 35,
                width: 35,
                color: Colors.purple[900],
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(icon),
                  iconSize: 35 / 2,
                  // tooltip: 'Increase volume by 10',
                  onPressed: () {},
                ),
              ),
              // Container(
              //   child: Image.asset('assets/images/person.png',
              //       width: 40, height: 40, fit: BoxFit.fill),
              // ),
            ),
          ),
          Text(text)
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              titleLabel("Lead Profile"),
              Spacer(),
              Icon(
                Icons.edit,
                color: Colors.grey,
                size: 24.0,
              ),
            ],
          ),
          textLabel('Display Name'),
          textLabelResult('Jeff Jordan'),
          textLabel('Status'),
          textLabelResult('Active'),
          textLabel('Business Classification'),
          textLabelResult('Manufacturing'),
        ],
      ),
    );
  }
}

Widget titleLabel(text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20
          // backgroundColor: Colors.red
          ),
    ),
  );
}

Widget textLabelResult(text) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
  );
}

Widget textLabel(text) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontSize: 14,
        // backgroundColor: Colors.red,
      ),
    ),
  );
}
