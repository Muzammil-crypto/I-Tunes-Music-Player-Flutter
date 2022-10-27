import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: Text(
            "Select Song",
            style: TextStyle(color: ThemeHelper.accentColor),
          ),
        ),
      ),
    );
  }
}
