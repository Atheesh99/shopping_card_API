import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_api/controller/productcontroller.dart';

import 'package:shopping_api/view/widget/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'ShopX',
                      style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.apps_sharp),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.api_sharp),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 1 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: controller.productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductTile(
                              product: controller.productList[index]);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
