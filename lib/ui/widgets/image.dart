import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoadingSerivce extends StatelessWidget {
  final String imageUrl;
  final BorderRadius borderRadius;
  const ImageLoadingSerivce({super.key, required this.imageUrl, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(imageUrl: imageUrl),
    );
  }
}
