class Location {
  final String location, icon, tempMin, tempMax, image, status;
  Location({
    required this.location,
    required this.icon,
    required this.tempMin,
    required this.tempMax,
    required this.image,
    required this.status,
  });
}

const String icon = "assets/icons/ic_location.png";
List<Location> locationCustom = [
  Location(
    location: 'Malang',
    icon: icon,
    tempMin: '20°',
    tempMax: '24°',
    image: 'assets/images/img_heavy_rain.png',
    status: 'Heavy rain',
  ),
  Location(
    location: 'Banyuwangi',
    icon: icon,
    tempMin: '22°',
    tempMax: '26°',
    image: 'assets/images/img_heavy_rain.png',
    status: 'Heavy rain',
  ),
  Location(
    location: 'Jokarta',
    icon: icon,
    tempMin: '27°',
    tempMax: '28°',
    image: 'assets/images/img_cloudy.png',
    status: 'Cloudy',
  ),
];
