import 'package:flutter/material.dart';

class DiagonallyCutColoredImage extends StatelessWidget {
  final Image image;
  final Color color;

  DiagonallyCutColoredImage({@required this.color, this.image});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalClipper(),
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(color: color),
        child: image,
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}