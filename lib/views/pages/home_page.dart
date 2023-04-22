import 'package:e_commerce_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/prodect.dart';
import '../widgets/list_item_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                AppAssets.topBanerHomePage,
                width: double.infinity,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                buildHeaderList(
                  context,
                  title: 'Sale',
                  description: 'Super Summer Sale!!',
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dummyProdect
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10),
                            child: ListItemHome(
                              prodect: e,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                buildHeaderList(
                  context,
                  title: 'New',
                  description: 'Super New Products!!',
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dummyProdect
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10),
                            child: ListItemHome(prodect: e),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderList(BuildContext context,
      {required String title,
      VoidCallback? onTap,
      required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            InkWell(
                onTap: onTap,
                child: Text('view all',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey)))
          ],
        ),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey.withOpacity(0.6)),
        )
      ],
    );
  }
}
