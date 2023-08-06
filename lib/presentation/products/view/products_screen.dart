// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/common/widget.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/font_manager.dart';
import '../../../app/resources/routes_manager.dart';
import '../../../app/resources/strings_manager.dart';
import '../../../app/resources/styles_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../../app/services/shared_prefrences/cache_helper.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  List<DropdownMenuItem> dropdownMenuItem = [
    DropdownMenuItem(
      value: "category 1",
      child: Text(
        "category 1",
        style: getMediumStyle(
          fontSize: FontSizeManager.s16.sp,
          color: ColorManager.primaryColor,
        ),
      ),
    ),
    DropdownMenuItem(
      value: "category 2",
      child: Text(
        "category 2",
        style: getMediumStyle(
          fontSize: FontSizeManager.s16.sp,
          color: ColorManager.primaryColor,
        ),
      ),
    ),
    DropdownMenuItem(
      value: "category 3",
      child: Text(
        "category 3",
        style: getMediumStyle(
          fontSize: FontSizeManager.s16.sp,
          color: ColorManager.primaryColor,
        ),
      ),
    ),
    DropdownMenuItem(
      value: "category 4",
      child: Text(
        "category 4",
        style: getMediumStyle(
          fontSize: FontSizeManager.s16.sp,
          color: ColorManager.primaryColor,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brand Name"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.cartRoute,
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s60,
          horizontal: MediaQuery.of(context).size.width / AppSize.s40,
        ),
        child: Column(
          children: [
            SharedWidget.defaultTextFormField(
              context: context,
              textInputType: TextInputType.text,
              controller: TextEditingController(),
              hint: AppStrings.searchHint.tr(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: CacheHelper.getData(key: SharedKey.isDark)== true
                        ? ColorManager.black
                        : ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                    items: dropdownMenuItem,
                    hint: Text(
                      AppStrings.categories.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    onChanged: (object) {},
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s40,
                ),
                Expanded(
                  child: SharedWidget.defaultTextFormField(
                    controller: TextEditingController(),
                    textInputType: TextInputType.number,
                    context: context,
                    hint: AppStrings.price.tr(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return SharedWidget.productItem(context: context);
                },
                semanticChildCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSize.s10.w,
                  crossAxisSpacing: AppSize.s5.h,
                  childAspectRatio: 1 / 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
