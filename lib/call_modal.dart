class Item {
  Item(
      {required this.title,
        required this.title1,
        required this.image,
        required this.time});
  final String title;
  final String title1;
  final String image;
  final DateTime time;
}

List<Item> items = <Item>[
  Item(
      title: 'Tony Stark',
      title1: 'Flutter is great',
      image: 'assets/tony.png',
      time: DateTime.now()),
  Item(
      title: 'Captain America',
      title1: 'Hey There!',
      image: 'assets/captain.jpg',
      time: DateTime.now()),
  Item(
      title: 'Thor',
      title1: 'Done',
      image: 'assets/thor.png',
      time: DateTime.now()),
  Item(
      title: 'Thanos',
      title1: 'Ready for fight?',
      image: 'assets/thonas.png',
      time: DateTime.now()),
  Item(
      title: 'Hulk',
      title1: 'I throwed my phone because I am angry....',
      image: 'assets/hulk.png',
      time: DateTime.now()),
  Item(
      title: 'Dr.Strange',
      title1: "It's magic",
      image: 'assets/dr.png',
      time: DateTime.now()),
  Item(
      title: 'Spider Man',
      title1: 'You are my friend',
      image: 'assets/spider.png',
      time: DateTime.now()),
  Item(
      title: 'Ant Man',
      title1: 'You are mine fellow',
      image: 'assets/ant.png',
      time: DateTime.now()),
  Item(
      title: 'Hawkeye',
      title1: 'Keep your eyes open....',
      image: 'assets/hawkeye.png',
      time: DateTime.now()),
];
