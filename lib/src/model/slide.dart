class Slide {
  final String imageUrl;
  // final String title;
  // final String descrption;

  Slide({
    required this.imageUrl,
    // required this.title,
    // required this.descrption,
  });
}

final slideList = [
  Slide(imageUrl: 'assets/lottie/getting-started-coch.json'),
  Slide(imageUrl: 'assets/lottie/getting-started-lifestyle.json'),
  Slide(imageUrl: 'assets/lottie/getting-started-treadmill.json'),
];

// final slideList = [
//   Slide(imageUrl: 'assets/lottie/getting-started-coch.json', title: '환영합니다', descrption: '2022-1 DoiT! Flutter 스터디 연습 중입니다.'),
//   Slide(imageUrl: 'assets/lottie/getting-started-lifestyle.json', title: '어서오세요', descrption: '2022-1 DoiT! Flutter 스터디 연습 중입니다.'),
//   Slide(imageUrl: 'assets/lottie/getting-started-treadmill.json', title: '함께해요', descrption: '2022-1 DoiT! Flutter 스터디 연습 중입니다.'),
// ];