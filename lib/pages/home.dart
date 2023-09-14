import 'package:first_project/models/category_model.dart';
import 'package:first_project/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();

    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          _seachBar(),
          const SizedBox(height: 40),
          _categorySection(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          _popularSection(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Column _popularSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Popular',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            ListView.separated(
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                DietModel diet = diets[index];
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diet.iconPath, height: 45, width: 45),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            diet.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${diet.level} | ${diet.duration} | ${diet.calorie}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff786F72),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Clickeado ${diet.name}');
                        },
                        child: SvgPicture.asset(
                          'assets/icons/arrow-right.svg',
                          width: 30,
                          height: 30,
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 25),
              shrinkWrap: true,
              itemCount: diets.length,
            ),
          ],
        );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recomendation\nfor Diet',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          // color: Colors.blueAccent,
          height: 240,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              DietModel diet = diets[index];
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        diet.iconPath,
                        height: 75,
                        width: 75,
                      ),
                    ),
                    Text(
                      diet.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    Text(
                      '${diet.level} | ${diet.duration} | ${diet.calorie}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              diet.viewIsSelected
                                  ? const Color(0xff9DCEFF)
                                  : Colors.transparent,
                              diet.viewIsSelected
                                  ? const Color(0xff92A3FD)
                                  : Colors.transparent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                              color: diet.viewIsSelected
                                  ? Colors.white
                                  : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _seachBar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: const Color(0xff1D1617).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search Pancake',
          hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              height: 15,
              width: 15,
              colorFilter:
                  const ColorFilter.mode(Color(0xffDDDADA), BlendMode.srcIn),
            ),
          ),
          suffixIcon: IntrinsicHeight(
            child: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      height: 15,
                      width: 15,
                      colorFilter: const ColorFilter.mode(
                          Color(0xffDDDADA), BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // prefixIcon: Padding(
          //   padding: const EdgeInsets.all(12),
          //   child: SvgPicture.asset('assets/icons/dots.svg'),
          // ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          print("Tapping");
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/arrow-left.svg',
              height: 20, width: 20),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print("Otro Tapping");
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 15,
              width: 15,
            ),
          ),
        )
      ],
    );
  }
}
