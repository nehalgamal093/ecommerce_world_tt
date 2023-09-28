import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_commerce/Services/get_list.dart';
import 'package:world_commerce/bloc/add_product_bloc/add_product_bloc.dart';
import 'package:world_commerce/bloc/brands_list_bloc/brands_list_bloc.dart';
import 'package:world_commerce/bloc/categories_list_bloc/categories_list_bloc.dart';
import 'package:world_commerce/presentation/custom_widgets/form_field.dart';
import 'package:world_commerce/presentation/pages/main/main.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';
import 'package:world_commerce/presentation/skeletons_loading/drop_down_skeleton.dart';
import 'package:world_commerce/repository/get_categories_list.dart';
import '../../../bloc/sub_categories_list_bloc/sub_categories_list_bloc.dart';
import '../../../repository/add_product.dart';
import '../../../repository/get_brands_list.dart';
import '../../../repository/get_subCategories_list.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? dropdownValue;
  String? subCategoryDropDown;
  String? brandsDropDown;
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
            BlocProvider(
              create: (context) => CategoriesListBloc(
                  getCategoriesRepository: GetCategoriesRepository())
                ..add(CategoriesEvent()),
              child: BlocBuilder<CategoriesListBloc, CategoriesListState>(
                  builder: ((context, state) {
                if (state.loadingStatus == CategoriesStatus.loading) {
                  return dropDownSkeleton();
                } else if (state.loadingStatus == CategoriesStatus.loaded) {
                  return DropdownButtonFormField(
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: state.data.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value['_id'],
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(value['name'])),
                        );
                      }).toList());
                } else {
                  return Text('error');
                }
              })),
            ),
            BlocProvider(
              create: (context) => SubCategoriesListBloc(
                  subCategoriesRepository: GetSubCategoriesRepository())
                ..add(SubCategoriesEvent()),
              child: BlocBuilder<SubCategoriesListBloc, SubCategoriesListState>(
                  builder: ((context, state) {
                if (state.loadingStatus == SubCategoriesStatus.loading) {
                  return dropDownSkeleton();
                } else if (state.loadingStatus == SubCategoriesStatus.loaded) {
                  return DropdownButtonFormField(
                      value: subCategoryDropDown,
                      onChanged: (String? newValue) {
                        setState(() {
                          subCategoryDropDown = newValue!;
                        });
                      },
                      items: state.data.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value['_id'],
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(value['name'])),
                        );
                      }).toList());
                } else {
                  return Text('error');
                }
              })),
            ),
            BlocProvider(
              create: (context) =>
                  BrandsListBloc(getBrandsRepository: GetBrandsRepository())
                    ..add(BrandsEvent()),
              child: BlocBuilder<BrandsListBloc, BrandsListState>(
                  builder: ((context, state) {
                if (state.loadingStatus == BrandsStatus.loading) {
                  return dropDownSkeleton();
                } else if (state.loadingStatus == BrandsStatus.loaded) {
                  return DropdownButtonFormField(
                      value: brandsDropDown,
                      onChanged: (String? newValue) {
                        setState(() {
                          brandsDropDown = newValue!;
                        });
                      },
                      items: state.data.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value['_id'],
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(value['name'])),
                        );
                      }).toList());
                } else {
                  return Text('error');
                }
              })),
            ),
            formField(
                context,
                'Price After Discount',
                priceAfterDiscountController,
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
            print('==== ${dropdownValue}');
            // context.read<AddProductBloc>().add(
            //       AddProductEv(
            //           title: nameController.text,
            //           description: descriptionController.text,
            //           price: int.parse(priceController.text),
            //           priceAfterDiscount:
            //               int.parse(priceAfterDiscountController.text),
            //           ratingAvg: int.parse(ratingAvgController.text),
            //           quantity: int.parse(quantityController.text),
            //           ratingCount: int.parse(ratingCountController.text),
            //           sold: int.parse(soldController.text),
            //           category: dropdownValue!,
            //           subCategory: subCategoryDropDown!,
            //           brand: brandsDropDown!,
            //           images: selectedImages),
            //     );
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
