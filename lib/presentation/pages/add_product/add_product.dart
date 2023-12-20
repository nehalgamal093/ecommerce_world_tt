import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_commerce/bloc/add_product_bloc/add_product_bloc.dart';
import 'package:world_commerce/presentation/custom_widgets/form_field.dart';
import 'package:world_commerce/presentation/pages/add_product/sections/drop_brands.dart';
import 'package:world_commerce/presentation/pages/add_product/sections/drop_categories.dart';
import 'package:world_commerce/presentation/pages/add_product/sections/drop_sub_categories.dart';
import 'package:world_commerce/presentation/pages/add_product/sections/images_view.dart';
import 'package:world_commerce/presentation/pages/main/main.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';
import '../../../repository/add_product.dart';
import '../../custom_widgets/top_bar.dart';

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

  final TextEditingController soldController = TextEditingController(text: '1');

  final TextEditingController ratingAvgController =
      TextEditingController(text: '2');

  final TextEditingController ratingCountController =
      TextEditingController(text: '2');

  final TextEditingController quantityController =
      TextEditingController(text: '100');

  List<File> selectedImages = []; // List of selected image

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: topBar('Add product', true, context, true),
        body: ListView(
          shrinkWrap: true,
          children: [
            formField(context, 'Name', nameController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Description', descriptionController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Price', priceController,
                const Icon(Icons.add, color: ColorManager.grey)),
            DropCategories(),
            DropSubCategories(),
            DropBrands(),
            formField(
                context,
                'Price After Discount',
                priceAfterDiscountController,
                const Icon(Icons.add, color: ColorManager.grey)),
            InkWell(
              onTap: () {
                takePhoto(ImageSource.gallery);
                setState(() {});
              },
              child: Row(
                children: [
                  Container(
                      width: width * .50,
                      height: 50,
                      child: imagesView(context, selectedImages)),
                  Container(
                    width: width * .50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 221, 68, 248)),
                    child: const Center(
                      child: Text(
                        'Upload photos',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
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
            InkWell(
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
                          category: dropdownValue!,
                          subCategory: subCategoryDropDown!,
                          brand: brandsDropDown!,
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
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  width: width * 50,
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.indigo),
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: context
                                  .watch<AddProductBloc>()
                                  .state
                                  .loadingStatus ==
                              AddProductStatus.loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Add Product',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
//203