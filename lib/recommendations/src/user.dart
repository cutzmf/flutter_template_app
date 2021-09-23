import 'contact.dart';
import 'profile.dart';
import 'recommendation.dart';

abstract class UserStub implements Contact {
  Set<Recommendation> get wasRecommended;
}

abstract class User implements UserStub {
  Set<Recommendation> get hadRecommended;

  void recommend(UserStub userStub, String name);
}

abstract class UserCollection {
  void add(User user);
}

class UserImpl implements User {
  final RecommendationCollection _recommendationCollection;
  final ContactsCollection _contactsCollection;
  final ProfileFactory _profileFactory;

  UserImpl(this._recommendationCollection, this._contactsCollection, this._profileFactory);

  @override
  Set<Recommendation> get hadRecommended => _recommendationCollection.by(this);

  @override
  Set<Recommendation> get wasRecommended => _recommendationCollection.of(this);

  @override
  void recommend(Contact contact, String name) {
    final contactProfile = _profileFactory.create(contact, name);
    final recommendation = Recommendation(contact, this);
    _recommendationCollection.add(recommendation);
  }
}
