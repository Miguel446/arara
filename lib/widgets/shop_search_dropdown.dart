import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mixins/debounced_shop_search_mixin.dart';

class ShopSearchDropdown extends ConsumerStatefulWidget {
  final ValueChanged<String?>? onSelected;

  const ShopSearchDropdown({
    super.key,
    this.onSelected,
  });

  @override
  ConsumerState<ShopSearchDropdown> createState() => _ShopSearchDropdownState();
}

class _ShopSearchDropdownState extends ConsumerState<ShopSearchDropdown>
    with DebouncedShopSearchMixin {
  String? selectedId;

  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => DropdownMenu<String?>(
        controller: textController,
        requestFocusOnTap: true,
        hintText: 'Procure por avaliações',
        inputDecorationTheme: const InputDecorationTheme(
          constraints: BoxConstraints(minWidth: 400),
        ),
        width: constraints.maxWidth,
        selectedTrailingIcon: const Icon(Icons.check_rounded),
        menuHeight: 200,
        dropdownMenuEntries: shops
            .map(
              (shop) => DropdownMenuEntry(
                value: shop.id,
                label: shop.name,
              ),
            )
            .toList(),
        onSelected: (value) {
          FocusScope.of(context).unfocus();

          if (selectedId == value) {
            selectedId = null;
            textController.clear();
          } else {
            selectedId = value;
          }

          widget.onSelected?.call(selectedId);
        },
      ),
    );
  }
}
