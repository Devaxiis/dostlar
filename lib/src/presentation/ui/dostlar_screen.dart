import 'package:dostlar_app/src/core/service_locator.dart';
import 'package:dostlar_app/src/domain/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DostlarScreen extends StatefulWidget {
  const DostlarScreen({super.key});

  @override
  State<DostlarScreen> createState() => _DostlarScreenState();
}


class _DostlarScreenState extends State<DostlarScreen> {
  List<User> dataUser=[];

  @override
  void initState() {
    super.initState();
  getAllTodos();
  }

  void getAllTodos() {
    dataUser =  repository.readUser();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Do'stlar",style: GoogleFonts.plusJakartaSans(
            color: const Color(0xff14181e),
            fontSize: 22,
            fontWeight: FontWeight.w600
        ),),
      ),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView.builder(
              itemCount: dataUser.length,
              itemBuilder: (_,index){
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
