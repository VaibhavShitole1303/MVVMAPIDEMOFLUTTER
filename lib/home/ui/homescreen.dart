import 'package:flutter/material.dart';
import 'package:mvvm_demo_api/home/model/home_response.dart';
import 'package:mvvm_demo_api/home/viewmodel/homeviewmodel.dart';
import '../../utils/api_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeViewModel viewModel=HomeViewModel();
  late HomeResponse model;
  late CityResult mm;
  void getHomeData() {
    viewModel.getHomeDate().then((value) => {
      if (value.status == Status.COMPLETED)
        {
          setState(() {
            model = value.data;

          })
          
        },
      if (value.status == Status.ERROR)
        {

        },
    });
  }

  @override
  void initState() {
    getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(child: Column(
        children: [
          Text("HOME PAGE"),
          Text(model.toString()),
        ],
      ),),
    );
  }
}
