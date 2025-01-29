import 'package:compareapp/resources/widgets/buttons/form_drop_down_field.dart';
import 'package:flutter/material.dart';
import 'package:compareapp/resources/utils/app_colors.dart';


class FilterDialog extends StatelessWidget {
  final String? selectedSubCategoryValue;
  final String? selectedSortValue;
  final String? selectedBrandsValue;
  final String? selectedBasketValue;
  final String? selectedStoreValue;

  final ValueChanged<String?> onChangeSubCategory;
  final ValueChanged<String?> onChangeSort;
  final ValueChanged<String?> onChangeBrands;
  final ValueChanged<String?> onChangeBasket;
  final ValueChanged<String?> onChangeStore;

  const FilterDialog({
    super.key,
    required this.selectedSubCategoryValue,
    required this.selectedSortValue,
    required this.selectedBrandsValue,
    required this.selectedBasketValue,
    required this.selectedStoreValue,
    required this.onChangeSubCategory,
    required this.onChangeSort,
    required this.onChangeBrands,
    required this.onChangeBasket,
    required this.onChangeStore,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10.0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(width: 24), // Placeholder for alignment
                ],
              ),
              const SizedBox(height: 16),

              // Sub Category
              const Text(
                "Sub Category",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              FormDropDownField<String>(
                hint: "Select Sub Category",
                items: const ["Baby Diaper", "Napkins"],
                value: selectedSubCategoryValue,
                onChange: onChangeSubCategory,
              ),
              const SizedBox(height: 16),

              // Sort By
              const Text(
                "Sort By",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              FormDropDownField<String>(
                hint: "Select Sorting Option",
                items: const ["Newest", "Date Wise"],
                value: selectedSortValue,
                onChange: onChangeSort,
              ),
              const SizedBox(height: 16),

              // Brands
              const Text(
                "Brands",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              FormDropDownField<String>(
                hint: "Select Brand",
                items: const ["All", "Pampers"],
                value: selectedBrandsValue,
                onChange: onChangeBrands,
              ),
              const SizedBox(height: 16),

              // Basket
              const Text(
                "Basket",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              FormDropDownField<String>(
                hint: "Select Basket",
                items: const ["All", "Few"],
                value: selectedBasketValue,
                onChange: onChangeBasket,
              ),
              const SizedBox(height: 16),

              // Stores
              const Text(
                "Stores",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              FormDropDownField<String>(
                hint: "Select Store",
                items: const ["All", "New"],
                value: selectedStoreValue,
                onChange: onChangeStore,
              ),
              const SizedBox(height: 16),

              // Apply Button
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appBlueColor,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  "Apply",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
