import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../presentation/product_details/view/product_details_screen.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class SharedWidget {
  static Widget defaultButton({
    required String label,
    required BuildContext context,
    required double width,
    required Function() onPressed,
    double height = AppSize.s40,
    double raidus = AppSize.s8,
  }) =>
      Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(
            raidus,
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          color: ColorManager.primaryColor,
          onPressed: onPressed,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.black,
                ),
          ),
        ),
      );

  static Widget defaultTextFormField({
    required TextEditingController controller,
    required TextInputType textInputType,
    required BuildContext context,
    bool obscure = false,
    String? Function(String?)? validator,
    void Function(String)? onFieldSubmitted,
    Function()? onTap,
    Function(String value)? onChanged,
    String? hint,
    Widget? suffixIcon,
    Widget? prefixIcon,
    int maxLines = 1,
  }) =>
      TextFormField(
        onTap: onTap,
        style: Theme.of(context).textTheme.bodyMedium,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscure,
        onChanged: onChanged,
        cursorColor: ColorManager.primaryColor,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width / AppSize.s16,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        maxLines: maxLines,
      );

  static Widget productItem({
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(),
          ),
        );
      },
      child: SizedBox(
        width: AppSize.s200.w,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: ColorManager.primaryColor,
                ),
                height: AppSize.s150.w,
                width: AppSize.s200.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s60,
                    horizontal:
                        MediaQuery.of(context).size.width / AppSize.s40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Product Name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorManager.black,
                                    fontSize: FontSizeManager.s18.sp),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "200.00",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: FontSizeManager.s18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
