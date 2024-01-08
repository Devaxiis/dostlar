import 'package:dostlar_app/src/core/service_locator.dart';
import 'package:dostlar_app/src/domain/model/user_model.dart';
import 'package:dostlar_app/src/presentation/component/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DostQoshishScreen extends StatefulWidget {
  const DostQoshishScreen({super.key});

  @override
  State<DostQoshishScreen> createState() => _DostQoshishScreenState();
}

TextEditingController nameController = TextEditingController(text: "");
TextEditingController ageController = TextEditingController(text:"" );
TextEditingController descController = TextEditingController(text: "");

class _DostQoshishScreenState extends State<DostQoshishScreen> {
  @override
  Widget build(BuildContext context) {
   final maxWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Do'st qo'shish",style: GoogleFonts.plusJakartaSans(
          color: const Color(0xff14181e),
          fontSize: 22,
          fontWeight: FontWeight.w600
        ),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2,),
               CustomTextField(labelName: "name",keybordType: TextInputType.text,controller: nameController ,),
              const Spacer(),
               CustomTextField(labelName: "age",keybordType: TextInputType.number,controller:ageController,),
              const Spacer(),
               CustomTextField(labelName: "Description",keybordType: TextInputType.text,controller:descController,),
              const Spacer(flex: 6,),
              Material(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: (){
                    final data =  User(name: nameController.text.trim(), age: ageController.text.trim(), description: descController.text.trim());
                    repository.storeUser(data);
                    setState(() {});
                    nameController.text = '';
                    ageController.text = '';
                    descController.text = '';
                  },
                  child: Container(
                    height: 54,
                    width: maxWidth,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(
                        width: 2,
                        color: const Color(0xff14181e)
                      )
                    ),
                    child: Text("Saqlash",style: GoogleFonts.plusJakartaSans(
                      color: const Color(0xff14181e),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
