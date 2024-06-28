import 'dart:developer';
import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template app_text_field}
/// The app text field.
/// {@endtemplate}
class AppTextField extends StatelessWidget {
  /// {@macro app_text_field}
  const AppTextField._({
    this.textStyle,
    this.padding,
    this.hintStyle,
    this.textAlign,
    this.height,
    this.keyboardType,
    this.keyboardAppearance,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.hintText,
    this.controller,
    this.backgroundColor,
    this.border,
    this.maxLength,
    this.suffixText,
    this.suffixTextStyle,
    this.suffixTextColor,
    this.inputFormatters,
    this.showContextMenu = false,
    this.onBoldPressed,
    this.onItalicPressed,
    this.minLines,
    this.maxLines,
    this.boldLabel,
    this.italicLabel,
    this.contentPadding,
    this.scrollController,
    this.focusNode,
    this.autoFocus = false,
    this.autofillHints,
    this.onChanged,
    this.fillColor,
    this.isExpanded = false,
    this.isEnabled = true,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.textInputAction,
    this.textCapitalization,
    this.onSubmitted,
    this.textFieldKey,
    this.initialValue,
    this.onEditingComplete,
    this.borderRadius,
    this.showUnderlineInputBorder = false,
    this.underlineInputBorderColor,
    this.unfocusOnTapOutside = true,
    this.prefixText,
    this.prefixTextStyle,
    super.key,
  });

  /// The primary text field.
  const AppTextField.primary({
    TextAlign? textAlign,
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    double? height,
    Widget? suffix,
    Widget? suffixIcon,
    Widget? prefixIcon,
    TextInputType? keyboardType,
    Brightness? keyboardAppearance,
    String? hintText,
    TextEditingController? controller,
    Color? backgroundColor,
    BoxBorder? border,
    BorderRadius? borderRadius,
    int? maxLength,
    String? suffixText,
    TextStyle? suffixTextStyle,
    Color? suffixTextColor,
    Color? fillColor,
    List<TextInputFormatter>? inputFormatters,
    FocusNode? focusNode,
    TextStyle? hintStyle,
    TextStyle? style,
    ValueChanged<String>? onChanged,
    bool? isExpanded,
    bool? isEnabled,
    bool? autocorrect,
    bool? enableSuggestions,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onEditingComplete,
    Key? textFieldKey,
    Key? key,
    String? initialValue,
    int? minLines,
    int? maxLines,
    bool? showUnderlineInputBorder,
    Color? underlineInputBorderColor,
    bool? unfocusOnTapOutside,
    bool? autoFocus,
    List<String>? autofillHints,
    Widget? prefix,
    String? prefixText,
    TextStyle? prefixTextStyle,
    bool? showContextMenu,
  }) : this._(
          key: key,
          textAlign: textAlign ?? TextAlign.left,
          padding: padding ?? EdgeInsets.zero,
          contentPadding: contentPadding ?? EdgeInsets.zero,
          height: height ?? 48,
          keyboardType: keyboardType ?? TextInputType.name,
          keyboardAppearance: keyboardAppearance ?? Brightness.light,
          suffix: suffix,
          suffixIcon: suffixIcon,
          prefix: prefix,
          prefixIcon: prefixIcon,
          hintText: hintText ?? '',
          controller: controller,
          backgroundColor: backgroundColor,
          maxLength: maxLength,
          border: border,
          borderRadius: borderRadius,
          suffixText: suffixText,
          suffixTextStyle: suffixTextStyle,
          suffixTextColor: suffixTextColor,
          fillColor: fillColor,
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          hintStyle: hintStyle,
          textStyle: style,
          onChanged: onChanged,
          isExpanded: isExpanded ?? false,
          isEnabled: isEnabled ?? true,
          autocorrect: autocorrect ?? true,
          enableSuggestions: enableSuggestions ?? true,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          onSubmitted: onSubmitted,
          textFieldKey: textFieldKey,
          onEditingComplete: onEditingComplete,
          initialValue: initialValue,
          minLines: minLines,
          maxLines: maxLines,
          showUnderlineInputBorder: showUnderlineInputBorder ?? false,
          underlineInputBorderColor: underlineInputBorderColor,
          unfocusOnTapOutside: unfocusOnTapOutside ?? true,
          autoFocus: autoFocus ?? false,
          autofillHints: autofillHints,
          prefixText: prefixText,
          prefixTextStyle: prefixTextStyle,
          showContextMenu: showContextMenu ?? false,
        );

