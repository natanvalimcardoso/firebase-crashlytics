import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String title;
  final IconData icons;
  final  Widget route;

  const FeatureItem(
      {Key? key, required this.title, required this.icons, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => route),
          );
        },
        child: Ink(
          padding: const EdgeInsets.all(8), //* Interessante
          width: 150,
          color: Theme.of(context).colorScheme.primary, //* Interessante
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icons,
                color: Colors.white,
                size: 32, //* Interessante
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
