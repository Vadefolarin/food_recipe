import 'package:flutter/material.dart';
import 'package:food_recipe/views/authentication_screen/login-screen/components.dart/login_form.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController _tabController ;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
      child: Expanded(
        child: Column(
          children: [
            Container(
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25),  boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 2),
                          ]),
              child: TabBar(
                indicatorWeight: 3,
            
                controller: _tabController,
                labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.red),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.red,
                tabs: [
                  Tab(
                    text: "Log in",
                  ),
                  Tab(
                    text:  "Sign Up",
                  ),
                ],
              ),
            ),
            Expanded(
              child: 
            TabBarView(
              controller: _tabController,
              children: [
            
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SignForm(),
                ),
                
            
            
               Center(
                child: Text("Example", style: TextStyle(color: Colors.red),),
              ),]),
              ),
          ],
        ),
      ),
    );
  }
}

