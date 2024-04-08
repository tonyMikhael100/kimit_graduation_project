import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/widgets/customized_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 30,
                    alignment: isDark ? Alignment.topLeft : Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: primaryColor,
                  backgroundImage: const AssetImage('assets/images/avatar.png'),
                  radius: 22,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Welcome back, Tony!",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "What do you want to read today?",
              style: GoogleFonts.poppins(
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
                hintText: "search",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic_sharp),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomizedText(
              text: "Hot",
              fontSize: 24,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.44,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 25,
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 160,
                            height: 250,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const Text(
                            "book name ",
                            style: TextStyle(fontSize: 16),
                          ),
                          const Text(
                            "fantasy",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      );
                    })),
              ),
            ),
            const CustomizedText(
              text: "New Arrivals",
              fontSize: 24,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.44,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 25,
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 160,
                            height: 250,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const Text(
                            "book name ",
                            style: TextStyle(fontSize: 16),
                          ),
                          const Text(
                            "fantasy",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      );
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
