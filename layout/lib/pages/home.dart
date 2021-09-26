import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แนะนำสถานที่ท่องเที่ยว"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              //var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(snapshot.data[index]['title'], snapshot.data[index]['image_url'], snapshot.data[index]['detail']);
                },
                itemCount: snapshot.data.length,
              );
            },

            future : getData(),
            //future:DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget MyBox(String title, String image_url, String detail) {
    var v1,v2,v3;
    v1 = title;
    v2 = image_url;
    v3 = detail; 
    return Container(
      padding: EdgeInsets.all(20),
      height: 180,
      decoration: BoxDecoration(
          color: Colors.lightBlue[50],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(image_url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.10), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("สถานที่ท่องเที่ยว",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Text(title,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              print("next Page");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPage(v1,v2,v3)));
            },
            child: Text("อ่านต่อ",
                style: TextStyle(
                  fontSize: 20,
                )),
          )
        ],
      ),
    );
  }
  Future getData() async {
    //https://raw.githubusercontent.com/siriwut0/BasicAPI/main/data.json
    var url = Uri.https('raw.githubusercontent.com','/siriwut0/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
