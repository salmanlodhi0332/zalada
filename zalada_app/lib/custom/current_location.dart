class Current_Location {
//--------------------currntlocation
  // static final Marker _marker = Marker(
  //     markerId: MarkerId("_marker"),
  //     infoWindow: InfoWindow(title: "home"),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //     position: const LatLng(24.924408027851378, 67.09037756884575));
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(24.924408027851378, 67.09037756884575),
  //   zoom: 14.4746,
  // );

  // Future<void> _getCurrentLocation() async {
  //   final location = loc.Location();
  //   bool serviceEnabled;
  //   loc.PermissionStatus permissionGranted;
  //   loc.LocationData locationData;

  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return;
  //     }
  //   }

  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == loc.PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != loc.PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   locationData = await location.getLocation();
  //   final position = Position(
  //     latitude: locationData.latitude!,
  //     longitude: locationData.longitude!,
  //     altitude: 0,
  //     accuracy: 0,
  //     heading: 0,
  //     speed: 0,
  //     speedAccuracy: 0,
  //     timestamp: DateTime.now(),
  //   );
  //   final placemarks = await placemarkFromCoordinates(
  //     position.latitude,
  //     position.longitude,
  //   );
  //   if (placemarks != null && placemarks.isNotEmpty) {
  //     final placemark = placemarks.first;
  //     final address = '${placemark.street}, ${placemark.locality}';
  //     setState(() {
  //       currentAddress = address;
  //       lat == position.latitude.toString();
  //       long == position.longitude.toString();
  //     });
  //   } else {
  //     setState(() {
  //       currentAddress = 'address_not_found'.tr;
  //     });
  //   }
  // }
}
