import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

Widget disabledBtn(
  String label,
  bool isNext,
) {
  return Container(
    decoration: const BoxDecoration(
      color: ColorManager.grey,
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    ),
    width: 90,
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        isNext
            ? Container()
            : CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: Align(
                  alignment:
                      isNext ? Alignment.centerLeft : Alignment.centerRight,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                ),
              ),
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        isNext
            ? CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: Align(
                  alignment:
                      isNext ? Alignment.centerLeft : Alignment.centerRight,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                  ),
                ),
              )
            : Container(),
      ],
    ),
  );
}
