import 'package:flutter/material.dart';
import 'package:nike/common/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:nike/data/banner.dart';
// import 'package:nike/ui/widgets/image.dart';

class BannerSlider extends StatelessWidget {
  // final List<BannerEntity> banners;
  final List<String> banners;
  final BorderRadius borderRadius;
  final PageController controller = PageController();
  BannerSlider({super.key, required this.banners, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: [
          PageView.builder(
            physics: defaultScrollPhysics,
            controller: controller,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              // return ImageLoadingSerivce(imageUrl: banners[index]);
              return _Slide(
                borderRadius: borderRadius,
                banners: banners,
                index: index,
              );
            },
          ),

          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: banners.length,
                axisDirection: Axis.horizontal,
                effect: WormEffect(
                  paintStyle: PaintingStyle.fill,
                  dotHeight: 3,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotColor: Colors.grey.shade400,
                  dotWidth: 20,
                  radius: 4,
                  spacing: 4,
                  strokeWidth: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final int index;
  const _Slide({
    super.key,
    required this.borderRadius,
    required this.banners,
    required this.index,
  });

  final BorderRadius borderRadius;
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(banners[index], fit: BoxFit.fill),
      ),
    );
  }
}
