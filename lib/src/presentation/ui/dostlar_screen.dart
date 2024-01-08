import 'package:flutter/material.dart';

class DostlarScreen extends StatefulWidget {
  const DostlarScreen({super.key});

  @override
  State<DostlarScreen> createState() => _DostlarScreenState();
}

class _DostlarScreenState extends State<DostlarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Do'stlar"),
      ),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView.builder(itemBuilder: (_,index){
            return const ListTile(
              trailing: Icon(Icons.delete_outline),
              leading: Icon(Icons.person),
              title: Text("name"),
              subtitle: Text("age"),
            );
          })
        ),
      )
    );
  }
}
