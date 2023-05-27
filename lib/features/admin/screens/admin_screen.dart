import 'package:amazon_clone/features/admin/widgets/adminBottomBar.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variable.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace:  Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/amazon_in.png', width: 120, height: 45, color: Colors.black,),
              ),

              const Text("Admin",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),)
            ],

          ),
        ),


      ),

      bottomNavigationBar: const AdminBottomBar(),


    );

  }



}
