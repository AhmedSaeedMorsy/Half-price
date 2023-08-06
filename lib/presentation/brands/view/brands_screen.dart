import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/resources/color_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../products/view/products_screen.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => brandItem(context: context),
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.of(context).size.height / AppSize.s40,
      ),
      itemCount: 10,
    );
  }

  Widget brandItem({required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductsScreen()));
      },
      child: Row(
        children: [
          Container(
            height: AppSize.s150.h,
            width: AppSize.s150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppSize.s6,
              ),
              color: ColorManager.primaryColor,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / AppSize.s40,
          ),
          Expanded(
            child: Text(
              "Brand Name",
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
