import 'dart:convert';

import 'package:examan/pharwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
class Pharmacie extends StatefulWidget {
  const Pharmacie({super.key});

  @override
  State<Pharmacie> createState() => _PharmacieState();
}

class _PharmacieState extends State<Pharmacie> {

    final String baseUrl = "10.0.2.2:9090";

 late Future<bool> fetchedPahrmacie;
 final List<phar> pharmacies = [];




Future<bool> fetchePharmacie() async {
   
 http.Response response = await http.get(Uri.http(baseUrl, "/api/pharmacies/list"));



    List<dynamic> pharmacielist = json.decode(response.body);

    
    for (int i = 0; i < pharmacielist.length; i++) {
      pharmacies.add(phar(
          pharmacielist[i]["_id"],
          pharmacielist[i]["title"],
           pharmacielist[i]["address"],
             "http://10.0.2.2:9090/"+ pharmacielist[i]["image"],)
      );
    } 

 
    return true;
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
     fetchedPahrmacie = fetchePharmacie();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:fetchedPahrmacie ,
      builder: (context, AsyncSnapshot<bool>  snapshot){
      if(snapshot.hasData) {
      
        return Scaffold(
       
       
        body: ListView.builder(
              itemCount: pharmacies.length,
              itemBuilder: (context, index) {
                return CardFood(pharmacies[index]._id,pharmacies[index].title, pharmacies[index].image, pharmacies[index].address);
              },
            ),
        
      );
     } else { 
          return const Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}





class phar{
  late   String _id;
  late   String title;
   late      String address;
    late    String image;

    phar(this._id,this.title,this.address,this.image);
}