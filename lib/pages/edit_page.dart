import 'package:flutter/material.dart';
import '../models/product_model.dart';

class EditPage extends StatefulWidget {
  final Product? product;

  const EditPage({super.key, this.product});

  @override
   State<EditPage> createState() => _EditPageState();

}

class _EditPageState extends State<EditPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountPercentageController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController thumbnailController = TextEditingController();

  @override
  void initState() {
    if (widget.product != null) {
      titleController.text = widget.product!.title;
      brandController.text = widget.product!.brand;
      descriptionController.text = widget.product!.description;
      priceController.text = widget.product!.price.toString();
      discountPercentageController.text = widget.product!.discountPercentage.toString();
      ratingController.text = widget.product!.rating.toString();
      stockController.text = widget.product!.stock.toString();
      categoryController.text = widget.product!.category;
      thumbnailController.text = widget.product!.thumbnail;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: brandController,
                decoration: const InputDecoration(labelText: 'Brand'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: discountPercentageController,
                decoration: const InputDecoration(labelText: 'Discount P'),
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                controller: ratingController,
                decoration: const InputDecoration(labelText: 'Rating'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: stockController,
                decoration: const InputDecoration(labelText: 'Stock'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: thumbnailController,
                decoration: const InputDecoration(labelText: 'Image link'),
              ),
              ElevatedButton(
                onPressed: () {
                  Product editedProduct = Product(
                    id: widget.product!.id,
                    title: titleController.text,
                    brand: brandController.text,
                    description: descriptionController.text,
                    price: int.parse(priceController.text),
                    discountPercentage: double.parse(discountPercentageController.text),
                    rating: double.parse(ratingController.text),
                    stock: int.parse(stockController.text),
                    category: categoryController.text,
                    thumbnail: thumbnailController.text,
                    images: [],
                  );
                  Navigator.pop(context, editedProduct);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
