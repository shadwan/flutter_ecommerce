import 'package:ecommerce/app/pages/admin/admin_add_product.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(firebaseAuthProvider).signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const AdminAddProductPage()),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder<List<Product>>(
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ListTile(
                  title: Text(product.name),
                  trailing: IconButton(
                      onPressed: () => ref
                          .read(databaseProvider)!
                          .deleteProduct(product.id!),
                      icon: const Icon(Icons.delete)),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
        stream: ref.read(databaseProvider)!.getProducts(),
      ),
    );
  }
}
