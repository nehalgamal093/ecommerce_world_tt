// import 'package:flutter/material.dart';

// import '../../../../Services/get_list.dart';

// class DropCategories extends StatefulWidget {
//   String dropdownValue;
//   DropCategories({super.key, required this.dropdownValue});

//   @override
//   State<DropCategories> createState() => _DropCategoriesState();
// }

// class _DropCategoriesState extends State<DropCategories> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<dynamic>>(
//         future: GetLists().getCategories(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             // dropdownValue = snapshot.data![0]['_id'];

//             return DropdownButtonFormField<String>(
//                 value: widget.dropdownValue,
//                 onChanged: (String? newValue) {
//                   print('new val ${newValue}');
//                   setState(() {
//                     widget.dropdownValue = newValue!;
//                     print('Drop Down ${widget.dropdownValue}');
//                   });
//                 },
//                 items: snapshot.data!.map<DropdownMenuItem<String>>((value) {
//                   return DropdownMenuItem<String>(
//                     value: value['_id'],
//                     child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8),
//                         child: Text(value['name'])),
//                   );
//                 }).toList());
//           } else {
//             return CircularProgressIndicator();
//           }
//         });
//   }
// }
