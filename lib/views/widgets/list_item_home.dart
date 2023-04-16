import 'package:e_commerce_app/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../models/prodect.dart';

class ListItemHome extends StatelessWidget {
  const ListItemHome({super.key, required this.prodect});

  final Prodect prodect;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                prodect.imageUrl,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: SizedBox(
                width: 50,
                height: 30,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.red),
                  child: Center(
                    child: Text(
                      '${prodect.discountValue.toString()} %',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 6),
        Text(prodect.categore,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.grey)),
        const SizedBox(height: 6),
        Text(prodect.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        Text('${prodect.price}\$',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.grey
            )),
      ]),
    );
  }
}
