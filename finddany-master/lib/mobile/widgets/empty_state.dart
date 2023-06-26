import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/state/ui_manager.dart';
import 'button.dart';

class EmptyState extends StatelessWidget {
  final String path;
  final String title;
  final String description;
  final String textButton;
  final VoidCallback? onClick;

  const EmptyState(
      {Key? key,
      this.path = '',
      this.title = 'Upss',
      this.description = 'Something went wrong',
      this.onClick,
      this.textButton = 'Click'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 65),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage(path)),
            Center(
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
            ),
            const SizedBox(height: 20),
            Center(
                child: Text(
              description,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
            )),
            const SizedBox(height: 24),
            context.watch<UiProvider>().loading
                ? CupertinoActivityIndicator(
                    radius: 30,
                    color: Colors.blue.shade900,
                  )
                : MediumButton(
                    onClick: onClick,
                    text: textButton,
                  ),
          ],
        ),
      ),
    );
  }
}
