import 'package:google_maps_flutter/google_maps_flutter.dart';

Set<Marker> markers = {
  Marker(
    markerId: const MarkerId("Mojokerto Central Park"),
    position: const LatLng(-7.463056, 112.431917),
    infoWindow: const InfoWindow(title: "Alun-Alun Mojokerto"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("Masjid Agung Al-Fattah Kota Mojokerto"),
    position: const LatLng(-7.463167, 112.431139),
    infoWindow: const InfoWindow(title: "Masjid Agung Mojokerto"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("Museum Gubug Wayang Mojokerto"),
    position: const LatLng(-7.465750, 112.430278),
    infoWindow: const InfoWindow(title: "Museum Wayang"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("Kantor Bupati Kabupaten Mojokerto"),
    position: const LatLng(-7.463889, 112.433861),
    infoWindow: const InfoWindow(title: "Kantor Bupati"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("Apotek Mojokerto"),
    position: const LatLng(-7.464144, 112.432928),
    infoWindow: const InfoWindow(title: "Apotek Kota"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
};
