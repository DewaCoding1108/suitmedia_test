import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../models/user.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final UserController userController = Get.put(UserController());
    userController.getUser();

    Future onRefresh() async {
      userController.refreshData();
    }

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && userController.hasMore.value) {
        userController.getUser();
      }
    }

    scrollController.addListener(onScroll);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3.0),
          child: Container(
            height:1.0,
            color: Colors.grey.withOpacity(0.5),
          )
        ),
        title: Text('Third Screen', style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20.0),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF554AF0)), // Custom back icon
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 62.0),
        child: Obx(() {
          // if (userController.isLoading.value) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          // if (userController.users.isEmpty) {
          //   return const Center(child: Text('No Users Found'));
          // }
          return RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.separated(
              controller: scrollController,
              itemCount: userController.hasMore.value
                ? userController.users.length + 1
                : userController.users.length,
              physics: const AlwaysScrollableScrollPhysics(),
              // itemCount: userController.users.length,
              separatorBuilder: (context, index) {
                return 
                  const Padding(
                    padding: EdgeInsets.only(right:21.0, left: 20.0),
                    child: Divider(
                      thickness: 0.8,
                    ),
                  );
                },
              itemBuilder: (context, index) {
                if (index < userController.users.length) {
                  User user = userController.users[index];
                  bool isSelected = userController.selectedUser.value == user;
                  return ListTile(
                    leading: CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.avatar)),
                    title: Text('${user.firstName} ${user.lastName}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isSelected ? const Color(0xFF554AF0) : Colors.black, // Change color based on selection
                    )),
                    subtitle: Text(user.email, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isSelected ? const Color(0xFF554AF0) : Colors.black, // Change color based on selection
                    )),
                    onTap: () {
                      setState((){
                        userController.selectedUser.value = user;
                      });
                      // Get.back();
                    },
                  );
                }
                else{
                  return const Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                   ),
                  );
                }
              },
            ),
          );
        }),
      ),
    );
  }
}