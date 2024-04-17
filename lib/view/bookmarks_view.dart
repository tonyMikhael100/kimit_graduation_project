import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/model/widgets/customized_book_view_model.dart';
import 'package:graduation_project/model/widgets/customized_text.dart';

class BookmarkView extends StatefulWidget {
  BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomizedText(
                text: "Bookmarks",
                fontSize: 24,
                color: Colors.white,
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("sure want to delete all bookmarks ?"),
                            actions: [
                              TextButton(onPressed: () {}, child: Text("No")),
                              TextButton(onPressed: () {}, child: Text("yes")),
                            ],
                          );
                        });
                  },
                  icon: FaIcon(FontAwesomeIcons.trash))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 20,
          ),
          Slidable(
            key: const ValueKey(0),

            // The start action pane is the one at the left or the top side.
            endActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),
              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (value) {},
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (value) {},
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
              ],
            ),
            child: const CustomizedBookViewModel(
              bookName: "bla bla",
              description: "bla bla bla bla bala ",
              image: "https://itbook.store/img/books/9781491954249.png",
              price: 15.5,
            ),
          ),
        ],
      ),
    );
  }
}
