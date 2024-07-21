class Track {
  final String trackName;
  final String artist;
  final String imageUrl;

  Track({
    required this.trackName,
    required this.artist,
    required this.imageUrl,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    trackName: json["name"],
    artist: json["artist"]["name"],
    imageUrl: json["image"][3]["#text"],
  );
}