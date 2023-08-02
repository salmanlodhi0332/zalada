import 'dart:async';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/model/Address_model.dart';
import 'package:zalada_app/custom/botton_widget.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:zalada_app/service/Api_Service.dart';
import '../../custom/back_button.dart';
import '../../custom/textfeild_widget.dart';

class Select_Address extends StatefulWidget {
  final int? id;
  final int? userId;
  final String? address_type;
  final String? locationName;
  final String? latitude;
  final String? longitude;
  final String? address;
  const Select_Address(
      {super.key,
      this.id,
      this.userId,
      this.address,
      this.address_type,
      this.latitude,
      this.locationName,
      this.longitude});

  @override
  State<Select_Address> createState() => _Select_AddressState();
}

class _Select_AddressState extends State<Select_Address> {
  double? lat;
  double? long;

  final typecontroller = SingleValueDropDownController();
  final addressController = TextEditingController();
  LatLng? desiLocation = LatLng(24.860966, 66.990501);
  String _address = '';
  // final _phoneController = TextEditingController();
  late Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    _controller = Completer();
    editAddress();
  }

  void editAddress() {
    addressController.text = widget.locationName!;
    lat = double.parse(widget.latitude!);
    long = double.parse(widget.longitude!);
    _address = widget.address!;
    desiLocation =
        LatLng(double.parse(widget.latitude!), double.parse(widget.longitude!));
  }

  void onMarkerDragEnd(LatLng position) {
    setState(() {
      desiLocation = position;
    });
  }

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
            widget.id != null
                ? back_button(
                    ontap: () {
                      ApiService.getInstance
                          .Delete_Address(widget.id!, context);
                    },
                    pic: Center(
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 20,
                      ).p(6),
                    ))
                : SizedBox()
          ],
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.3,
                width: size.width,
                child: GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                  mapToolbarEnabled: false,
                  zoomGesturesEnabled: true,
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
                    // if (_address == null) {
                    //   getAddressLatLng();
                    // } else {
                    //   print('object Address Error');
                    // }
                  },
                  onTap: (latlng) {
                    print(latlng);
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: Set<Marker>.from([
                    Marker(
                      markerId: MarkerId('myMarker'),
                      position: desiLocation!,
                      draggable: true,
                      onDragEnd: onMarkerDragEnd,
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 15,
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
                height: 5,
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
              // SizedBox(
              //   height: 10,
              // ),

              textfeild_widget(
                label: "Address_name".tr,
                hintText: widget.locationName!.isNotEmpty
                    ? widget.locationName!
                    : "Apartment",
                controller: addressController,
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "location".tr,
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
                      Text(_address.isNotEmpty
                          ? _address
                          : 'tap on location'.tr),
                      IconButton(
                          onPressed: () {
                            // _getCurrentLocation();
                          },
                          icon: Icon(Icons.location_on))
                    ],
                  ).px(15)),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Type".tr,
                    style: TextStyle(
                        fontFamily: 'plusjakarta',
                        color: Theme.of(context).hintColor,
                        fontSize: 15),
                  )).pOnly(left: 30, top: 10),

              DropDownTextField(
                textFieldDecoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context)
                            .disabledColor
                            .withOpacity(0.5)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context)
                            .disabledColor
                            .withOpacity(0.3)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: widget.address_type!.isEmpty
                      ? "select_address_type".tr
                      : widget.address_type,
                ),
                controller: typecontroller,
                dropDownList: [
                  DropDownValueModel(
                    name: 'Home',
                    value: "Home ",
                  ),
                  DropDownValueModel(
                    name: 'Office',
                    value: "Office ",
                  ),
                  DropDownValueModel(
                    name: 'Appartment',
                    value: "Appartment ",
                  ),
                  DropDownValueModel(
                    name: 'Others',
                    value: "Others ",
                  ),
                ],
              ).px(25).py(10),

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
              // SizedBox(
              //   height: 15,
              // ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Text(
              //     "Phone_number".tr,
              //     style: TextStyle(
              //         fontFamily: 'plusjakarta',
              //         color: Theme.of(context).hintColor,
              //         fontSize: 15),
              //   ),
              // ).px(25).py(10),
              // IntlPhoneField(
              //   decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(
              //               color: Theme.of(context)
              //                   .disabledColor
              //                   .withOpacity(0.3)),
              //           borderRadius: BorderRadius.circular(12))),
              //   controller: _phoneController,
              // ).px(20),
              SizedBox(
                height: 10,
              ),
              Button_Widget(
                  ontap: () {
                    if (widget.id != null) {
                      ApiService.getInstance.Update_Address(
                          Address_Model(
                            id: widget.id,
                            locationname: addressController.text,
                            address: _address,
                            latitude: lat.toString(),
                            longitude: long.toString(),
                            addressType: typecontroller.dropDownValue != null &&
                                    typecontroller
                                        .dropDownValue!.value.isNotEmpty
                                ? typecontroller.dropDownValue!.value
                                : widget.address_type,
                            userid: widget.userId!,
                          ),
                          context);
                    } else {
                      ApiService.getInstance.Add_Address(
                          Address_Model(
                            locationname: addressController.text,
                            address: _address,
                            latitude: lat.toString(),
                            longitude: long.toString(),
                            addressType: typecontroller.dropDownValue!.name,
                            userid: 1,
                          ),
                          context);
                    }
                  },
                  width: size.width,
                  title: "Add_Address".tr)
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
          lat = desiLocation!.latitude;

          long = desiLocation!.longitude;
          print(lat);
          print(long);
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

      setState(() {
        _address = data.address;
      });
    } catch (e) {
      print('Get Address Error');
      print(e);
    }
  }
}
