// ignore_for_file: no_leading_underscores_for_local_identifiers, invalid_return_type_for_catch_error, avoid_print
import 'package:estadio/constants/global_refactoring.dart';
import 'package:estadio/controller/Home/home_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';

class LocationController extends GetxController {
  @override
  void onInit() async {
    await getCurrentPosition();
    super.onInit();
  }

  RxString currentAddress = 'Unknown Location'.obs;
  dynamic currentPosition = Geolocator.getCurrentPosition().obs;

  Future<bool> _handlePermision() async {
    LocationPermission _permission;
    bool _seviceEnabled;
    _seviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_seviceEnabled) {
      showDialogue('Location sevices are disabled');
      return false;
    }
    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
      if (_permission == LocationPermission.denied) {
        showDialogue('Location permissions are disabled');
        return false;
      }
    }
    if (_permission == LocationPermission.deniedForever) {
      showDialogue('Location permissions are permanently denied');
      return false;
    }
    return true;
  }
  Future<void> getCurrentPosition() async {
    final _hasPermission = await _handlePermision();
    if (!_hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      getAddress(currentPosition!);
    }).catchError((e) => print('exeption   $e'));
    update();
  }
  Future<void> getAddress(Position position) async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress.value =
          '${place.subLocality},${place.subAdministrativeArea}';
      HomeController.turfLocality = place.subAdministrativeArea!.trim();
    }).catchError((e) {
      print('exeption add  $e');
    });
    update();
  }
}
