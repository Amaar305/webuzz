import 'package:flutter/material.dart';


class CreateBuzzAppBar extends StatelessWidget {
  const CreateBuzzAppBar({
    super.key,
    required this.title,
    required this.onChanged,
    required this.selectedValue,
    required this.items,
  });
  final String title;
  final void Function(String? value) onChanged;
  final String selectedValue;

  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        Container(
          width: 100,
          height: 35,
          decoration: BoxDecoration(
            // color: AppPallete.kGreyColour,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: DropdownButton(
              isDense: true,
              borderRadius: BorderRadius.circular(20),
              underline: Container(),
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 20,
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
              value: selectedValue,
              elevation: 2,
            ),
          ),
        ),
      ],
    );
  }
}
