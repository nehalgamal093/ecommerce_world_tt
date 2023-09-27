import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_commerce/bloc/add_product_bloc/add_product_bloc.dart';
import 'package:world_commerce/presentation/custom_widgets/form_field.dart';
import 'package:world_commerce/presentation/pages/main/main.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';
import '../../../repository/add_product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController nameController =
      TextEditingController(text: 'Nokia x');

  final TextEditingController descriptionController =
      TextEditingController(text: 'this is description after upload');

  final TextEditingController priceController =
      TextEditingController(text: '100');

  final TextEditingController photosController = TextEditingController();

  final TextEditingController priceAfterDiscountController =
      TextEditingController(text: '10');

  final TextEditingController categoryController =
      TextEditingController(text: '64b7d9979f685a9cdff59a0b');
  final TextEditingController soldController = TextEditingController(text: '1');
  final TextEditingController subCategoryController =
      TextEditingController(text: "64b809c2138e0e8781b28392");

  final TextEditingController ratingAvgController =
      TextEditingController(text: '2');

  final TextEditingController ratingCountController =
      TextEditingController(text: '2');

  final TextEditingController brandController =
      TextEditingController(text: '64bb9e4cac77717c27d742ef');

  final TextEditingController quantityController =
      TextEditingController(text: '100');

  List<File> selectedImages = []; // List of selected image

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.lightGrey,
        body: ListView(
          shrinkWrap: true,
          children: [
            formField(context, 'Name', nameController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Description', descriptionController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Price', priceController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(
                context,
                'Price After Discount',
                priceAfterDiscountController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Category', categoryController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'SubCategory', subCategoryController,
                const Icon(Icons.add, color: ColorManager.grey)),
            ElevatedButton(
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              child: const Text('Upload photos'),
            ),
            formField(
              context,
              'Rating Avg',
              ratingAvgController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
            formField(
              context,
              'Rating Count',
              ratingCountController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
            formField(
              context,
              'Brand',
              brandController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
            formField(
              context,
              'Quantity',
              quantityController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
            formField(
              context,
              'Sold',
              soldController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            context.read<AddProductBloc>().add(
                  AddProductEv(
                      title: nameController.text,
                      description: descriptionController.text,
                      price: int.parse(priceController.text),
                      priceAfterDiscount:
                          int.parse(priceAfterDiscountController.text),
                      ratingAvg: int.parse(ratingAvgController.text),
                      quantity: int.parse(quantityController.text),
                      ratingCount: int.parse(ratingCountController.text),
                      sold: int.parse(soldController.text),
                      category: categoryController.text,
                      subCategory: subCategoryController.text,
                      brand: brandController.text,
                      images: selectedImages),
                );
          },
          child: BlocListener<AddProductBloc, AddProductState>(
            listener: (context, state) {
              if (state.loadingStatus == AddProductStatus.loaded) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Main()),
                );
              } else if (state.loadingStatus == AddProductStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AddProductRepo.errMsg,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              child: BottomAppBar(
                color: ColorManager.green,
                child: Center(
                  child: context.watch<AddProductBloc>().state.loadingStatus ==
                          AddProductStatus.loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Add Product',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final List<XFile> images = await ImagePicker().pickMultiImage();
    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        selectedImages.add(File(images[i].path));
      }
    }
  }
}
