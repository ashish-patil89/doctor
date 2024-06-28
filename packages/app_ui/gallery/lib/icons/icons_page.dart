import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class IconsPage extends StatefulWidget {
  const IconsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const IconsPage());
  }

  @override
  State<IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  List<dynamic> filteredIcons = Assets.icons.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white38,
      appBar: AppBar(title: const Text('Icons')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search icons',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (search) {
              setState(() {
                if (search.isNotEmpty) {
                  filteredIcons = Assets.icons.values.where((icon) {
                    if (icon is SvgGenImage) {
                      return icon.path
                          .toLowerCase()
                          .contains(search.toLowerCase());
                    }

                    if (icon is AssetGenImage) {
                      return icon.path
                          .toLowerCase()
                          .contains(search.toLowerCase());
                    }

                    return false;
                  }).toList();
                } else {
                  filteredIcons = Assets.icons.values;
                }
              });
            },
          ),
          Expanded(
            child: ListView.separated(
              itemCount: filteredIcons.length,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                final icon = filteredIcons[index];

                if (icon is SvgGenImage) {
                  return _ListItem(
                    icon: icon.svg(),
                    title: Text(
                      icon.path.replaceAll('assets/icons/', ''),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }

                if (icon is AssetGenImage) {
                  return _ListItem(
                    icon: icon.image(),
                    title: Text(
                      icon.path.replaceAll('assets/icons/', ''),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }

                return const SizedBox();
              },
              separatorBuilder: (_, __) => const Divider(
                indent: 8,
                endIndent: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.icon,
    required this.title,
  });

  final Widget icon;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 64,
                maxHeight: 64,
              ),
              child: icon,
            ),
          ),
          Expanded(
            child: title,
          ),
        ],
      ),
    );
  }
}
