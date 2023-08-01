import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/botton_widget.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import 'package:geocoder2/geocoder2.dart';
import '../../custom/back_button.dart';
import '../../custom/textfeild_widget.dart';

class Select_Address extends StatefulWidget {
  const Select_Address({super.key});

  @override
  State<Select_Address> createState() => _Select_AddressState();
}

class _Select_AddressState extends State<Select_Address> {
  String currentAddress = '';
  double? lat;
  double? long;

  Future<void> _getCurrentLocation() async {
    final location = loc.Location();
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;
    loc.LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    final position = Position(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
      altitude: 0,
      accuracy: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
      timestamp: DateTime.now(),
    );
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks != null && placemarks.isNotEmpty) {
      final placemark = placemarks.first;
      final address = '${placemark.street}, ${placemark.locality}';
      setState(() {
        currentAddress = address;
        // getcontroller.ownerlat.value = position.latitude.toString();
        // getcontroller.ownerlog.value = position.longitude.toString();
      });
    } else {
      setState(() {
        currentAddress = 'address_not_found'.tr;
      });
    }
  }

  final addressController = TextEditingController();
  LatLng? desiLocation = LatLng(24.860966, 66.990501);
  String? _address;
  final _phoneController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? NewgoogleMapController;
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: Custom_Appbar(
          title: "Select_Address".tr,
          leadingButton: back_button(ontap: () {
            Get.back();
          }),
          actionButtons: [
            back_button(
                ontap: () {},
                pic: SvgPicture.asset(
                  "assets/svg/brower.svg",
                ).p(10))
          ],
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                margin: EdgeInsets.all(20),
                height: size.height * 0.5,
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition:
                        CameraPosition(target: desiLocation!, zoom: 16),
                    onCameraMove: (CameraPosition? position) {
                      if (desiLocation != position!.target) {
                        setState(() {
                          desiLocation = position.target;
                        });
                      }
                    },
                    onCameraIdle: () {
                      print('Camera Idle');
                      getAddressLatLng();
                    },
                    onTap: (latlng) {
                      print(latlng);
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  // child: GoogleMap(
                  //   zoomGesturesEnabled: false,
                  //   markers: {_marker},
                  //   mapToolbarEnabled: false,
                  //   mapType: MapType.normal,
                  //   myLocationEnabled: true,
                  //   initialCameraPosition: _kGooglePlex,
                  //   onMapCreated: (GoogleMapController controller) {
                  //     _controller.complete(controller);
                  //   },
                  // ),
                ),
                // child: Image.asset("assets/images/Map.png")
              )),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  "Select_Your_location_from_the_map".tr,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).hintColor),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Move_the_pin_on_the_map_to_find_your_location_and_select_the_delievery_address"
                      .tr,
                  style: TextStyle(
                    color: Theme.of(context).disabledColor,
                    fontFamily: 'plusjakarta',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              textfeild_widget(
                label: "Address_name".tr,
                hintText: "Apartment",
                controller: addressController,
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Address_detail".tr,
                    style: TextStyle(
                        fontFamily: 'plusjakarta',
                        color: Theme.of(context).hintColor,
                        fontSize: 15),
                  )).pOnly(left: 30, bottom: 10),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? size.height / 13
                          : size.height / 7,
                  width: size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).hintColor.withOpacity(0.1),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(currentAddress.isNotEmpty
                          ? currentAddress
                          : 'tap on location'.tr),
                      IconButton(
                          onPressed: () {
                            _getCurrentLocation();
                          },
                          icon: Icon(Icons.location_on))
                    ],
                  ).px(15)),

              // textfeild_widget(
              //   label: "Address_detail".tr,
              //   hintText: "Street No B-120",
              //   controller: addressController,
              //   suffixIcon: IconButton(
              //     icon: Icon(Icons.location_on),
              //     onPressed: () {
              //       // Do something when the pin icon is pressed
              //     },
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Phone_number".tr,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      color: Theme.of(context).hintColor,
                      fontSize: 15),
                ),
              ).px(25).py(10),
              IntlPhoneField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(12))),
                controller: _phoneController,
              ).px(20),
              SizedBox(
                height: 10,
              ),
              Button_Widget(width: size.width, title: "Add_Address".tr)
            ],
          ),
        ));
  }

  getAddressLatLng() async {
    try {
      final placemarks = await placemarkFromCoordinates(
        desiLocation!.latitude,
        desiLocation!.longitude,
      );

      if (placemarks != null && placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        final address = '${placemark.street}, ${placemark.locality}';
        setState(() {
          _address = address;

          print(_address);
        });
      } else {
        setState(() {
          _address = 'address_not_found'.tr;
        });
      }
      GeoData data = await Geocoder2.getDataFromCoordinates(
        latitude: desiLocation!.latitude,
        longitude: desiLocation!.longitude,
        googleMapApiKey: 'AIzaSyDiJo02OZXQiW6qh3Vp1vGEUsHGsFpjKdg',
      );

      // setState(() {
      //   _address = data.address;
      // });
    } catch (e) {
      print('Get Address Error');
      print(e);
    }
  }
}
