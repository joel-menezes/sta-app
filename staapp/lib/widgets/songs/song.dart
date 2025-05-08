class Song implements Comparable<Song> {
  final String name;
  final String artist;
  List<String> votes = [];

  Song(this.name, this.artist, this.votes);

  void addVote(String vote) {
    if (!votes.contains(vote))
      votes.add(vote);
    else
      votes.remove(vote);
  }

  @override
  int compareTo(Song other) {
    return other.votes.length.compareTo(this.votes.length);
  }
}
