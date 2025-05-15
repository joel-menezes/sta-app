import 'package:cloud_firestore/cloud_firestore.dart';

class Song implements Comparable<Song> {
  final String name;
  final String artist;
  List<String> votes = [];
  String? id;

  Song(this.name, this.artist, this.votes, [this.id]);

  void addVote(String vote) async {
    if (!votes.contains(vote))
      votes.add(vote);
    else
      votes.remove(vote);

    DocumentReference docRef =
        FirebaseFirestore.instance.collection('newSongs').doc(id);

    await docRef.update({
      'name': name,
      'artist': artist,
      'votes': votes,
    }).then((value) {
      print("Song updated successfully!");
    }).catchError((error) {
      print("Failed to update song: $error");
    });
  }

  bool hasVoted(String vote) {
    if (!votes.contains(vote))
      return false;
    else
      return true;
  }

  @override
  int compareTo(Song other) {
    return other.votes.length.compareTo(this.votes.length);
  }
}
