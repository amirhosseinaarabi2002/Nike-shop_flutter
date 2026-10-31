import 'package:flutter/material.dart';
import 'package:nike/common/utils.dart';
import 'package:nike/data/product.dart';
import 'package:nike/ui/product/details.dart';
import 'package:nike/ui/widgets/image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, required this.borderRadius});

  final ProductEntity product;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => ProductDetailScreen())),
        child: SizedBox(
          width: 176,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 189,
                    width: 176,
                    child: ImageLoadingSerivce(
                      imageUrl: product.imageUrl,
                      borderRadius: borderRadius,
                    ),
                  ),

                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border, size: 16),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  product.previousPrice.withPriceLabel,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                child: Text(
                  product.price.withPriceLabel,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
