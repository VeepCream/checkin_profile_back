import 'package:conduit/managed_auth.dart';

import '../aqueducttest.dart';

class User extends ManagedObject<_User> implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  late String password;
}

class _User extends ResourceOwnerTableDefinition {
  @Column(unique: true)
  late String email;
}
