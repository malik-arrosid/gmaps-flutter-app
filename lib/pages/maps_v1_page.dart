import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps/data_dummy.dart';
import 'package:flutter_google_maps/map_type_google.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsV1Page extends StatefulWidget {
  const MapsV1Page({super.key});

  @override
  State<MapsV1Page> createState() => _MapsV1PageState();
}

class _MapsV1PageState extends State<MapsV1Page> {
  final Completer<GoogleMapController> _controller = Completer();

  double latitude = -7.463056;
  double longitude = 112.431917;

  var mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps V1"),
        actions: [
          PopupMenuButton(
            onSelected: onSelectedMapType,
            itemBuilder: (context) {
              return googleMapTypes
                  .map((typeGoogle) => PopupMenuItem(
                        value: typeGoogle.type,
                        child: Text(typeGoogle.type.name),
                      ))
                  .toList();
            },
          )
        ],
      ),
      body: Stack(
        children: [
          _buildGoogleMap(),
          _buildDetailCard(),
        ],
      ),
    );
  }

  Widget _buildGoogleMap() {
    return GoogleMap(
      mapType: mapType,
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 16,
      ),
      onMapCreated: (controller) => _controller.complete(controller),
      markers: markers,
    );
  }

  void onSelectedMapType(Type value) {
    setState(() {
      switch (value) {
        case Type.Normal:
          mapType = MapType.normal;
          break;
        case Type.Hybrid:
          mapType = MapType.hybrid;
          break;
        case Type.Terrain:
          mapType = MapType.terrain;
          break;
        case Type.Satellite:
          mapType = MapType.satellite;
          break;
        default:
      }
    });
  }

  Widget _buildDetailCard() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(
              width: 10,
            ),
            _displayPlaceCard(
                "https://turisian.com/wp-content/uploads/2023/09/IMG_1236.jpeg",
                "Alun-Alun Mojokerto",
                -7.463056,
                112.431917),
            const SizedBox(
              width: 10,
            ),
            _displayPlaceCard(
                "https://web.mojokertokota.go.id/images/potensi/zRMvMnxx3G78rJ4wgwO9iQ7LzhnCi5mcyGq8B0rj.jpg",
                "Masjid Agung MJK",
                -7.463167,
                112.431139),
            const SizedBox(
              width: 10,
            ),
            _displayPlaceCard(
                "https://petualang.travelingyuk.com/unggah/2019/08/lrm_export_20190811_123022_c3k.jpg",
                "Museum Wayang MJK",
                -7.465750,
                112.430278),
            const SizedBox(
              width: 10,
            ),
            _displayPlaceCard(
                "https://live.staticflickr.com/3030/3013403395_49ebe6ff0e_z.jpg",
                "Kantor Bupati MJK",
                -7.463889,
                112.433861),
            const SizedBox(
              width: 10,
            ),
            _displayPlaceCard(
                "https://lh3.googleusercontent.com/p/AF1QipP-4DMqpZ1RT6nvFtUhLuKvFlCctg1n6RuQG5tX=s680-w680-h510",
                "Apotek Mojokerto",
                -7.464144,
                112.432928),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  _displayPlaceCard(String imageUrl, String name, double lat, double long) {
    return GestureDetector(
      onTap: () {
        _onClickPlaceCard(lat, long);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 90,
        margin: const EdgeInsets.only(bottom: 30),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          elevation: 10,
          child: Row(
            children: [
              Container(
                width: 90,
                height: 90,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "4.9",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          children: stars(),
                        )
                      ],
                    ),
                    const Text(
                      "Indonesia \u00B7 Kota Mojokerto",
                      style: TextStyle(
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Closed \u00B7 Open 09.00 Pagi",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> stars() {
    List<Widget> list = [];
    for (var i = 0; i < 5; i++) {
      list.add(
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 15,
        ),
      );
    }

    return list;
  }

  void _onClickPlaceCard(double lat, double long) async {
    setState(() {
      latitude = lat;
      longitude = long;
    });

    GoogleMapController controller = await _controller.future;

    final cameraPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 17,
      bearing: 192,
      tilt: 55,
    );

    final cameraUpdate = CameraUpdate.newCameraPosition(cameraPosition);

    controller.animateCamera(cameraUpdate);
  }
}
