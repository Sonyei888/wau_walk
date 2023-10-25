import 'package:flutter/material.dart';

//servicios
import 'package:wau_walk/app/service/firebase_service.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<TestingPage> {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing zone'),
      ),
      body: FutureBuilder(future: getPeople(), builder: ((context, snapshot){
        if (snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Text(snapshot.data?[index]['name']);
            },
          );
        }else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    })) ,
    );
  }
}
