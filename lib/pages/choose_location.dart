import 'package:flutter/material.dart';
import 'package:world_time/constants/time_zones_with_flags.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  String searchQuery = "";

  final zones = timeZones.map((tz) {
    return WorldTime(
      location: tz.location,
      flag: tz.flag,
      url: tz.timezone,
    );
  }).toList();

  void updateTime(WorldTime instance) async {
    await instance.getTime();

    if (!mounted) return;

    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "url": instance.url,
      "isDaytime": instance.isDaytime,
      "time": instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredZones = zones.where((zone) {
      return zone.location
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        title: const Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search location...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredZones.length,
              itemBuilder: (context, index) {
                final zone = filteredZones[index];

                return Card(
                  child: ListTile(
                    title: Text(zone.location),
                    subtitle: Text(zone.url),
                    leading: zone.flag.isNotEmpty
                        ? CircleAvatar(
                      backgroundImage: NetworkImage(zone.flag),
                    )
                        : const CircleAvatar(
                      child: Icon(Icons.public),
                    ),
                    onTap: () {
                      updateTime(zone);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

      backgroundColor: Colors.grey[200],
    );
  }
}