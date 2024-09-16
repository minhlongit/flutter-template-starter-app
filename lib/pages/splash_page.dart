import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:starter_app/routes/routes_constants.dart';
import 'package:starter_app/constants/style/style_constants.dart';
import 'package:starter_app/services/locale_service_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> loadCall() async {
    // Wait delay
    if (context.mounted) {
      await context
          .read<LocaleServiceProvider>()
          .initLocale(Localizations.localeOf(context).languageCode);
    }
    await Future.delayed(const Duration(seconds: 3), () {});
    redirectPage();
  }

  Future<void> redirectPage() async {
    bool hasConnection = await InternetConnectionChecker().hasConnection;
    if (!mounted) return;

    if (!hasConnection) {
      Navigator.of(context).popAndPushNamed(RoutesConstants.noInternetRoute);
    } else {
      Navigator.of(context).popAndPushNamed(RoutesConstants.landingRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadCall());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 200,
            left: 0,
            child: CustomPaint(
              painter: Circle(
                size.width - size.width / 5,
                0,
                size.width,
                StyleConstants.colorOfApp,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CustomPaint(
              painter: Circle(0, 0, size.width - 100, Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                FittedBox(
                  child: Text(
                    AppLocalizations.of(context)!.appName,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
                const Text(
                  "Your Splash Screen!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Circle extends CustomPainter {
  final double offsetX;
  final double offsetY;
  final double radius;
  final Color color;

  Circle(this.offsetX, this.offsetY, this.radius, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(offsetX, offsetY), radius, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
