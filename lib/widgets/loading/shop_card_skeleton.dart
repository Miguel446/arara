import 'package:arara/widgets/loading/skeleton.dart';
import 'package:flutter/material.dart';

class ShopCardSkeleton extends StatelessWidget {
  const ShopCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(
            height: 200,
            borderRadius: BorderRadius.circular(24),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Skeleton(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 20,
                borderRadius: BorderRadius.circular(4),
              ),
              const Spacer(),
              Skeleton(
                width: 50,
                height: 20,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Skeleton(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 15,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 10),
          Skeleton(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 15,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 10),
          Skeleton(
            width: MediaQuery.of(context).size.width * 0.35,
            height: 15,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}