  /// The selectable text with [ContextMenuButtonItem].
  const AppTextField.selectableField({
    double? height,
    Widget? suffixIcon,
    Widget? prefixIcon,
    TextInputType? keyboardType,
    Brightness? keyboardAppearance,
    String? hintText,
    TextEditingController? controller,
    Color? backgroundColor,
    BoxBorder? border,
    BorderRadius? borderRadius,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    Key? key,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    GestureTapCallback? onBoldPressed,
    GestureTapCallback? onItalicPressed,
    int? minLines,
    int? maxLines,
    String? boldLabel,
    String? italicLabel,
    EdgeInsets? contentPadding,
    ScrollController? scrollController,
    FocusNode? focusNode,
    bool? autoFocus,
    ValueChanged<String>? onChanged,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization,
    VoidCallback? onEditingComplete,
    String? initialValue,
    bool? unfocusOnTapOutside,
  }) : this._(
          key: key,
          height: height,
          keyboardType: keyboardType ?? TextInputType.name,
          keyboardAppearance: keyboardAppearance ?? Brightness.light,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText ?? '',
          controller: controller,
          backgroundColor: backgroundColor,
          maxLength: maxLength,
          border: border,
          borderRadius: borderRadius,
          inputFormatters: inputFormatters,
          textStyle: textStyle,
          hintStyle: hintStyle,
          showContextMenu: true,
          onBoldPressed: onBoldPressed,
          onItalicPressed: onItalicPressed,
          maxLines: maxLines,
          minLines: minLines,
          boldLabel: boldLabel,
          italicLabel: italicLabel,
          contentPadding: contentPadding,
          scrollController: scrollController,
          focusNode: focusNode,
          autoFocus: autoFocus ?? false,
          onChanged: onChanged,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          initialValue: initialValue,
          onEditingComplete: onEditingComplete,
          unfocusOnTapOutside: unfocusOnTapOutside ?? true,
        );

