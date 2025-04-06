import 'package:flutter/material.dart';
import 'package:graduation_project/constant.dart';

class CustomizedBookViewModel extends StatelessWidget {
  final String image;
  final String bookName;
  final String description;
  final String price;

  const CustomizedBookViewModel({
    super.key,
    required this.image,
    required this.bookName,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 5,
              color: Colors.grey.withOpacity(0.1))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 160,
            child: Hero(
                tag: '${bookName}',
                child: Image(image: NetworkImage('${image}'))),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    "${bookName}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  child: Text(
                    "${description}",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${price}\$",
            style: TextStyle(fontSize: 18, color: primaryColor),
          ),
        ],
      ),
    );
  }
}
