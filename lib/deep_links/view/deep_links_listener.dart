import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orb_mobile/deep_links/deep_links.dart';

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
