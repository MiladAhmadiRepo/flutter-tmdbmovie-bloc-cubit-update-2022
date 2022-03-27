import 'package:flutter/material.dart';

import 'package:movie_db_app/configs/configs.dart';

class CarouselItem extends StatelessWidget {
  final String avatar;
  final String title;
  final VoidCallback onTap;

  CarouselItem({
    required this.avatar,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(
                Rect.fromLTRB(
                  0,
                  0,
                  rect.width,
                  rect.height,
                ),
              );
            },
            blendMode: BlendMode.dstIn,
            child: Image.network(
              '${Config.baseImageUrl}$avatar',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: const Color.fromRGBO(
                  0,
                  0,
                  0,
                  0.3,
                ),
                highlightColor: const Color.fromRGBO(
                  0,
                  0,
                  0,
                  0.1,
                ),
                onTap: onTap,
              ),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 10.0,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
