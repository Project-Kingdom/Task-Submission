
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:froshlink/detail_page.dart';
import 'package:froshlink/model.dart';

import 'network.dart';

class MyHomePage extends StatefulWidget {
  //const MyHomePage({required Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Future<List<Photo>>? _photo;
  // void initState()
  // {
  //   super.initState();
  //   _photo=.getResults();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("Assignment",style: TextStyle(color: Colors.white),)),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchPhoto(),
          builder: (BuildContext context,AsyncSnapshot snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount:snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              snapshot.data[index].url,
                            ),
                          ),
                          title: Text(snapshot.data[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text(snapshot.data[index].url),
                          onTap: ()=>{
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(snapshot.data[index]))),
                          }
                        ),
                      ),
                    );
                  }
                },
              );
            }else if(snapshot.hasError){
              return Container(
                child: Center(child: Text("Not Found Data"),),
              );
            }
            else{
              print("errror");
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
