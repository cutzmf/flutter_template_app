import 'contact.dart';

class Recommendation {
  final Contact target;
  final Contact creator;

  Recommendation(this.target, this.creator);
}

abstract class RecommendationCollection {
  void add(Recommendation recommendation);

  Set<Recommendation> by(Contact contact);

  Set<Recommendation> of(Contact contact);
}
