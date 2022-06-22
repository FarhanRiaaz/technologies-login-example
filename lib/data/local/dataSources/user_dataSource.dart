
import 'package:sembast/sembast.dart';
import 'package:technologies_login_example/data/local/constants.dart';
import 'package:technologies_login_example/domain/models/login/login_response.dart';

class UserDataSource {
  final _usersInfo = intMapStoreFactory.store(DBConstants.USER_INFO_STORE);

  // database instance
  final Future<Database> _db;

  // Constructor
  UserDataSource(this._db);

  // DB functions:--------------------------------------------------------------

  Future<int?> insertOrUpdate(User item) async => _insertOrUpdate(item);

  Future<int?> _insertOrUpdate(User item, {bool log = true}) async {
    return await find(filter: Filter.equals(DBConstants.FIELD_ID, item.id))
        .then((list) => list.isEmpty ? _insert(item, log: log) : nothing(item));
  }

  Future<int> nothing(User item) async {
    return 0;
  }

  Future<int?> _insert(User item, {bool log = true}) async {
    return await _usersInfo
        .record(item.id!)
        .add(await _db, item.toJson());
  }

  Future<List<User>> find({Filter? filter}) async {
    // fetching data
    final recordSnapshots =
    await _usersInfo.find(await _db, finder: Finder(filter: filter));
    if (recordSnapshots.isNotEmpty) {
      return recordSnapshots.map((snapshot) {
        final userInfo = User.fromMap(snapshot.value);
        userInfo.id = snapshot.key;
        return userInfo;
      }).toList();
    } else {
      return [];
    }
  }

  Future<List<User>> getUserInfo() async {
    final finder = Finder(limit: 1);
    final recordSnapshots = await _usersInfo.find(
      await _db,
      finder: finder,
    );
    return recordSnapshots.map((snapshot) {
      final userInfo = User.fromMap(snapshot.value);
      return userInfo;
    }).toList();
  }
}
