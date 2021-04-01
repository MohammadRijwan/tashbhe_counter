import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController fieldController = TextEditingController();
  int value = 0;
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
              image: AssetImage('assets/tashbeeh.jpg'
                  ),
              fit: BoxFit.cover,
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
                    color: Color(0xff78A200),
                    fontWeight: FontWeight.bold
                  ),
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
                  height: 100.0,
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
