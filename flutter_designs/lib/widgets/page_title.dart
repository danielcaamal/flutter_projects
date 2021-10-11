import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transactions",
              style:
                  TextStyle(color: Colors.white, fontSize: media.width * 0.10),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Classify this transactions into particular categories",
              style:
                  TextStyle(color: Colors.white, fontSize: media.width * 0.045),
            )
          ],
        ),
      ),
    );
  }
}
