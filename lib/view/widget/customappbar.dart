import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedsearch;
  const CustomAppBar(
      {super.key,
      required this.titleappbar,
      this.onPressedIcon,
      this.onPressedsearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
                prefix: IconButton(
                  onPressed: onPressedsearch,
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[600],
                  ),
                ),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IconButton(
                onPressed: onPressedIcon,
                icon: Icon(
                  Icons.notifications_active_outlined,
                  size: 30,
                  color: Colors.grey[600],
                )),
          ),
        ],
      ),
    );
  }
}
