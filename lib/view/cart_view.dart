import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubit/books_cubit.dart';
import 'package:graduation_project/model/widgets/customized_book_view_model.dart';
import 'package:graduation_project/model/widgets/customized_elevatedbutton.dart';
import 'package:graduation_project/model/widgets/customized_text.dart';
import 'package:graduation_project/model/widgets/customized_textfield.dart';
import 'package:graduation_project/view/no_cart_view.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  int i = 0;
  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<BooksCubit>(context);
    return BlocBuilder<BooksCubit, BooksState>(builder: (contex, state) {
      if (myCubit.cartList.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomizedText(
                    text: "Cart",
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title:
                                    const Text("sure want to delete all cart?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No")),
                                  TextButton(
                                      onPressed: () {
                                        myCubit.deleteAllCart();
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Yes")),
                                ],
                              );
                            });
                      },
                      icon: const FaIcon(FontAwesomeIcons.trash))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: myCubit.cartList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  i = index;
                  return Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (value) {
                            myCubit.deleteItemFromCart(index);
                          },
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (value) {},
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                    child: Container(
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
                            child: Image(
                                image: NetworkImage(
                                    '${myCubit.cartList[index].book.image.toString()}')),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Text(
                                    "${myCubit.cartList[index].book.title.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 150,
                                  child: Text(
                                    "${myCubit.cartList[index].book.subTitle.toString()}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        myCubit.addItem(index);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "+",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3))),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    CustomizedText(
                                        text:
                                            "${myCubit.cartList[index].count}",
                                        fontSize: 18,
                                        color: Colors.white),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        myCubit.minusItem(index);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "-",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3))),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${myCubit.cartList[index].book.price}\$",
                            style: TextStyle(fontSize: 18, color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomizedText(
                          text: "Amount price",
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9)),
                      CustomizedText(
                          text: "${myCubit.calculateTotalPrice()}\$",
                          fontSize: 20,
                          color: Colors.white),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      myCubit.calculateTotalPrice();
                      showBottomSheet(
                          enableDrag: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 400,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Form(
                                  child: ListView(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CustomizedText(
                                              text: "Contact details",
                                              fontSize: 16,
                                              color: Colors.white),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.arrowRight))
                                        ],
                                      ),
                                      const CustomizedTextfield(title: 'name'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const CustomizedTextfield(
                                          title: 'mobile No'),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const CustomizedText(
                                          text: "Address details",
                                          fontSize: 16,
                                          color: Colors.white),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const CustomizedTextfield(
                                          title:
                                              'Address (house No ,Building ,street,area)'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const CustomizedTextfield(title: 'City'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              CustomizedText(
                                                  text:
                                                      "No of item: ${myCubit.getTotalCountOfItem()}",
                                                  fontSize: 12,
                                                  color: Colors.white),
                                              CustomizedText(
                                                  text:
                                                      "${myCubit.calculateTotalPrice()}\$",
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ],
                                          ),
                                          CustoomizedElevatedButton(
                                              onPressed: () {},
                                              text: "Order now"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        CustomizedText(
                            text: "Check out ",
                            fontSize: 14,
                            color: Colors.white),
                        Expanded(
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Text(
                              "${myCubit.cartList.length}",
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.4, 55),
                      backgroundColor: primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      } else {
        return NoCartView();
      }
    });
  }
}
