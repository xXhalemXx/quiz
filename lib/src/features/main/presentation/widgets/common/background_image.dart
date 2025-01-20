import 'package:flutter/material.dart';
import 'package:quiz/src/core/constants/assets.dart';

BoxDecoration backgroundImage() {
  return const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(Assets.assetsImagesBackground),
      fit: BoxFit.fill,
    ),
  );
}
