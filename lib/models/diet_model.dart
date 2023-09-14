class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/cake.svg',
        level: 'Easy',
        duration: '30mins',
        calorie: '180kCal',
        viewIsSelected: true));

    diets.add(DietModel(
        name: 'Asian Food',
        iconPath: 'assets/icons/bowl.svg',
        level: 'Medium',
        duration: '45mins',
        calorie: '350kCal',
        viewIsSelected: false));

    diets.add(DietModel(
        name: 'Pizza',
        iconPath: 'assets/icons/pizza.svg',
        level: 'Easy',
        duration: '40mins',
        calorie: '500kCal',
        viewIsSelected: false));

    diets.add(DietModel(
        name: 'Burguer',
        iconPath: 'assets/icons/burger.svg',
        level: 'Hard',
        duration: '15mins',
        calorie: '650kCal',
        viewIsSelected: false));
    return diets;
  }
}
