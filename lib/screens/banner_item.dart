import 'appbanner.dart';
import 'package:flutter/material.dart';

class bannerItem extends StatelessWidget {
  final AppBanner appBanner;
  const bannerItem({Key? key, required this.appBanner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(appBanner.thumbnailUrl),
            fit: BoxFit.cover,
          )),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white, fontSize: 20.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            // Center(
            //     child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: <Widget>[
            //     Container(
            //       width: 200,
            //       child: Text(
            //         appBanner.title,
            //         textAlign: TextAlign.center,
            //       ),
            //     )
            //   ],
            // )),
          ],
        ),
      ),
    );
  }
}
