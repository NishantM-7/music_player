class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });
  static List<Song> songs = [
    Song(
      title: 'Raatan Lambiyan',
      description: 'Raatan Lambiyan',
      url: 'assets/music/Raatan_Lambiyan.mp3',
      coverUrl: 'assets/images/song1.jpg',
    ),
    Song(
      title: 'Ajab Si',
      description: 'Ajab Si',
      url: 'assets/music/Ajab_Si.mp3',
      coverUrl: 'assets/images/song2.jpg',
    ),
    Song(
      title: 'Qaafirana',
      description: 'Qaafirana',
      url: 'assets/music/Qaafirana.mp3',
      coverUrl: 'assets/images/song3.jpg',
    ),
    Song(
      title: 'Aal Izz Well',
      description: 'Aal Izz Well',
      url: 'assets/music/Aal_izz_well.mp3',
      coverUrl: 'assets/images/song4.jpg',
    ),
  ];
}
