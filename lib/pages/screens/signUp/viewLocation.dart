import 'package:flutter/material.dart';
import 'package:urartist/utils/global_colors.dart';
import 'package:geolocator/geolocator.dart';

class ViewLocation extends StatefulWidget {
  const ViewLocation({super.key});

  @override
  State<ViewLocation> createState() => _ViewLocationState();
}

class _ViewLocationState extends State<ViewLocation> {
  bool loadingLocation = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: GlobalColor.primary,
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Acceso a tu ubicación",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                  "Al dar acceso a tu ubicacion nosotros\n podemos saber de que ciudad eres para\n que asi los usuarios sepan de donde\n eres con exactitud",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(
                height: 20,
              ),
              Text(
                  "Por favor encienda su ubicación\n desde su configuracion en el telefono",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    loadingLocation = true;
                  });
                  final position = await _determinePosition();
                  setState(() {
                    loadingLocation = false;
                  });
                  print(position);
                  if (mounted) {
                  Navigator.pop(context,{"latitude": position.latitude.toString(), "longitude": position.longitude.toString()});
                    
                  }
                },
                child: Container(
                    width: size.width * 0.8,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      loadingLocation
                          ? "Calculando posición..."
                          : "Permitir acceso",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                    )
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      if (mounted) {
        setState(() {
          loadingLocation=false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("La ubicacion esta desactiva por favor activela")));
      }
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        if (mounted) {
          setState(() {
          loadingLocation=false;
          });
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content:
                  Text("Los permisos fueron denegados, repita la operacion")));
        }
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      setState(() {
          loadingLocation=false;
      });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
