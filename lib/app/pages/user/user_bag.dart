import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserBag extends ConsumerWidget {
  const UserBag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bagViewModel = ref.watch(bagProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  const Flexible(
                    child: Text(
                      "My Bag",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              bagViewModel.productsBag.isEmpty
                  ? const EmptyWidget()
                  : Flexible(
                      child: ListView.builder(
                        itemBuilder: ((context, index) {
                          final product = bagViewModel.productsBag[index];
                          return ListTile(
                            title: Text(product.name),
                            subtitle: Text("\$${product.price.toString()}"),
                            trailing: IconButton(
                              onPressed: () {
                                bagViewModel.removeProduct(product);
                              },
                              icon: const Icon(
                                Icons.delete,
                              ),
                            ),
                          );
                        }),
                        itemCount: bagViewModel.totalProducts,
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: \$${bagViewModel.totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {},
                      child: const Text("Checkout"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
