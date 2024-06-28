import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ColorsPage extends StatefulWidget {
  const ColorsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ColorsPage());
  }

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const colorItems = [
      _ColorItem(
        name: 'Primary Black',
        color: AppColors.primaryBlack,
      ),
      _ColorItem(
        name: 'Primary White',
        color: AppColors.primaryWhite,
      ),
      _ColorItem(
        name: 'Primary Orange',
        color: AppColors.primaryGreen,
      ),
      _ColorItem(
        name: 'Background Primary',
        color: AppColors.backgroundPrimary,
      ),
      _ColorItem(
        name: 'Background Post',
        color: AppColors.backgroundPost,
      ),
      _ColorItem(
        name: 'Menu',
        color: AppColors.menu,
      ),
      _ColorItem(
        name: 'Black 60%',
        color: AppColors.black60,
      ),
      _ColorItem(
        name: 'Black 38%',
        color: AppColors.black38,
      ),
      _ColorItem(
        name: 'Black 12%',
        color: AppColors.black12,
      ),
      _ColorItem(
        name: 'Black 8%',
        color: AppColors.black8,
      ),
      _ColorItem(
        name: 'Black 4%',
        color: AppColors.black4,
      ),
      _ColorItem(
        name: 'White 60%',
        color: AppColors.white60,
      ),
      _ColorItem(
        name: 'White 38%',
        color: AppColors.white38,
      ),
      _ColorItem(
        name: 'White 12%',
        color: AppColors.white12,
      ),
      _ColorItem(
        name: 'White 8%',
        color: AppColors.white8,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Colors')),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: colorItems,
        ),
      ),
    );
  }
}

class _ColorItem extends StatelessWidget {
  const _ColorItem({required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(name),
          const Gap(AppSpacing.lg),
          Expanded(
            child: SingleChildScrollView(
              child: color is MaterialColor
                  ? _MaterialColorView(color: color as MaterialColor)
                  : _ColorSquare(color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialColorView extends StatelessWidget {
  const _MaterialColorView({required this.color});

  static const List<int> shades = [
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
  ];

  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: shades.map((shade) {
        return _ColorSquare(color: color[shade]!);
      }).toList(),
    );
  }
}

class _ColorSquare extends StatelessWidget {
  const _ColorSquare({required this.color});

  final Color color;

  TextStyle get textStyle {
    return TextStyle(
      color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
    );
  }

  String get hexCode {
    if (color.value.toRadixString(16).length <= 2) {
      return '--';
    } else {
      return '#${color.value.toRadixString(16).toUpperCase()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Stack(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color, border: Border.all()),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: Text(hexCode, style: textStyle)),
          ),
        ],
      ),
    );
  }
}
