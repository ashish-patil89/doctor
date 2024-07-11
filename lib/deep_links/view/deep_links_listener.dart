import 'package:doctor/deep_links/deep_links.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeepLinksListener extends StatelessWidget {
  const DeepLinksListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeepLinksCubit, DeepLinksState>(
      listener: (context, state) {
        /* _navigateToBaseRoute(
          context,
          state,
        );*/
      },
      child: child,
    );
  }
}
