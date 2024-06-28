import 'dart:math';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template visual_attachments_grid}
/// A grid of visual attachments.
/// {@endtemplate}
class VisualAttachmentsGrid<TVisualAttachment extends Object>
    extends StatelessWidget {
  /// {@macro visual_attachments_grid}
  const VisualAttachmentsGrid({
    required this.attachments,
    required this.attachmentBuilder,
    this.firstAttachmentAspectRatio,
    super.key,
  });

  /// The attachment builder for the given [TVisualAttachment].
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  /// The attachments to be displayed.
  final List<TVisualAttachment> attachments;

  /// The optional aspect ratio of the first attachment.
  ///
  /// If provided and if there is only one attachment in [attachments],
  /// that aspect ratio will be used to display the attachment.
  ///
  /// If there are two attachments in [attachments], they will be shown
  /// in the landscape mode (if aspect ratio > 1)
  /// or in the portrait mode (if aspect ratio < 1).
  final double? firstAttachmentAspectRatio;

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) {
      return const SizedBox();
    }

    switch (attachments.length) {
      case 1:
        return _VisualAttachment1(
          attachment: attachments[0],
          attachmentBuilder: attachmentBuilder,
          attachmentAspectRatio: firstAttachmentAspectRatio,
        );
      case 2:
        return _VisualAttachment2(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
          isLandscape: firstAttachmentAspectRatio != null &&
              firstAttachmentAspectRatio! > 1,
        );
      case 3:
        return _VisualAttachment3(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
        );
      case 4:
        return _VisualAttachment4(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
        );
      case 5:
        return _VisualAttachment5(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
        );
      case 6:
        return _VisualAttachment6(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
        );
      case 7:
        return _VisualAttachment7(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
        );
      case 8:
        return _VisualAttachment8(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
        );
      case 9:
        return _VisualAttachment9(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
        );
      case 10:
        return _VisualAttachment10(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
        );
      case >= 10:
        return _VisualAttachment10(
          attachments: attachments,
          attachmentBuilder: attachmentBuilder,
        );
      default:
        return const SizedBox();
    }
  }
}

class _VisualAttachment1<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment1({
    required this.attachment,
    required this.attachmentBuilder,
    this.attachmentAspectRatio,
  });

  final TVisualAttachment attachment;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;
  final double? attachmentAspectRatio;

  static const minAspectRatio = 0.75;
  static const defaultAspectRatio = 357 / 282;

  @override
  Widget build(BuildContext context) {
    final aspectRatio = _aspectRatio;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: _VisualAttachment(
        attachment: attachment,
        attachmentBuilder: attachmentBuilder,
      ),
    );
  }

  double get _aspectRatio {
    final attachmentAspectRatio = this.attachmentAspectRatio;
    if (attachmentAspectRatio == null) {
      return defaultAspectRatio;
    }

    return max(attachmentAspectRatio, minAspectRatio);
  }
}

