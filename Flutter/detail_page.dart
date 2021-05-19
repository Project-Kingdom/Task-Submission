
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:froshlink/model.dart';

class DetailPage extends StatelessWidget {
 // const DetailPage({Key key}) : super(key: key);
 //late final Photo photo;
  final Photo photo;
  DetailPage(this.photo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(photo.title.toString()),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(photo.thumbnailUrl.toString()),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(child: Text(photo.title.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}
