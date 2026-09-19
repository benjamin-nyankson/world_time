import 'package:flutter/material.dart';
import "package:world_time/services/world_time.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: "Accra",
      flag: "https://flagcdn.com/w80/gh.png",
      url: "Africa/Accra",
    );
    await instance.getTime();

    // Navigator.pushNamed(context, "/home");
    // pass the data to the home route
    Navigator.pushReplacementNamed(
      context,
      "/home",
      arguments: {
        "location": instance.location,
        "time": instance.time,
        "flag": instance.flag,
        "isDaytime": instance.isDaytime
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // getData();
    setupWorldTime();
  }

  // @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   super.deactivate();
  //   print("deactivate");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50,
        ),
      )
    );
  }
}
