class OnboardingModel {
  String image;
  String text;
  String title;

  OnboardingModel(
      {required this.image, required this.text, required this.title});

  static List<OnboardingModel> list = [
    OnboardingModel(
        image: "assets/images/pick_&_pay.png",
        title: "Cook",
        text:
            "cooking your favorite recipe became easy now, you just need to follow the steps"),
    OnboardingModel(
        image: "assets/images/shopping-basket.png",
        title: "Enjoy",
        text:
            "Start with foods/recipes you enjoy. search for the foods you know you like, find a trusted recipe source"),
    OnboardingModel(
        image: "assets/images/pick_&_pay.png",
        title: "Be confident",
        text:
            "You can do this. Step up to the cutting board, the oven, or the stovetop with full confidence in your abilities")
  ];
}
