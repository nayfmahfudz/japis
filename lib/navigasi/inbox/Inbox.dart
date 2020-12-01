import 'package:flutter/material.dart';

class MailContent {
  String subject;
  String time;
  String sender;
  String message;

  MailContent(this.subject, this.sender, this.time, this.message);
  String getSubject() => this.subject;
  String getSender() => this.sender;
  String getTime() => this.time;
  String getMessage() => this.message;
}

class MailGenerator {
  static var mailList = [
    MailContent("Konfirmasi Pendaftaran", "Admin JAPIS", "31 Oct",
        "This is a simple demo mail..."),
    MailContent("Pesanan diterima", "Admin JAPIS", "31 Oct",
        "This is a simple demo mail..."),
    MailContent("Booking Fasilitas Berhasil", "Admin JAPIS", "31 Oct",
        "This is a simple demo mail..."),
    MailContent("Booking Fasilitas Berhasil", "JAPIS Autoreply", "31 Oct",
        "This is a simple demo mail..."),
    MailContent("Reminder Jadwal Booking", "JAPIS Autoreply", "31 Oct",
        "This is a simple demo mail..."),
    MailContent("Reminder Jadwal Booking", "JAPIS Autoreply", "31 Oct",
        "This is a simple demo mail..."),
    MailContent("Lorem ipsum dolor sit amet", "Admin JAPIS", "31 Oct",
        "This is a simple demo mail..."),
    MailContent("Lorem ipsum dolor sit amet", "Admin JAPIS", "31 Oct",
        "This is a simple demo mail..."),
    MailContent("Lorem ipsum dolor sit amet", "Admin JAPIS", "31 Oct",
        "This is a simple demo mail..."),
  ];

  static MailContent getMailContent(int position) => mailList[position];
  static int mailListLength = mailList.length;
}

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var drawerIcons = [
    Icon(Icons.move_to_inbox),
    Icon(Icons.inbox),
    Icon(Icons.people),
    Icon(Icons.local_offer),
    Icon(Icons.star),
    Icon(Icons.access_time),
    Icon(Icons.label),
    Icon(Icons.send),
    Icon(Icons.send),
    Icon(Icons.note),
    Icon(Icons.mail),
    Icon(Icons.error),
    Icon(Icons.delete),
    Icon(Icons.label),
    Icon(Icons.label),
    Icon(Icons.settings),
    Icon(Icons.help),
  ];

  var drawerText = [
    "All inboxes",
    "Primary",
    "Social",
    "Promotions",
    "Starred",
    "Snoozed",
    "Important",
    "Sent",
    "Outbox",
    "Drafts",
    "All mail",
    "Spam",
    "Bin",
    "[Imap]/Sent",
    "[Imap]/Trash",
    "Settings",
    "Help & feedback"
  ];

  var titleBarContent = "Inbox";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getMailAppBar(),
      body: _mailListViewGenerator(),
    );
  }

  AppBar _getMailAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF44D8F3),
      title: new Text(
        titleBarContent,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _mailListViewGenerator() {
    return ListView.builder(
        itemCount: MailGenerator.mailListLength,
        itemBuilder: (context, position) {
          MailContent mailContent = MailGenerator.getMailContent(position);
          return Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      color: Color(0xFF44D8F3),
                      child: Icon(
                        Icons.mail_outline,
                        size: 40.0,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                mailContent.sender,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                    fontSize: 17.0),
                              ),
                              Text(
                                mailContent.time,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                    fontSize: 13.5),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    mailContent.subject,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                        fontSize: 15.5),
                                  ),
                                  Text(
                                    mailContent.message,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                        fontSize: 15.5),
                                  )
                                ],
                              ),
                              // Icon(Icons.star_border, size: 25.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
          ]);
        });
  }
}
