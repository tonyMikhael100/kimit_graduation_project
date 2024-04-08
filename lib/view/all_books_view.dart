import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/customized_text.dart';

class AllBooksView extends StatelessWidget {
  const AllBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomizedText(text: "All Books", fontSize: 26),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Row(
              
              children: [
                Container(
                  width: 160,
                  height: 250,
                  color: Colors.blue,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "book name",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      " lorem kfa;jfkj;adsfaksjfakhffhj",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