  /// The selectable text with [ContextMenuButtonItem].
  const AppTextField.editProfileOrCommunityDetails({
    TextAlign? textAlign,
    TextInputType? keyboardType,
    Brightness? keyboardAppearance,
    String? hintText,
    Widget? prefixIcon,
    double? height,
    EdgeInsets? contentPadding,
    TextEditingController? controller,
    int? maxLength,
    FocusNode? focusNode,
    TextStyle? hintStyle,
    TextStyle? style,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    int? minLines,
    int? maxLines,
    bool? showUnderlineInputBorder,
    bool? showContextMenu,
    bool? isExpanded,
    bool? isEnabled,
    bool? autoFocus,
    Color? backgroundColor,
    bool? unfocusOnTapOutside,
    BoxBorder? border,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization,
    Key? key,
  }) : this._(
          key: key,
          textAlign: textAlign ?? TextAlign.left,
          padding: EdgeInsets.zero,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                vertical: AppSpacing.spacing5,
              ),
          height: height ?? 48,
          keyboardType: keyboardType ?? TextInputType.text,
          prefixIcon: prefixIcon,
          keyboardAppearance: keyboardAppearance ?? Brightness.dark,
          hintText: hintText ?? '',
          controller: controller,
          backgroundColor: backgroundColor ?? Colors.transparent,
          maxLength: maxLength,
          border: border,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          fillColor: Colors.transparent,
          focusNode: focusNode,
          isExpanded: isExpanded ?? false,
          isEnabled: isEnabled ?? true,
          hintStyle: hintStyle,
          textStyle: style,
          onChanged: onChanged,
          autocorrect: false,
          enableSuggestions: false,
          onSubmitted: onSubmitted,
          minLines: minLines,
          maxLines: maxLines,
          textInputAction: textInputAction,
          showUnderlineInputBorder: showUnderlineInputBorder ?? false,
          underlineInputBorderColor: AppColors.white12,
          unfocusOnTapOutside: unfocusOnTapOutside ?? true,
          autoFocus: autoFocus ?? false,
          showContextMenu: showContextMenu ?? false,
        );

  /// The key of text field.
  final Key? textFieldKey;

  /// The text align of text field.
  final TextAlign? textAlign;

  /// The content padding of text field.
  final EdgeInsets? padding;

  /// The height for input field.
  final double? height;

  /// The keyboard type required for the text field.
  final TextInputType? keyboardType;

  /// The keyboard appearance for the text field.
  final Brightness? keyboardAppearance;

  /// The suffix widget for the text field.
  final Widget? suffix;

  /// The icon used as suffix for the text field.
  final Widget? suffixIcon;

  /// The prefix widget for the text field.
  final Widget? prefix;

  /// The icon used as prefix for the text field.
  final Widget? prefixIcon;

  /// The hint text displayed on the text field.
  final String? hintText;

  /// The controller for input.
  final TextEditingController? controller;

  /// The backgroundColor for Container.
  final Color? backgroundColor;

  /// Specifies [InputDecoration.fillColor] for input field.
  final Color? fillColor;

  /// The border for the text field.
  final BoxBorder? border;

  /// The border radius for the text field.
  final BorderRadius? borderRadius;

  /// The maxLength for input field.
  final int? maxLength;

  /// The input formatter for the text filed.
  final List<TextInputFormatter>? inputFormatters;

  /// The suffixText used after input.
  final String? suffixText;

  /// The suffixText color.
  final Color? suffixTextColor;

  /// A Flag to indicate weather to show context menu or not.
  final bool showContextMenu;

  /// The font size for the text field.
  final TextStyle? textStyle;

  /// The font style for the suffix text.
  final TextStyle? suffixTextStyle;

  /// The font size for the hint text field.
  final TextStyle? hintStyle;

  /// The Void tap callback for bold context menu.
  final GestureTapCallback? onBoldPressed;

  /// The Void tap callback for italic context menu.
  final GestureTapCallback? onItalicPressed;

  /// The minimum number of lines.
  final int? minLines;

  /// The maximum number of lines.
  final int? maxLines;

  /// The label for bold context menu.
  final String? boldLabel;

  /// The label for italic context menu.
  final String? italicLabel;

  /// The padding for content.
  final EdgeInsets? contentPadding;

  /// The scroll controller for the text field.
  final ScrollController? scrollController;

  /// The focus node for the text field.
  final FocusNode? focusNode;

  /// Whether the autofocus is enabled for this text field.
  final bool autoFocus;

  /// The autofill hints for this text field.
  final List<String>? autofillHints;

  /// The callback for value changes.
  final ValueChanged<String>? onChanged;

  /// The height of text field is expandable.
  final bool isExpanded;

  /// Is text field is enabled.
  final bool isEnabled;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// Whether to enable suggestions.
  final bool enableSuggestions;

  /// Whether to show underline border.
  final bool showUnderlineInputBorder;

  /// The underline input border color.
  final Color? underlineInputBorderColor;

  /// The text input action of text field.
  final TextInputAction? textInputAction;

  /// The text capitalization of text field.
  final TextCapitalization? textCapitalization;

  /// The callback submitting the text field.
  final ValueChanged<String>? onSubmitted;

  /// The callback when editing is complete.
  final VoidCallback? onEditingComplete;

  /// The initial value of text field.
  final String? initialValue;

  /// Whether to unfocus this text field on tap outside.
  ///
  /// Defaults to `true`.
  final bool unfocusOnTapOutside;

  /// The formatter pattern for decimal with value from 0 to 8.
  static const String formatterDecimal = r'^\d+\.?\d{0,8}';

  /// The formatter pattern for decimal with value from 0 to 2.
  static const String formatter2Decimal = r'^\d+\.?\d{0,2}';

  /// The formatter pattern for alphanumeric value.
  static const String formatterAlphanumeric = r'^[a-zA-Z0-9]+$';

  /// The prefixText.
  final String? prefixText;

  /// The style of prefix text.
  final TextStyle? prefixTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isExpanded ? null : height,
      padding: padding ?? EdgeInsets.zero,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white60,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.md),
        border: border,
      ),
      child: TextFormField(
        key: textFieldKey,
        initialValue: initialValue,
        onEditingComplete: onEditingComplete,
        enabled: isEnabled,
        autofocus: autoFocus,
        autocorrect: autocorrect,
        autofillHints: autofillHints,
        enableSuggestions: enableSuggestions,
        textAlign: textAlign ?? TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: keyboardType,
        keyboardAppearance: keyboardAppearance,
        cursorColor: AppColors.primaryGreen,
        scrollController: scrollController,
        focusNode: focusNode,
        controller: controller,
        maxLength: maxLength,
        maxLines: maxLines,
        minLines: minLines,
        textInputAction: textInputAction ?? TextInputAction.done,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        contextMenuBuilder: !showContextMenu
            ? null
            : (context, editableTextState) {
                final value = editableTextState.textEditingValue;
                final selection = value.selection;

                final buttonItems = [
                  ContextMenuButtonItem(
                    label: boldLabel,
                    onPressed: () {
                      final selectedText = selection.textInside(
                        controller!.text,
                      );
                      final updatedText =
                          // ignore: lines_longer_than_80_chars
                          '${selection.textBefore(controller!.text)}'
                          '**$selectedText**'
                          // ignore: lines_longer_than_80_chars
                          '${selection.textAfter(controller!.text)}';
                      // ignore: lines_longer_than_80_chars
                      log('[AppTextField] updated Bold Text -> $updatedText');
                      controller!.text = updatedText;
                      ContextMenuController.removeAny();
                    },
                  ),
                  ContextMenuButtonItem(
                    label: italicLabel,
                    onPressed: () {
                      final selectedText = selection.textInside(
                        controller!.text,
                      );
                      final updatedText =
                          // ignore: lines_longer_than_80_chars
                          '${selection.textBefore(controller!.text)}'
                          '_${selectedText}_'
                          // ignore: lines_longer_than_80_chars
                          '${selection.textAfter(controller!.text)}';
                      // ignore: lines_longer_than_80_chars
                      log('[AppTextField] updated Italic Text -> $updatedText');
                      controller!.text = updatedText;
                      ContextMenuController.removeAny();
                    },
                  ),
                  ...editableTextState.contextMenuButtonItems,
                ];

                return AdaptiveTextSelectionToolbar.buttonItems(
                  anchors: editableTextState.contextMenuAnchors,
                  buttonItems: buttonItems,
                );
              },
        selectionHeightStyle: BoxHeightStyle.max,
        selectionWidthStyle: BoxWidthStyle.max,
        cursorOpacityAnimates: true,
        enableInteractiveSelection: true,
        showCursor: true,
        onTapOutside: (event) {
          if (showContextMenu) {
            ContextMenuController.removeAny();
          }
          if (unfocusOnTapOutside) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          enabledBorder: showUnderlineInputBorder
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: underlineInputBorderColor ?? AppColors.white12,
                  ),
                )
              : null,
          focusedBorder: showUnderlineInputBorder
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: underlineInputBorderColor ?? AppColors.white12,
                  ),
                )
              : null,
          filled: true,
          suffixText: suffixText,
          suffixStyle: suffixTextStyle,
          suffixIconColor: suffixTextColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.md),
            borderSide: BorderSide.none,
          ),
          counterText: '',
          fillColor: fillColor ?? Colors.transparent,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.smd,
              ),
          prefix: prefix,
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(),
          suffix: suffix,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(),
          prefixText: prefixText,
          prefixStyle: prefixTextStyle ?? textStyle,
          hintText: hintText,
          hintStyle: hintStyle ??
              AppTextStyles.bodyText1.copyWith(
                color: AppColors.black38,
              ),
        ),
        style: textStyle ??
            AppTextStyles.bodyText1.copyWith(
              color: AppColors.primaryBlack,
            ),
        inputFormatters: inputFormatters ?? [],
      ),
    );
  }
}
