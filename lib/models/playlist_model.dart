import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;
  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Romantic Mix',
      songs: Song.songs,
      imageUrl: 'assets/images/playlist1.jpeg',
    ),
    Playlist(
      title: 'Romantic Mix',
      songs: Song.songs,
      imageUrl: 'assets/images/playlist2.jpg',
    ),
    Playlist(
      title: 'Romantic Mix',
      songs: Song.songs,
      imageUrl: 'assets/images/playlist3.jpeg',
    ),
  ];
}
