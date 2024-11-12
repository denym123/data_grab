import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class DefaultSelect extends StatelessWidget {
  final String? label;
  final String? hint;
  final List<OptionModel?>? options;
  final OptionModel? value;
  final ValueSetter<OptionModel?>? onChanged;
  final String? Function(OptionModel?)? validator;

  const DefaultSelect({
    super.key,
    this.label,
    this.hint,
    required this.options,
    this.value,
    this.onChanged, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final dropdownKey = GlobalKey<DropdownSearchState<OptionModel>>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty) ...[
          Text(
            label!,
            style: context.textStyles.semiBold16.copyWith(
              color: context.colors.dark,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        DropdownSearch<OptionModel?>(
          validator: validator,
          key: dropdownKey,
          dropdownButtonProps: DropdownButtonProps(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 20.sp,
              color: context.colors.dark,
            ),
          ),
          dropdownBuilder: (context, selectedItem) {
            return Text(
              value?.name ?? "",
              style: context.textStyles.medium.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                height: 1.5.h,
              ),
            );
          },
          filterFn: (item, filter) {
            return item
                .toString()
                .removeDiacritics()
                .toLowerCase()
                .contains(filter.toString().removeDiacritics().toLowerCase());
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration:
            context.styles.procedureTextDecoration.copyWith(
              hintText: hint,
            ),
          ),
          popupProps: PopupProps.menu(
            menuProps: MenuProps(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            fit: FlexFit.loose,
            searchFieldProps: TextFieldProps(
              decoration: context.styles.procedureTextDecoration.copyWith(
                hintText: hint,
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.sp,
                  color: context.colors.dark,
                ),
              ),
            ),
            searchDelay: Duration.zero,
            showSearchBox: true,
            emptyBuilder: (context, searchEntry) {
              return Center(
                child: Text(
                  "Nenhum item encontrado",
                  style: context.textStyles.medium.copyWith(
                    fontSize: 14.sp,
                    color: context.colors.dark,
                  ),
                ),
              );
            },
          ),
          itemAsString: (item) => item?.name ?? "",
          selectedItem: value,
          items: options ?? [],
          onChanged: onChanged,
        ),
      ],
    );
  }
}