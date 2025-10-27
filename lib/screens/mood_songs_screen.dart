import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Song {
  final String title;
  final String artist;
  final String url;

  Song({required this.title, required this.artist, required this.url});
}

final Map<String, List<Song>> moodSongs = {
  'overwhelmed': [
    Song(
      title: 'Weightless',
      artist: 'Marconi Union',
      url: 'https://open.spotify.com/track/6EjvHYAVs3C3jImtbAcKmu',
    ),
    Song(
      title: 'Lovely',
      artist: 'Billie Eilish, Khalid',
      url: 'https://open.spotify.com/track/0u2P5u6lvoDfwTYjAADbn4',
    ),
    Song(
      title: 'Lost Boy',
      artist: 'Ruth B.',
      url: 'https://open.spotify.com/track/0HqZX76SFLDz2aW8aiqi7G',
    ),
  ],
  'hopeful': [
    Song(
      title: 'Rise Up',
      artist: 'Andra Day',
      url: 'https://open.spotify.com/track/1fDsrQ23eTAVFElUMaf38X',
    ),
    Song(
      title: 'Shake It Off',
      artist: 'Taylor Swift',
      url: 'https://open.spotify.com/track/5GorFaKkP2mLREQvhSblIg',
    ),
    Song(
      title: 'Hall of Fame',
      artist: 'The Script ft. will.i.am',
      url: 'https://open.spotify.com/track/6mFbGH4QEozKKv1sFvf3hF',
    ),
  ],
  'angry': [
    Song(
      title: 'Numb',
      artist: 'Linkin Park',
      url: 'https://open.spotify.com/track/2nLtzopw4rPReszdYBJU6h',
    ),
    Song(
      title: 'Stronger',
      artist: 'Kanye West',
      url: 'https://open.spotify.com/track/5xTtaWoae3wi06K5WfVUUH',
    ),
    Song(
      title: 'DNA.',
      artist: 'Kendrick Lamar',
      url: 'https://open.spotify.com/track/6HZILIRieu8S0iqY8kIKhj',
    ),
  ],
  'content': [
    Song(
      title: 'Banana Pancakes',
      artist: 'Jack Johnson',
      url: 'https://open.spotify.com/track/1rfofaqEpACxVEHIZBJe6W',
    ),
    Song(
      title: 'Better Together',
      artist: 'Jack Johnson',
      url: 'https://open.spotify.com/track/5zUwI9W8yOLwT0XKzGHfOq',
    ),
    Song(
      title: 'Put Your Records On',
      artist: 'Corinne Bailey Rae',
      url: 'https://open.spotify.com/track/6HCNSY0Rxi3cg53xreoAIm',
    ),
  ],
  'tired': [
    Song(
      title: 'Breathe Me',
      artist: 'Sia',
      url: 'https://open.spotify.com/track/2gOj3Ozyq9MUnFtqkHk3XH',
    ),
    Song(
      title: 'Let Her Go',
      artist: 'Passenger',
      url: 'https://open.spotify.com/track/2jyjhRf6DVbMPU5zxagN2h',
    ),
    Song(
      title: 'River Flows In You',
      artist: 'Yiruma',
      url: 'https://open.spotify.com/track/3CkvROUTQ6nRi9yQOcsB50',
    ),
  ],
  'guilty': [
    Song(
      title: 'Apologize',
      artist: 'OneRepublic',
      url: 'https://open.spotify.com/track/2f7dV9f5rH9OZxU1Wg93aA',
    ),
    Song(
      title: 'Let It Go',
      artist: 'James Bay',
      url: 'https://open.spotify.com/track/6VsvKPJ4xjVNKpI8VVZ3SV',
    ),
    Song(
      title: 'Sorry',
      artist: 'Justin Bieber',
      url: 'https://open.spotify.com/track/09CtPGIpYB4BrO8qb1RGsF',
    ),
  ],
  'proud': [
    Song(
      title: 'Eye of the Tiger',
      artist: 'Survivor',
      url: 'https://open.spotify.com/track/2KH16WveTQWT6KOG9Rg6e2',
    ),
    Song(
      title: 'Unstoppable',
      artist: 'Sia',
      url: 'https://open.spotify.com/track/1yvMUkIOTeUNtNWlWRgANS',
    ),
    Song(
      title: 'Confident',
      artist: 'Demi Lovato',
      url: 'https://open.spotify.com/track/18xfL5bAbwy1IhIOaaHf57',
    ),
  ],
  'anxious': [
    Song(
      title: 'Fix You',
      artist: 'Coldplay',
      url: 'https://open.spotify.com/track/6KuQTIu1KoTTkLXKrwlLp9',
    ),
    Song(
      title: 'Somewhere Only We Know',
      artist: 'Keane',
      url: 'https://open.spotify.com/track/3CzFZzGJyzCYqG9DsR9x4t',
    ),
    Song(
      title: 'Safe and Sound',
      artist: 'Taylor Swift ft. The Civil Wars',
      url: 'https://open.spotify.com/track/1lDWb6b6ieDQ2xT7ewTC3G',
    ),
  ],
  'empty': [
    Song(
      title: 'Someone Like You',
      artist: 'Adele',
      url: 'https://open.spotify.com/track/4kflIGfjdZJW4ot2ioixTB',
    ),
    Song(
      title: 'All I Want',
      artist: 'Kodaline',
      url: 'https://open.spotify.com/track/5kqIPrATaCc2LqxVWzQGbk',
    ),
    Song(
      title: 'Skinny Love',
      artist: 'Birdy',
      url: 'https://open.spotify.com/track/2nGFzvICaeEWjIrBrL2RAx',
    ),
  ],
  'peaceful': [
    Song(
      title: 'Clair de Lune',
      artist: 'Debussy',
      url: 'https://open.spotify.com/track/3xKsf9qdS1CyvXSMEid6g8',
    ),
    Song(
      title: 'Saturn',
      artist: 'Sleeping at Last',
      url: 'https://open.spotify.com/track/7iN1s7xHE4ifF5povM6A48',
    ),
    Song(
      title: 'Bloom',
      artist: 'The Paper Kites',
      url: 'https://open.spotify.com/track/6ReNm1M5BXMDTyvEYWpZKQ',
    ),
  ],
};

class MoodSongsScreen extends StatelessWidget {
  final String mood;

  const MoodSongsScreen({Key? key, required this.mood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Song>? songs = moodSongs[mood.toLowerCase()];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Songs for \"$mood\"",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: songs == null
            ? const Center(
          child: Text(
            "No songs found for this mood.",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple.shade200,
                  child: const Icon(Icons.music_note,
                      color: Colors.white, size: 26),
                ),
                title: Text(
                  song.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  song.artist,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 15,
                  ),
                ),
                trailing:
                const Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
                onTap: () => _launchURL(song.url),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        label: const Text(
          "Open Spotify",
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        icon: const Icon(Icons.open_in_new, color: Colors.deepPurple),
        onPressed: () {
          if (songs != null && songs.isNotEmpty) {
            _launchURL(songs.first.url);
          }
        },
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
