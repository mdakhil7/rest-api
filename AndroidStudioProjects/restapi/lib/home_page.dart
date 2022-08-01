import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restapi/models/jewlelery.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<JewModel> jeweleryList = [];

  //
  Future<List<JewModel>> getJewapi() async {
    final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/jewelery'));
    var data = jsonDecode(response.body).toString();

    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i ['name']);
        jeweleryList.add(JewModel.fromJson(i));
      }


      return jeweleryList;
    } else {
      return jeweleryList;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get data'),
      ),

      body: Column(
        children: [Expanded(
            child: FutureBuilder(
              future: getJewapi(),
              builder: (context, AsyncSnapshot<List<JewModel>> snapshot) {


                if(snapshot.hasData){
                  return CircularProgressIndicator();
                }else{
                  return ListView.builder(
                    itemBuilder: (BuildContext context,index){
                      return Card(
                        child: Column(
                        ),
                      );
                    },
                  );
                }
                },
            )
        )
        ],
      ),
    );
  }
}
