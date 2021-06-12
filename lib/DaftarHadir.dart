import 'dart:convert';
import 'package:absen/Config.dart';
import 'package:flutter/material.dart';
import 'Kehadiran.dart';
import 'package:http/http.dart' as http;

class DaftarKehadiran extends StatefulWidget {
  DaftarKehadiran({Key? key}) : super(key: key);

  @override
  _DaftarKehadiranState createState() => _DaftarKehadiranState();
}

class _DaftarKehadiranState extends State<DaftarKehadiran> {
  late Future<List<Kehadiran>> kehadiran;

  Future<List<Kehadiran>> getKehadiran() async {
    final response = await http.get(Uri.http(Config.getBaseUrl(), "/api/kehadiran"));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Kehadiran.fromJson(e))
          .toList();
    } else {
       throw Exception('Failed to load data');
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
    kehadiran = getKehadiran();
  }

  ListView kehadiranListView(List<Kehadiran> data) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].name!),
            subtitle: data[index].attend == "1" ? Text("Hadir", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)) : Text("Belum Hadir") ,
            leading: CircleAvatar(
                radius: 20,
                child: ClipOval(
                  child: Image.network(data[index].avatar!, width: 40, height: 40,fit: BoxFit.cover)
                )
            )
          );
        },
        itemCount: data.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Hadir")),
      body: FutureBuilder<List<Kehadiran>>(
        future: kehadiran,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return kehadiranListView(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text("Terjadi kesalahan ${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
