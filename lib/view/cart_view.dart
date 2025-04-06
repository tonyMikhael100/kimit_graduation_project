import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubits/books_cubit/books_cubit.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:graduation_project/view/widgets/customized_book_view_model.dart';
import 'package:graduation_project/view/widgets/customized_elevatedbutton.dart';
import 'package:graduation_project/view/widgets/customized_text.dart';
import 'package:graduation_project/view/widgets/customized_textfield.dart';
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
                  CustomizedText(
                    text: S.of(context).Cart,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    S.of(context).sure_want_to_delete_allcart),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(S.of(context).no)),
                                  TextButton(
                                      onPressed: () {
                                        myCubit.deleteAllCart();
                                        Navigator.pop(context);
                                      },
                                      child: Text(S.of(context).yes)),
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
                          label: S.of(context).delete,
                        ),
                        SlidableAction(
                          onPressed: (value) {},
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.share,
                          label: S.of(context).share,
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
                          text: S.of(context).Amount_price,
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
                                          CustomizedText(
                                              text:
                                                  S.of(context).contact_details,
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
                                      CustomizedTextfield(
                                          title: S.of(context).name),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomizedTextfield(
                                          title: S.of(context).mobile_No),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomizedText(
                                          text: S.of(context).Address_details,
                                          fontSize: 16,
                                          color: Colors.white),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomizedTextfield(
                                          title: S
                                              .of(context)
                                              .address_house_building),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomizedTextfield(
                                          title: S.of(context).city),
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
                                                      "${S.of(context).No_of_item} ${myCubit.getTotalCountOfItem()}",
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              onPressed: () {},
                                              text: S.of(context).Order_now),
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
                            text: S.of(context).Check_out,
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
