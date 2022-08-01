
import 'dart:convert';

import 'package:flutter/material.dart';

import 'model2/PostModel.dart';
import 'package:http/http.dart' as http;

class PostSS extends StatefulWidget {
  const PostSS({Key? key}) : super(key: key);

  @override
  State<PostSS> createState() => _PostSSState();
}

class _PostSSState extends State<PostSS> {

  List<PostModel> PostList = [];
  //creating a functions
  Future<List<PostModel>> getPostapi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body).toString();

    //getting data status
    if(response.statusCode == 200){
      for(Map i in data){
        PostList.add(PostModel.fromJson(i));
      }
      return PostList;
    }else{
      return PostList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('still cant get data'),

      ),
    body: Column(
      children: [
        FutureBuilder(
          future: getPostapi(),
            builder: (context , snapshot){
            if(snapshot.hasData){
              return Text ('Loading');

            }else{
              return ListView.builder(
                itemCount: PostList.length,
                  itemBuilder: (context,index){
                  return Text(index.toString());
                  });

              }

            })
      ],
    ),
    );
  }
}