class _VisualAttachment2<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment2({
    required this.attachments,
    required this.attachmentBuilder,
    required this.isLandscape,
  });

  final List<TVisualAttachment> attachments;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    if (isLandscape) {
      return AspectRatio(
        aspectRatio: 357 / 444,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _VisualAttachment(
                attachment: attachments[0],
                attachmentBuilder: attachmentBuilder,
              ),
            ),
            const Gap(3),
            Expanded(
              child: _VisualAttachment(
                attachment: attachments[1],
                attachmentBuilder: attachmentBuilder,
              ),
            ),
          ],
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 357 / 282,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _VisualAttachment(
              attachment: attachments[0],
              attachmentBuilder: attachmentBuilder,
            ),
          ),
          const Gap(3),
          Expanded(
            child: _VisualAttachment(
              attachment: attachments[1],
              attachmentBuilder: attachmentBuilder,
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualAttachment3<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment3({
    required this.attachments,
    required this.attachmentBuilder,
  });

  final List<TVisualAttachment> attachments;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 357 / 282,
      child: Row(
        children: [
          Expanded(
            child: _VisualAttachment(
              attachment: attachments[0],
              attachmentBuilder: attachmentBuilder,
            ),
          ),
          const Gap(3),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[1],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[2],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualAttachment4<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment4({
    required this.attachments,
    required this.attachmentBuilder,
  });

  final List<TVisualAttachment> attachments;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 357 / 425,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 282,
                  child: _VisualAttachment(
                    attachment: attachments[0],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
                const Gap(3),
                Expanded(
                  flex: 139,
                  child: _VisualAttachment(
                    attachment: attachments[3],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
              ],
            ),
          ),
          const Gap(3),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 139,
                  child: _VisualAttachment(
                    attachment: attachments[1],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
                const Gap(3),
                Expanded(
                  flex: 282,
                  child: _VisualAttachment(
                    attachment: attachments[2],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualAttachment5<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment5({
    required this.attachments,
    required this.attachmentBuilder,
  });

  final List<TVisualAttachment> attachments;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 357 / 425,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[0],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: _VisualAttachment(
                          attachment: attachments[1],
                          attachmentBuilder: attachmentBuilder,
                        ),
                      ),
                      const Gap(3),
                      Expanded(
                        child: _VisualAttachment(
                          attachment: attachments[2],
                          attachmentBuilder: attachmentBuilder,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(3),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[3],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[4],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualAttachment6<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment6({
    required this.attachments,
    required this.attachmentBuilder,
  });

  final List<TVisualAttachment> attachments;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 357 / 425,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[0],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[1],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
              ],
            ),
          ),
          const Gap(3),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[2],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[3],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
              ],
            ),
          ),
          const Gap(3),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[4],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: _VisualAttachment(
                    attachment: attachments[5],
                    attachmentBuilder: attachmentBuilder,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualAttachment7<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment7({
    required this.attachments,
    required this.attachmentBuilder,
  });

  final List<TVisualAttachment> attachments;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 357 / 494,
      child: Column(
        children: [
          Expanded(
            flex: 421,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 282,
                        child: attachmentBuilder(attachments[0]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[1]),
                      ),
                    ],
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[2]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 282,
                        child: attachmentBuilder(attachments[3]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(3),
          Expanded(
            flex: 65,
            child: Row(
              children: [
                Expanded(child: attachmentBuilder(attachments[4])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[5])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[6])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualAttachment8<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment8({
    required this.attachments,
    required this.attachmentBuilder,
  });

  final List<TVisualAttachment> attachments;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 357 / 494,
      child: Column(
        children: [
          Expanded(
            flex: 421,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 282,
                        child: attachmentBuilder(attachments[0]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[1]),
                      ),
                    ],
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[2]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[3]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[4]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(3),
          Expanded(
            flex: 65,
            child: Row(
              children: [
                Expanded(child: attachmentBuilder(attachments[5])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[6])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[7])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualAttachment9<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment9({
    required this.attachments,
    required this.attachmentBuilder,
  });

  final List<TVisualAttachment> attachments;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 357 / 494,
      child: Column(
        children: [
          Expanded(
            flex: 421,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 282,
                        child: attachmentBuilder(attachments[0]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[1]),
                      ),
                    ],
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[2]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[3]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[4]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(3),
          Expanded(
            flex: 65,
            child: Row(
              children: [
                Expanded(child: attachmentBuilder(attachments[5])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[6])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[7])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[8])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualAttachment10<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment10({
    required this.attachments,
    required this.attachmentBuilder,
  });

  final List<TVisualAttachment> attachments;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 357 / 494,
      child: Column(
        children: [
          Expanded(
            flex: 421,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 282,
                        child: attachmentBuilder(attachments[0]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[1]),
                      ),
                    ],
                  ),
                ),
                const Gap(3),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[2]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[3]),
                      ),
                      const Gap(3),
                      Expanded(
                        flex: 139,
                        child: attachmentBuilder(attachments[4]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(3),
          Expanded(
            flex: 65,
            child: Row(
              children: [
                Expanded(child: attachmentBuilder(attachments[5])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[6])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[7])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[8])),
                const Gap(3),
                Expanded(child: attachmentBuilder(attachments[9])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualAttachment<TVisualAttachment extends Object>
    extends StatelessWidget {
  const _VisualAttachment({
    required this.attachment,
    required this.attachmentBuilder,
  });

  final TVisualAttachment attachment;
  final Widget Function(TVisualAttachment attachment) attachmentBuilder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: attachmentBuilder(attachment),
    );
  }
}
