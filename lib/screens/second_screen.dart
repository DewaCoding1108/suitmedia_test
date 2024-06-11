import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class SecondScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final String name = Get.arguments['name'];

  SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen', style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF554AF0)), // Custom back icon
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Welcome', style: Theme.of(context).textTheme.titleSmall),
                Text('$name ', style: Theme.of(context).textTheme.titleMedium),
              ]
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Obx((){
                  if(userController.selectedUser.value != null){
                    return 
                    Text('${userController.selectedUser.value?.firstName} ${userController.selectedUser.value?.lastName}', style: Theme.of(context).textTheme.titleLarge);
                  } else{
                    return 
                    const Text('');
                  }
                  }),
              ]
            ),
            Container(
              margin:const EdgeInsets.only(right: 19, left:9),
              child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/third');
              },
              child: Text(style: Theme.of(context).textTheme.displaySmall,'Choose a User'),
              ),
              )  
          ],
        ),
      ),
    );
  }
}