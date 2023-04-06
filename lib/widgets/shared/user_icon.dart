import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  final String? imageUrl;
  final double radius;

  const UserIcon({
    super.key,
    this.radius = 30,
    this.imageUrl = '',
  });

  bool get imageUrlIsEmpty => imageUrl?.isEmpty ?? true;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black12,
      foregroundImage: imageUrlIsEmpty ? null : NetworkImage(imageUrl as String),
      child: FittedBox(
        child: Icon(
          Icons.person,
          color: Colors.black54,
          size: radius * 2.5,
        ),
      ),
    );
  }
}
