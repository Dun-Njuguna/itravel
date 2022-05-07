import '../utils/constants.dart';

class Slider {
  final String sliderImage;
  final String title;
  final String subTitle;
  final String description;

  Slider({
    required this.sliderImage,
    required this.title,
    required this.subTitle,
    required this.description,
  });
  
}

List<Slider> sliders = [
  Slider(
    sliderImage: welcomeImages[0],
    title: "Trips",
    subTitle: "Discover",
    description:
        "Mountain hiking embodies what hiking is all about: breathtaking views, fresh air, and a good workout.",
  ),
    Slider(
    sliderImage: welcomeImages[1],
    title: "Trips",
    subTitle: "Discover",
    description:
        "Mountain hiking embodies what hiking is all about: breathtaking views, fresh air, and a good workout.",
  ),
];