import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template list_loader_item}
/// A list item that contains a progress indicator and performs
/// an action when becomes visible on the screen.
/// {@endtemplate}
class ListLoaderItem extends StatefulWidget {
  /// {@macro list_loader_item}
  const ListLoaderItem({
    required this.isVisible,
    this.onPresented,
    this.useWhiteLogo = true,
    super.key,
  });

  /// Whether this loader item is visible on the screen.
  final bool isVisible;

  /// An action that is performed when this loader item is presented.
  final VoidCallback? onPresented;

  /// Whether to use the white logo for the loader.
  final bool useWhiteLogo;

  @override
  State<ListLoaderItem> createState() => _ListLoaderItemState();
}

class _ListLoaderItemState extends State<ListLoaderItem> {
  @override
  void initState() {
    super.initState();

    widget.onPresented?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Center(
        child: LoadingWidget(
          type: LoadingType.orb,
          useWhiteLogo: widget.useWhiteLogo,
        ),
      ),
    );
  }
}
