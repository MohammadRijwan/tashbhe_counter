import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController fieldController = TextEditingController();
  int value = 0;

  launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC6EFEB),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1519818187420-8e49de7adeef?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Text(
                  'Tashbeeh Counter',
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20.0),
                    enabled: false,
                    controller: fieldController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red, //this has no effect
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250.0, top: 200.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        value = 0;
                        fieldController.text = '${value}';
                      });
                    },
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          'Clear',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        value++;
                        fieldController.text = '${value}';
                      });
                    },
                    child: Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Color(0xff1B70B1), shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          'Tasbheeh',
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap:()=> launchInBrowser('https://www.instagram.com/ridz.creations/'),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: 'This app build by: Mohammad Follow me on\n', ),
                          TextSpan(text: 'Insta @Ridz.Creations!',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent)),
                        ],
                      ),
                    ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

