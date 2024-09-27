import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedsearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomAppBar(
      {super.key,
      required this.titleappbar,
      required this.onPressedIconFavorite,
      required this.onPressedsearch,
      this.onChanged,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 65,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
                prefixIcon: IconButton(
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
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: const Color.fromARGB(255, 221, 214, 214)),
          )),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 214, 214),
                borderRadius: BorderRadius.circular(10)),
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: IconButton(
                onPressed: onPressedIconFavorite,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                  color: Colors.grey[600],
                )),
          ),
        ],
      ),
    );
  }
}
