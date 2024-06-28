import 'package:rich_text_view/rich_text_view.dart';

/// RegEx pattern for bold text.
const boldPattern = r'\*\*(.*?)\*\*';

/// RegEx pattern for italic text.
const italicPattern = r'\*.*?\*';

/// RegEx pattern for urls.
const urlPattern =
    r"\b((?:(?:https?://)?(?:www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/))(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s\!()\[\]{};:'\.,<>?«»“”‘’]))";

/// {template bold_parser}
/// A bold parser for Text.
/// {endtemplate}
class BoldParser extends ParserType {
  /// {macro bold_parser}
  BoldParser({super.onTap, super.style, String super.pattern = boldPattern}) {
    renderText = ({String? str}) {
      return Matched(
        display: str?.substring(2, str.length - 2),
        value: str?.substring(2, str.length - 2),
      );
    };
  }
}

/// {template url_parser}
/// An italic parser for Text.
/// {endtemplate}
class ItalicParser extends ParserType {
  /// {macro url_parser}
  ItalicParser({
    super.onTap,
    super.style,
    String super.pattern = italicPattern,
  }) {
    renderText = ({String? str}) {
      return Matched(
        display: str?.substring(1, str.length - 1),
        value: str?.substring(1, str.length - 1),
      );
    };
  }
}

/// {template profile_mention_parser}
/// A profile mention parser for Text.
/// {endtemplate}
class ProfileMentionParser extends ParserType {
  /// {macro profile_mention_parser}
  ProfileMentionParser({
    required super.pattern,
    super.onTap,
    super.style,
  });
}

/// {template club_mention_parser}
/// A club mention parser for Text.
/// {endtemplate}
class ClubMentionParser extends ParserType {
  /// {macro club_mention_parser}
  ClubMentionParser({
    required super.pattern,
    super.onTap,
    super.style,
  });
}
